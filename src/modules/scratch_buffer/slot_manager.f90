module slot_manager_module
    use, intrinsic :: iso_fortran_env, only : int64
    use, intrinsic :: iso_c_binding, only : &
            c_ptr, &
            c_null_ptr, &
            c_associated

    use :: ring_array_descriptor_module, only : ring_array_descriptor

    implicit none
    private

    public :: slot_manager

    type :: slot
        integer(int64) :: number_of_bytes
        type(c_ptr) :: address
        integer :: stat
        integer :: checkpoint
    end type slot

    type :: slot_manager
        type(slot), dimension(:), allocatable :: slots
        type(ring_array_descriptor) :: counter
    contains
        procedure :: initialize => initialize
        procedure :: add_slot => add_slot
        procedure :: have_slots_marked_for_destruction => have_slots_marked_for_destruction
        procedure :: clear_slots_associated_with_a_checkpoint => clear_slots_associated_with_a_checkpoint
        procedure :: mark_unmarked_slots_with_checkpoint => mark_unmarked_slots_with_checkpoint
        procedure :: reset => reset
        procedure :: cleanup => cleanup
        procedure :: mark_slot_for_destruction => mark_slot_for_destruction
        procedure :: find_slot => find_slot
        procedure :: has_more_slots => has_more_slots
        procedure :: clear_slot => clear_slot
        procedure :: clear => clear
    end type slot_manager

    interface slot_manager
        module procedure constructor_empty
        module procedure constructor
    end interface slot_manager

    integer, parameter :: CREATED=1, DESTROYED=2, UNUSED=3
contains
    function constructor_empty() result(this)
        type(slot_manager) :: this

        call this%clear()
    end function constructor_empty

    function constructor(number_of_simultaneous_slots) result(this)
        integer, intent(in) :: number_of_simultaneous_slots
        type(slot_manager) :: this

        this = slot_manager()
        this%counter = ring_array_descriptor(number_of_simultaneous_slots)
    end function constructor

    subroutine initialize(this)
        class(slot_manager), intent(inout) :: this

        allocate(this%slots(this%counter%array_size))
        call this%reset()
    end subroutine initialize

    subroutine mark_unmarked_slots_with_checkpoint(this, chk)
        class(slot_manager), intent(inout) :: this
        integer, intent(in) :: chk

        integer :: idx, slot

        do idx = 1, this%counter%elements_in_use
            slot = this%counter%get_array_index(idx)
            if ( this%slots(slot)%stat == DESTROYED .and. this%slots(slot)%checkpoint == 0 ) &
                    this%slots(slot)%checkpoint = chk
        end do
    end subroutine mark_unmarked_slots_with_checkpoint

    logical function have_slots_marked_for_destruction(this)
        class(slot_manager), intent(in) :: this

        integer :: idx, slot

        have_slots_marked_for_destruction = .false.

        if ( this%counter%elements_in_use > 0 ) then
            slot = this%counter%get_array_index(1)
            if ( this%slots(slot)%stat == DESTROYED ) &
                    have_slots_marked_for_destruction = .true.
        end if
    end function have_slots_marked_for_destruction

    logical function has_more_slots(this)
        class(slot_manager), intent(in) :: this

        integer :: idx

        has_more_slots = .not. this%counter%is_full()
        idx = this%counter%get_next_index()
        if ( has_more_slots ) &
                has_more_slots = this%slots(idx)%stat == UNUSED
    end function has_more_slots

    subroutine add_slot(this, data_pointer, number_of_bytes)
        class(slot_manager), intent(inout) :: this
        type(c_ptr), intent(in) :: data_pointer
        integer(int64), intent(in) :: number_of_bytes

        integer :: idx

        if ( .not. this%has_more_slots() ) &
                error stop "slot_manager::add_slot:No more slots"

        idx = this%counter%get_next_index()
        this%slots(idx)%address = data_pointer
        this%slots(idx)%number_of_bytes = number_of_bytes
        this%slots(idx)%stat = CREATED
        call this%counter%increase()
    end subroutine add_slot

    subroutine mark_slot_for_destruction(this, data_pointer)
        class(slot_manager), intent(inout) :: this
        type(c_ptr), intent(in) :: data_pointer

        integer :: slot

        slot = this%find_slot(data_pointer)
        if ( slot < 1 ) &
                error stop "slot_manager:mark_slot_for_destruction:Can't find slot."

        this%slots(slot)%stat = DESTROYED
    end subroutine mark_slot_for_destruction

    integer(int64) function clear_slots_associated_with_a_checkpoint(this, chk)
        class(slot_manager), intent(inout) :: this
        integer, intent(in) :: chk

        integer :: idx, slot, counter

        clear_slots_associated_with_a_checkpoint = 0
        counter = 0
        ! Will always clear from beginning of slots up to the final slot for this checkpoint.
        do idx = 1, this%counter%elements_in_use
            slot = this%counter%get_array_index(idx)
            if ( this%slots(slot)%checkpoint == chk) then
                clear_slots_associated_with_a_checkpoint = clear_slots_associated_with_a_checkpoint + &
                        this%slots(slot)%number_of_bytes
                call this%clear_slot(slot)
                counter = counter + 1
            else
                exit
            end if
        end do
        call this%counter%decrease(counter)
    end function clear_slots_associated_with_a_checkpoint

    subroutine clear_slot(this, slot)
        class(slot_manager), intent(inout) :: this
        integer, intent(in) :: slot

        this%slots(slot)%checkpoint = 0
        this%slots(slot)%stat = UNUSED
        this%slots(slot)%address = c_null_ptr
        this%slots(slot)%number_of_bytes = 0
    end subroutine clear_slot

    subroutine reset(this)
        class(slot_manager), intent(inout) :: this

        integer :: idx

        call this%counter%reset()

        do idx = 1, this%counter%array_size
            call this%clear_slot(idx)
        end do
    end subroutine reset

    integer function find_slot(this, ptr)
        class(slot_manager), intent(in) :: this
        type(c_ptr), intent(in) :: ptr

        integer :: idx, slot

        find_slot = 0
        do idx = 1, this%counter%elements_in_use
            slot = this%counter%get_array_index(idx)
            if ( c_associated(this%slots(slot)%address, ptr) ) then
                find_slot = slot
                return
            end if
        end do
    end function find_slot

    subroutine cleanup(this)
        class(slot_manager), intent(inout) :: this

        call this%reset()

        call this%counter%cleanup()

        if ( allocated(this%slots) ) deallocate(this%slots)

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(slot_manager), intent(inout) :: this

        this%counter = ring_array_descriptor()
    end subroutine clear
end module slot_manager_module
