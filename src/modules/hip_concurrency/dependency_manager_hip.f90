module dependency_manager_hip_module
    use :: dependency_manager_module, only : dependency_manager
    use :: event_module, only : event
    use :: event_handler_hip_module, only : event_handler_hip
    use :: stream_module, only : stream
    use :: stream_handler_hip_module, only : stream_handler_hip
    use :: hip_concurrency_interface, only : &
            hip_record_event, &
            hip_record_event_without_stream, &
            hip_stream_wait_for_event, &
            hip_event_synchronize, &
            hip_synchronize_all, &
            hip_query_event

    implicit none
    private

    public :: dependency_manager_hip

    type, extends(dependency_manager) :: dependency_manager_hip
    contains
        procedure :: create_dependency => create_dependency
        procedure :: depends_on_single => depends_on_single
        procedure :: register_dependency => register_dependency
        procedure :: synchronize_all => synchronize_all
        procedure :: synchronize_on_event => synchronize_on_event
        procedure :: has_dependency_completed => has_dependency_completed
    end type dependency_manager_hip

    interface dependency_manager_hip
        module procedure constructor
        module procedure constructor_with_sizes
    end interface dependency_manager_hip

contains
    function constructor() result(this)
        type(dependency_manager_hip) :: this

        call this%clear()

        allocate(event_handler_hip::this%ehandler)
        allocate(stream_handler_hip::this%shandler)
    end function constructor

    function constructor_with_sizes(max_events, max_streams) result(this)
        integer, intent(in) :: max_events, max_streams
        type(dependency_manager_hip) :: this

        this = dependency_manager_hip()
        call this%setup(max_events, max_streams)
    end function constructor_with_sizes

    type(event) function create_dependency(this, s)
        class(dependency_manager_hip), intent(inout) :: this
        type(stream), intent(in) :: s

        create_dependency = this%get_event()
        call this%register_dependency(create_dependency, s)
    end function create_dependency

    subroutine depends_on_single(this, s, e)
        class(dependency_manager_hip), intent(inout) :: this
        type(stream), intent(in) :: s
        type(event), intent(in) :: e

        call hip_stream_wait_for_event(s%sid, e%eid)
    end subroutine depends_on_single

    subroutine register_dependency(this, e, s)
        class(dependency_manager_hip), intent(in) :: this
        type(event), intent(inout) :: e
        type(stream), intent(in), optional :: s

        if ( present(s) ) then
            call hip_record_event(e%eid, s%sid)
        else
            call hip_record_event_without_stream(e%eid)
        end if
    end subroutine register_dependency

    subroutine synchronize_all(this)
        class(dependency_manager_hip), intent(in) :: this

        call hip_synchronize_all()
    end subroutine synchronize_all

    subroutine synchronize_on_event(this, e)
        class(dependency_manager_hip), intent(in) :: this
        type(event), intent(in) :: e

        call hip_event_synchronize(e%eid)
    end subroutine synchronize_on_event

    logical function has_dependency_completed(this, e)
        class(dependency_manager_hip), intent(in) :: this
        type(event), intent(in) :: e

        integer :: res

        res = hip_query_event(e%eid)
        has_dependency_completed = res == 0
    end function has_dependency_completed
end module dependency_manager_hip_module
