module checkpoint_manager_module
    use, intrinsic :: iso_fortran_env, only : int64
    use, intrinsic :: iso_c_binding, only : c_ptr

    use :: concurrency_api, only : &
            dependency_manager, &
            event, &
            stream

    use :: ring_array_descriptor_module, only : ring_array_descriptor

    implicit none
    private

    public :: checkpoint_manager

    type :: checkpoint_manager
        type(event), dimension(:), allocatable :: checkpoints
        class(dependency_manager), allocatable :: manager
        type(ring_array_descriptor) :: counter
    contains
        procedure :: initialize => initialize
        procedure :: register_checkpoint => register_checkpoint
        procedure :: process_next_checkpoint => process_next_checkpoint
        procedure :: reset => reset
        procedure :: has_room => has_room
        procedure :: cleanup => cleanup
        procedure :: wait_for_next_checkpoint => wait_for_next_checkpoint
        procedure :: wait_for_checkpoint => wait_for_checkpoint
        procedure :: wait_for_all_checkpoints => wait_for_all_checkpoints
        procedure :: clear => clear
    end type checkpoint_manager

    interface checkpoint_manager
        module procedure constructor_empty
        module procedure constructor
    end interface checkpoint_manager

    integer, parameter :: CREATED=1, DESTROYED=2, UNUSED=3
contains
    function constructor_empty() result(this)
        type(checkpoint_manager) :: this

        call this%clear()
    end function constructor_empty

    function constructor(manager, number_of_checkpoints) result(this)
        class(dependency_manager), intent(in) :: manager
        integer, intent(in) :: number_of_checkpoints
        type(checkpoint_manager) :: this

        this = checkpoint_manager()
        this%manager = manager
        this%counter = ring_array_descriptor(number_of_checkpoints)
    end function constructor

    subroutine initialize(this)
        class(checkpoint_manager), intent(inout) :: this

        integer  :: idx

        allocate(this%checkpoints(this%counter%array_size))
        do idx = 1, size(this%checkpoints)
            this%checkpoints(idx) = this%manager%get_new_event()
        end do
        call this%reset()
    end subroutine initialize

    integer function register_checkpoint(this, astream)
        class(checkpoint_manager), intent(inout) :: this
        type(stream), intent(in), optional :: astream

        register_checkpoint = this%counter%get_next_index()
        call this%counter%increase()
        call this%manager%register_dependency(this%checkpoints(register_checkpoint), astream)
    end function register_checkpoint

    logical function has_room(this)
        class(checkpoint_manager), intent(in) :: this

        has_room = .not. this%counter%is_full()
    end function has_room

    integer function process_next_checkpoint(this)
        class(checkpoint_manager), intent(inout) :: this

        integer :: chk

        process_next_checkpoint = 0
        if ( this%counter%elements_in_use == 0 ) return

        call this%wait_for_next_checkpoint()

        chk = this%counter%get_array_index(1)
        if ( this%manager%has_dependency_completed(this%checkpoints(chk)) ) then
            call this%counter%decrease()
            process_next_checkpoint = chk
        end if
    end function process_next_checkpoint

    subroutine wait_for_all_checkpoints(this)
        class(checkpoint_manager), intent(inout) :: this

        integer :: idx

        do idx = 1, this%counter%elements_in_use
            call this%wait_for_checkpoint(this%counter%get_array_index(idx))
        end do
    end subroutine wait_for_all_checkpoints

    subroutine wait_for_next_checkpoint(this)
        class(checkpoint_manager), intent(inout) :: this

        call this%wait_for_checkpoint(this%counter%get_next_index())
    end subroutine wait_for_next_checkpoint

    subroutine wait_for_checkpoint(this, chk)
        class(checkpoint_manager), intent(inout) :: this
        integer, intent(in) :: chk

        if ( this%manager%has_dependency_completed(this%checkpoints(chk)) ) return
        call this%manager%synchronize(this%checkpoints(chk))
    end subroutine wait_for_checkpoint

    subroutine reset(this)
        class(checkpoint_manager), intent(inout) :: this

        call this%wait_for_all_checkpoints()
        call this%counter%reset()
    end subroutine reset

    subroutine cleanup(this)
        class(checkpoint_manager), intent(inout) :: this

        integer :: idx

        call this%wait_for_all_checkpoints()

        call this%counter%cleanup()
        if ( allocated(this%checkpoints) ) then
            do idx = 1, size(this%checkpoints)
                call this%manager%ehandler%destroy(this%checkpoints(idx))
            end do
            deallocate(this%checkpoints)
        end if

        if ( allocated(this%manager) ) then
            call this%manager%cleanup()
            deallocate(this%manager)
        end if

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(checkpoint_manager), intent(inout) :: this

        this%counter = ring_array_descriptor()
    end subroutine clear
end module checkpoint_manager_module
