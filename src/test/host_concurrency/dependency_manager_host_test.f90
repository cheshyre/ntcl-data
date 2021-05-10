module dependency_manager_host_test_module
    use, intrinsic :: iso_c_binding, only : c_associated

    use :: util_api, only : assert
    use :: dependency_manager_host_module, only : dependency_manager_host

    use :: event_handler_host_module, only : event_handler_host
    use :: stream_handler_host_module, only : stream_handler_host
    use :: event_module, only : event
    use :: stream_module, only : stream

    implicit none
    private

    public :: dependency_manager_host_test

    type :: dependency_manager_host_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type dependency_manager_host_test

    interface dependency_manager_host_test
        module procedure constructor
    end interface dependency_manager_host_test
contains
    function constructor() result(this)
        type(dependency_manager_host_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(dependency_manager_host_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(dependency_manager_host) :: mgr
        integer :: max_streams, max_events
        type(event) :: e
        type(stream) :: s

        call assertion%equal("dependency_manager_host::Test complete", .true.)

        max_events = 0
        max_streams = 0
        mgr = dependency_manager_host()
        call assertion%equal("dependency_manager_host::Empty constructor", &
                mgr%current_event == 0 .and. mgr%current_stream == 0 .and. &
                mgr%max_events == max_events .and. mgr%max_streams == max_streams .and. &
                (.not. allocated(mgr%events)) .and. (.not. allocated(mgr%streams)) .and. &
                allocated(mgr%ehandler) .and. allocated(mgr%shandler) .and. &
                same_type_as(mgr%ehandler, event_handler_host()) .and. &
                same_type_as(mgr%shandler, stream_handler_host()))

        mgr = dependency_manager_host(max_events, max_streams)
        call assertion%equal("dependency_manager_host::Constructor with no events or streams", &
                mgr%current_event == 0 .and. mgr%current_stream == 0 .and. &
                mgr%max_events == max_events .and. mgr%max_streams == max_streams .and. &
                (.not. allocated(mgr%events)) .and. (.not. allocated(mgr%streams)) .and. &
                allocated(mgr%ehandler) .and. allocated(mgr%shandler) .and. &
                same_type_as(mgr%ehandler, event_handler_host()) .and. &
                same_type_as(mgr%shandler, stream_handler_host()))

        max_events = 11
        max_streams = 13
        mgr = dependency_manager_host(max_events, max_streams)
        call assertion%equal("dependency_manager_host::Constructor with events and streams", &
                mgr%current_event == 0 .and. mgr%current_stream == 0 .and. &
                mgr%max_events == max_events .and. mgr%max_streams == max_streams .and. &
                (allocated(mgr%events)) .and. (allocated(mgr%streams)) .and. &
                size(mgr%events) == max_events .and. size(mgr%streams) == max_streams .and. &
                allocated(mgr%ehandler) .and. allocated(mgr%shandler) .and. &
                same_type_as(mgr%ehandler, event_handler_host()) .and. &
                same_type_as(mgr%shandler, stream_handler_host()))

        max_events = 2
        max_streams = 2
        mgr = dependency_manager_host(max_events, max_streams)
        e = mgr%get_event()
        call assertion%equal("dependency_manager_host::After get one event", &
                mgr%current_event == 1 .and. mgr%current_stream == 0 .and. &
                .not. c_associated(e%eid) )
        e = mgr%get_event()
        e = mgr%get_event()
        call assertion%equal("dependency_manager_host::After get max_events+1 events", &
                mgr%current_event == 1 .and. mgr%current_stream == 0 .and. &
                .not. c_associated(e%eid) )

        mgr = dependency_manager_host(max_events, max_streams)
        e = mgr%create_dependency(s)
        call assertion%equal("dependency_manager_host::After create_dependency", &
                mgr%current_event == 1 .and. mgr%current_stream == 0 .and. &
                .not. c_associated(e%eid) )

        mgr = dependency_manager_host(max_events, max_streams)
        s = mgr%get_stream()
        call assertion%equal("dependency_manager_host::After get one stream", &
                mgr%current_event == 0 .and. mgr%current_stream == 1 .and. &
                .not. c_associated(s%sid) )
        s = mgr%get_stream()
        s = mgr%get_stream()
        call assertion%equal("dependency_manager_host::After get max_streams+1 streams", &
                mgr%current_event == 0 .and. mgr%current_stream == 1 .and. &
                .not. c_associated(s%sid) )

        call mgr%cleanup()
        call assertion%equal("dependency_manager_host::After cleanup", &
                mgr%current_event == 0 .and. mgr%current_stream == 0 .and. &
                mgr%max_events == 0 .and. mgr%max_streams == 0 .and. &
                (.not. allocated(mgr%events)) .and. (.not. allocated(mgr%streams)) .and. &
                (.not. allocated(mgr%ehandler)) .and. (.not. allocated(mgr%shandler)))
    end subroutine run

    subroutine cleanup(this)
        class(dependency_manager_host_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(dependency_manager_host_test), intent(inout) :: this
    end subroutine clear
end module dependency_manager_host_test_module
