module dependency_manager_hip_test_module
    use, intrinsic :: iso_c_binding, only : c_associated

    use :: util_api, only : assert
    use :: dependency_manager_hip_module, only : dependency_manager_hip

    use :: event_handler_hip_module, only : event_handler_hip
    use :: stream_handler_hip_module, only : stream_handler_hip
    use :: event_module, only : event
    use :: stream_module, only : stream
    use :: hip_concurrency_interface, only : &
            hip_query_event, &
            hip_query_stream, &
            hip_stream_synchronize

    implicit none
    private

    public :: dependency_manager_hip_test

    type :: dependency_manager_hip_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type dependency_manager_hip_test

    interface dependency_manager_hip_test
        module procedure constructor
    end interface dependency_manager_hip_test
contains
    function constructor() result(this)
        type(dependency_manager_hip_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(dependency_manager_hip_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(dependency_manager_hip) :: mgr
        integer :: max_streams, max_events
        type(event) :: e
        type(stream) :: s, s2

        call assertion%equal("dependency_manager_hip::Test complete", .true.)

        max_events = 0
        max_streams = 0
        mgr = dependency_manager_hip()
        call assertion%equal("dependency_manager_hip::Empty constructor", &
                mgr%current_event == 0 .and. mgr%current_stream == 0 .and. &
                mgr%max_events == max_events .and. mgr%max_streams == max_streams .and. &
                (.not. allocated(mgr%events)) .and. (.not. allocated(mgr%streams)) .and. &
                allocated(mgr%ehandler) .and. allocated(mgr%shandler) .and. &
                same_type_as(mgr%ehandler, event_handler_hip()) .and. &
                same_type_as(mgr%shandler, stream_handler_hip()))
        call mgr%cleanup()

        mgr = dependency_manager_hip(max_events, max_streams)
        call assertion%equal("dependency_manager_hip::Constructor with no events or streams", &
                mgr%current_event == 0 .and. mgr%current_stream == 0 .and. &
                mgr%max_events == max_events .and. mgr%max_streams == max_streams .and. &
                (.not. allocated(mgr%events)) .and. (.not. allocated(mgr%streams)) .and. &
                allocated(mgr%ehandler) .and. allocated(mgr%shandler) .and. &
                same_type_as(mgr%ehandler, event_handler_hip()) .and. &
                same_type_as(mgr%shandler, stream_handler_hip()))
        call mgr%cleanup()

        max_events = 11
        max_streams = 13
        mgr = dependency_manager_hip(max_events, max_streams)
        call assertion%equal("dependency_manager_hip::Constructor with events and streams", &
                mgr%current_event == 0 .and. mgr%current_stream == 0 .and. &
                mgr%max_events == max_events .and. mgr%max_streams == max_streams .and. &
                (allocated(mgr%events)) .and. (allocated(mgr%streams)) .and. &
                size(mgr%events) == max_events .and. size(mgr%streams) == max_streams .and. &
                allocated(mgr%ehandler) .and. allocated(mgr%shandler) .and. &
                same_type_as(mgr%ehandler, event_handler_hip()) .and. &
                same_type_as(mgr%shandler, stream_handler_hip()))
        call mgr%cleanup()

        max_events = 2
        max_streams = 2
        mgr = dependency_manager_hip(max_events, max_streams)
        s = mgr%get_stream()
        e = mgr%create_dependency(s)

        call mgr%synchronize_on_event(e)
        call assertion%equal("dependency_manager_hip::After one create_dependency on one stream: current event = 1", &
                mgr%current_event == 1)

        call assertion%equal("dependency_manager_hip::After one create_dependency on one stream: current stream = 1", &
                mgr%current_stream == 1)

        call assertion%equal("dependency_manager_hip::After one create_dependency on one stream: query event id = 0", &
                hip_query_event(e%eid) == 0)

        call assertion%equal("dependency_manager_hip::After one create_dependency on one stream: query stream id = 0", &
                hip_query_stream(s%sid) == 0)

        s2 = mgr%get_stream()
        call mgr%depends_on(s2, e)

        call assertion%equal("dependency_manager_hip::After 2 streams and 1 event with dependency: current event = 1", &
                mgr%current_event == 1)

        call assertion%equal("dependency_manager_hip::After 2 streams and 1 event with dependency: current stream = 2", &
                mgr%current_stream == 2)

        call assertion%equal("dependency_manager_hip::After 2 streams and 1 event with dependency: query event id = 0", &
                hip_query_event(e%eid) == 0)

        call assertion%equal("dependency_manager_hip::After 2 streams and 1 event with dependency: query stream = 0", &
                hip_query_stream(s%sid) == 0)

        if (hip_stream_synchronize(s2%sid) /= 0 ) &
                error stop "dependency_manager_hip_test:Stream can't synchronize."

        call assertion%equal("dependency_manager_hip::After 2 streams and 1 event with dependency: query stream2 = 0", &
                hip_query_stream(s2%sid) == 0)

        call mgr%cleanup()
    end subroutine run

    subroutine cleanup(this)
        class(dependency_manager_hip_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(dependency_manager_hip_test), intent(inout) :: this
    end subroutine clear
end module dependency_manager_hip_test_module
