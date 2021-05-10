module dependency_manager_host_module
    use :: dependency_manager_module, only : dependency_manager
    use :: event_module, only : event
    use :: event_handler_host_module, only : event_handler_host
    use :: stream_module, only : stream
    use :: stream_handler_host_module, only : stream_handler_host

    implicit none
    private

    public :: dependency_manager_host

    type, extends(dependency_manager) :: dependency_manager_host
    contains
        procedure :: create_dependency => create_dependency
        procedure :: depends_on_single => depends_on_single
        procedure :: register_dependency => register_dependency
        procedure :: synchronize_all => synchronize_all
        procedure :: synchronize_on_event => synchronize_on_event
        procedure :: has_dependency_completed => has_dependency_completed
    end type dependency_manager_host

    interface dependency_manager_host
        module procedure constructor
        module procedure constructor_with_sizes
    end interface dependency_manager_host

contains
    function constructor() result(this)
        type(dependency_manager_host) :: this

        call this%clear()

        allocate(event_handler_host::this%ehandler)
        allocate(stream_handler_host::this%shandler)
    end function constructor

    function constructor_with_sizes(max_events, max_streams) result(this)
        integer, intent(in) :: max_events, max_streams
        type(dependency_manager_host) :: this

        this = dependency_manager_host()
        call this%setup(max_events, max_streams)
    end function constructor_with_sizes

    type(event) function create_dependency(this, s)
        class(dependency_manager_host), intent(inout) :: this
        type(stream), intent(in) :: s

        create_dependency = this%get_event()
    end function create_dependency

    subroutine depends_on_single(this, s, e)
        class(dependency_manager_host), intent(inout) :: this
        type(stream), intent(in) :: s
        type(event), intent(in) :: e

        ! Nothing happens on the host
        continue
    end subroutine depends_on_single

    subroutine register_dependency(this, e, s)
        class(dependency_manager_host), intent(in) :: this
        type(event), intent(inout) :: e
        type(stream), intent(in), optional :: s

        ! Nothing happens on the host
        continue
    end subroutine register_dependency

    subroutine synchronize_all(this)
        class(dependency_manager_host), intent(in) :: this

        ! Do nothing on host
        continue
    end subroutine synchronize_all

    subroutine synchronize_on_event(this, e)
        class(dependency_manager_host), intent(in) :: this
        type(event), intent(in) :: e

        ! Do nothing on host
        continue
    end subroutine synchronize_on_event

    logical function has_dependency_completed(this, e)
        class(dependency_manager_host), intent(in) :: this
        type(event), intent(in) :: e

        has_dependency_completed = .true.
    end function has_dependency_completed
end module dependency_manager_host_module
