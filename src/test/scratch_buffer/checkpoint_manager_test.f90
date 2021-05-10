module checkpoint_manager_test_module
    use, intrinsic :: iso_c_binding, only : c_ptr
    use :: util_api, only : assert
    use :: checkpoint_manager_module, only : checkpoint_manager
    use :: host_concurrency_plugin, only : dependency_manager_host

    implicit none
    private

    public :: checkpoint_manager_test

    type :: checkpoint_manager_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type checkpoint_manager_test

    interface checkpoint_manager_test
        module procedure constructor
    end interface checkpoint_manager_test
contains
    function constructor() result(this)
        type(checkpoint_manager_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(checkpoint_manager_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(checkpoint_manager) :: acheckpoint_manager
        type(dependency_manager_host) :: mgr
        integer :: dummy
        type(c_ptr) :: dptr

        mgr = dependency_manager_host()
        call assertion%equal("checkpoint_manager::Test complete", .true.)

        acheckpoint_manager = checkpoint_manager()
        call assertion%equal("checkpoint_manager::Empty constructor", &
                (.not. allocated(acheckpoint_manager%checkpoints)) .and. &
                (.not. allocated(acheckpoint_manager%manager)))

        acheckpoint_manager = checkpoint_manager(mgr, 1)
        call assertion%equal("checkpoint_manager::Constructor", &
                (.not. allocated(acheckpoint_manager%checkpoints)) .and. &
                allocated(acheckpoint_manager%manager) .and. &
                acheckpoint_manager%counter%array_size == 1 )

        call acheckpoint_manager%initialize()
        call assertion%equal("checkpoint_manager::Initialize", &
                allocated(acheckpoint_manager%checkpoints) .and. &
                allocated(acheckpoint_manager%manager) .and. &
                acheckpoint_manager%counter%array_size == 1 )
    end subroutine run

    subroutine cleanup(this)
        class(checkpoint_manager_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(checkpoint_manager_test), intent(inout) :: this
    end subroutine clear
end module checkpoint_manager_test_module
