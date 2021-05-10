module scratch_buffer_module
    use, intrinsic :: iso_fortran_env, only : int64

    use :: data_storage_module, only : data_storage
    use :: stream_module, only : stream
    use :: ring_buffer_module, only : ring_buffer
    use :: checkpoint_manager_module, only : checkpoint_manager
    use :: slot_manager_module, only : slot_manager

    implicit none
    private

    public :: scratch_buffer

    type :: scratch_buffer
        type(checkpoint_manager) :: checkpoints
        type(slot_manager) :: slots
        type(ring_buffer) :: buffer
    contains
        procedure :: allocate_storage_object => allocate_storage_object
        procedure :: initialize => initialize
        procedure :: reset => reset
        procedure :: create => create
        procedure :: destroy => destroy
        procedure :: checkpoint => checkpoint
        procedure :: cleanup => cleanup
        procedure :: clear => clear
        procedure :: wait_for_more_capacity => wait_for_more_capacity
        procedure :: clear_all_checkpoints => clear_all_checkpoints
        procedure :: clear_completed_checkpoints => clear_completed_checkpoints
    end type scratch_buffer

    interface scratch_buffer
        module procedure constructor_empty
        module procedure constructor
    end interface scratch_buffer

contains
    function constructor_empty() result(this)
        type(scratch_buffer) :: this

        call this%clear()
    end function constructor_empty

    function constructor(buffer, checkpoints, slots) result(this)
        type(ring_buffer), intent(in) :: buffer
        type(checkpoint_manager), intent(in) :: checkpoints
        type(slot_manager), intent(in) :: slots
        type(scratch_buffer) :: this

        this = scratch_buffer()

        this%buffer = buffer
        this%checkpoints = checkpoints
        this%slots = slots
    end function constructor

    subroutine allocate_storage_object(this, storage)
        class(scratch_buffer), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: storage

        call this%buffer%allocate_storage_object(storage)
    end subroutine allocate_storage_object

    subroutine initialize(this)
        class(scratch_buffer), intent(inout) :: this

        call this%buffer%allocate_buffer()
        call this%checkpoints%initialize()
        call this%slots%initialize()

        call this%reset()
    end subroutine initialize

    subroutine reset(this)
        class(scratch_buffer), intent(inout) :: this

        call this%checkpoints%reset()
        call this%slots%reset()
        call this%buffer%reset()
    end subroutine reset

    subroutine create(this, dta, number_of_bytes, initialize)
        class(scratch_buffer), intent(inout) :: this
        class(data_storage), intent(inout) :: dta
        integer(int64), intent(in) :: number_of_bytes
        logical, intent(in), optional :: initialize

        call this%wait_for_more_capacity(number_of_bytes)

        call this%buffer%add_buffer(dta, number_of_bytes, initialize)
        call this%slots%add_slot(dta%get_data_pointer(), dta%number_of_bytes)
    end subroutine create

    subroutine wait_for_more_capacity(this, number_of_bytes)
        class(scratch_buffer), intent(inout) :: this
        integer(int64), intent(in) :: number_of_bytes

        if ( this%buffer%get_available_size() < number_of_bytes .or. &
                (.not. this%slots%has_more_slots()) ) then

            call this%clear_all_checkpoints()
        end if
        if ( this%buffer%get_available_size() < number_of_bytes .or. &
                (.not. this%slots%has_more_slots()) ) then
                        error stop "scratch_buffer::wait_for_more_capacity:No more capacity."
        end if
    end subroutine wait_for_more_capacity

    subroutine clear_all_checkpoints(this)
        class(scratch_buffer), intent(inout) :: this

        call this%checkpoints%wait_for_all_checkpoints()
        call this%clear_completed_checkpoints()
    end subroutine clear_all_checkpoints

    subroutine clear_completed_checkpoints(this)
        class(scratch_buffer), intent(inout) :: this

        integer(int64) :: bytes_to_clear
        integer :: chk

        chk = this%checkpoints%process_next_checkpoint()
        do while ( chk > 0 )
            bytes_to_clear = this%slots%clear_slots_associated_with_a_checkpoint(chk)
            call this%buffer%del_buffer(bytes_to_clear)
            chk = this%checkpoints%process_next_checkpoint()
        end do
    end subroutine clear_completed_checkpoints

    subroutine destroy(this, dta)
        class(scratch_buffer), intent(inout) :: this
        class(data_storage), intent(inout) :: dta

        call this%slots%mark_slot_for_destruction(dta%get_data_pointer())
    end subroutine destroy

    subroutine checkpoint(this, astream)
        class(scratch_buffer), intent(inout) :: this
        type(stream), intent(in), optional :: astream

        integer(int64) :: bytes_to_clear
        integer :: chk

        if ( .not. this%slots%have_slots_marked_for_destruction() ) &
                return

        if ( .not. this%checkpoints%has_room() ) then
            call this%checkpoints%wait_for_next_checkpoint()
            call this%clear_completed_checkpoints()
        end if

        chk = this%checkpoints%register_checkpoint(astream)
        call this%slots%mark_unmarked_slots_with_checkpoint(chk)

        call this%clear_completed_checkpoints()
    end subroutine checkpoint

    subroutine cleanup(this)
        class(scratch_buffer), intent(inout) :: this

        call this%checkpoints%cleanup()
        call this%slots%cleanup()
        call this%buffer%cleanup()
    end subroutine cleanup

    subroutine clear(this)
        class(scratch_buffer), intent(inout) :: this

        this%buffer = ring_buffer()
        this%checkpoints = checkpoint_manager()
        this%slots = slot_manager()
    end subroutine clear
end module scratch_buffer_module
