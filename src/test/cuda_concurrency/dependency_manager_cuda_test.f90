module dependency_manager_cuda_test_module
    use, intrinsic :: iso_c_binding, only : c_associated

    use :: util_api, only : assert
    use :: dependency_manager_cuda_module, only : dependency_manager_cuda

    use :: event_handler_cuda_module, only : event_handler_cuda
    use :: stream_handler_cuda_module, only : stream_handler_cuda
    use :: event_module, only : event
    use :: stream_module, only : stream
    use :: cuda_concurrency_interface, only : &
            cuda_query_event, &
            cuda_query_stream

    implicit none
    private

    public :: dependency_manager_cuda_test

    type :: dependency_manager_cuda_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type dependency_manager_cuda_test

    interface dependency_manager_cuda_test
        module procedure constructor
    end interface dependency_manager_cuda_test
contains
    function constructor() result(this)
        type(dependency_manager_cuda_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(dependency_manager_cuda_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(dependency_manager_cuda) :: mgr
        integer :: max_streams, max_events
        type(event) :: e
        type(stream) :: s, s2

        call assertion%equal("dependency_manager_cuda::Test complete", .true.)

        max_events = 0
        max_streams = 0
        mgr = dependency_manager_cuda()
        call assertion%equal("dependency_manager_cuda::Empty constructor", &
                mgr%current_event == 0 .and. mgr%current_stream == 0 .and. &
                mgr%max_events == max_events .and. mgr%max_streams == max_streams .and. &
                (.not. allocated(mgr%events)) .and. (.not. allocated(mgr%streams)) .and. &
                allocated(mgr%ehandler) .and. allocated(mgr%shandler) .and. &
                same_type_as(mgr%ehandler, event_handler_cuda()) .and. &
                same_type_as(mgr%shandler, stream_handler_cuda()))
        call mgr%cleanup()

        mgr = dependency_manager_cuda(max_events, max_streams)
        call assertion%equal("dependency_manager_cuda::Constructor with no events or streams", &
                mgr%current_event == 0 .and. mgr%current_stream == 0 .and. &
                mgr%max_events == max_events .and. mgr%max_streams == max_streams .and. &
                (.not. allocated(mgr%events)) .and. (.not. allocated(mgr%streams)) .and. &
                allocated(mgr%ehandler) .and. allocated(mgr%shandler) .and. &
                same_type_as(mgr%ehandler, event_handler_cuda()) .and. &
                same_type_as(mgr%shandler, stream_handler_cuda()))
        call mgr%cleanup()

        max_events = 11
        max_streams = 13
        mgr = dependency_manager_cuda(max_events, max_streams)
        call assertion%equal("dependency_manager_cuda::Constructor with events and streams", &
                mgr%current_event == 0 .and. mgr%current_stream == 0 .and. &
                mgr%max_events == max_events .and. mgr%max_streams == max_streams .and. &
                (allocated(mgr%events)) .and. (allocated(mgr%streams)) .and. &
                size(mgr%events) == max_events .and. size(mgr%streams) == max_streams .and. &
                allocated(mgr%ehandler) .and. allocated(mgr%shandler) .and. &
                same_type_as(mgr%ehandler, event_handler_cuda()) .and. &
                same_type_as(mgr%shandler, stream_handler_cuda()))
        call mgr%cleanup()

        max_events = 2
        max_streams = 2
        mgr = dependency_manager_cuda(max_events, max_streams)
        s = mgr%get_stream()
        e = mgr%create_dependency(s)
        call assertion%equal("dependency_manager_cuda::After one create_dependency on one stream", &
                mgr%current_event == 1 .and. mgr%current_stream == 1 .and. &
                cuda_query_event(e%eid) == 0 .and. cuda_query_stream(s%sid) == 0)

        s2 = mgr%get_stream()
        call mgr%depends_on(s2, e)
        call assertion%equal("dependency_manager_cuda::After 2 streams and 1 event with dependency.", &
                mgr%current_event == 1 .and. mgr%current_stream == 2 .and. &
                cuda_query_event(e%eid) == 0 .and. cuda_query_stream(s%sid) == 0 .and. &
                cuda_query_stream(s2%sid) == 0)
        call mgr%cleanup()
    end subroutine run

    subroutine cleanup(this)
        class(dependency_manager_cuda_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(dependency_manager_cuda_test), intent(inout) :: this
    end subroutine clear
end module dependency_manager_cuda_test_module
