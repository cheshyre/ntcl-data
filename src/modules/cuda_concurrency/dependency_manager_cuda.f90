module dependency_manager_cuda_module
    use, intrinsic :: iso_c_binding, only : c_associated
    use :: dependency_manager_module, only : dependency_manager
    use :: event_module, only : event
    use :: event_handler_cuda_module, only : event_handler_cuda
    use :: stream_module, only : stream
    use :: stream_handler_cuda_module, only : stream_handler_cuda
    use :: cuda_concurrency_interface, only : &
            cuda_record_event, &
            cuda_record_event_without_stream, &
            cuda_query_event, &
            cuda_stream_wait_for_event, &
            cuda_event_synchronize, &
            cuda_synchronize_all

    implicit none
    private

    public :: dependency_manager_cuda

    type, extends(dependency_manager) :: dependency_manager_cuda
    contains
        procedure :: create_dependency => create_dependency
        procedure :: depends_on_single => depends_on_single
        procedure :: register_dependency => register_dependency
        procedure :: synchronize_all => synchronize_all
        procedure :: synchronize_on_event => synchronize_on_event
        procedure :: has_dependency_completed => has_dependency_completed
    end type dependency_manager_cuda

    interface dependency_manager_cuda
        module procedure constructor
        module procedure constructor_with_sizes
    end interface dependency_manager_cuda

contains
    function constructor() result(this)
        type(dependency_manager_cuda) :: this

        call this%clear()

        allocate(event_handler_cuda::this%ehandler)
        allocate(stream_handler_cuda::this%shandler)
    end function constructor

    function constructor_with_sizes(max_events, max_streams) result(this)
        integer, intent(in) :: max_events, max_streams
        type(dependency_manager_cuda) :: this

        this = dependency_manager_cuda()
        call this%setup(max_events, max_streams)
    end function constructor_with_sizes

    type(event) function create_dependency(this, s)
        class(dependency_manager_cuda), intent(inout) :: this
        type(stream), intent(in) :: s

        create_dependency = this%get_event()
        call this%register_dependency(create_dependency, s)
    end function create_dependency

    subroutine depends_on_single(this, s, e)
        class(dependency_manager_cuda), intent(inout) :: this
        type(stream), intent(in) :: s
        type(event), intent(in) :: e

        call cuda_stream_wait_for_event(s%sid, e%eid)
    end subroutine depends_on_single

    subroutine register_dependency(this, e, s)
        class(dependency_manager_cuda), intent(in) :: this
        type(event), intent(inout) :: e
        type(stream), intent(in), optional :: s

        if ( present(s)) then
            if (c_associated(s%sid)) call cuda_record_event(e%eid, s%sid)
        else
            call cuda_record_event_without_stream(e%eid)
        end if
    end subroutine register_dependency

    subroutine synchronize_all(this)
        class(dependency_manager_cuda), intent(in) :: this

        call cuda_synchronize_all()
    end subroutine synchronize_all

    subroutine synchronize_on_event(this, e)
        class(dependency_manager_cuda), intent(in) :: this
        type(event), intent(in) :: e

        call cuda_event_synchronize(e%eid)
    end subroutine synchronize_on_event

    logical function has_dependency_completed(this, e)
        class(dependency_manager_cuda), intent(in) :: this
        type(event), intent(in) :: e

        integer :: res

        res = cuda_query_event(e%eid)
        has_dependency_completed = res == 0
    end function has_dependency_completed
end module dependency_manager_cuda_module
