! Auto-generated -- DO NOT MODIFY
module host_concurrency_package_test_module
    use :: util_api, only : &
            selector, &
            assert

    use :: event_handler_host_test_module, only : event_handler_host_test
    use :: stream_handler_host_test_module, only : stream_handler_host_test
    use :: dependency_manager_host_test_module, only : dependency_manager_host_test

    implicit none
    private

    public :: host_concurrency_package_test

    type :: host_concurrency_package_test
        type(selector) :: test_selector
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type host_concurrency_package_test

    interface host_concurrency_package_test
        module procedure constructor
    end interface host_concurrency_package_test

contains
    function constructor(aselector) result(this)
        type(selector), intent(in) :: aselector
        type(host_concurrency_package_test) :: this

        call this%clear()

        this%test_selector = aselector
    end function constructor

    subroutine run(this, assertion)
        class(host_concurrency_package_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(event_handler_host_test) :: aevent_handler_host_test
        type(stream_handler_host_test) :: astream_handler_host_test
        type(dependency_manager_host_test) :: adependency_manager_host_test

        call assertion%equal("host_concurrency::Package test complete", .true.)

        if ( &
                this%test_selector%is_enabled("event_handler_host") ) then
            aevent_handler_host_test = event_handler_host_test()
            call aevent_handler_host_test%run(assertion)
            call aevent_handler_host_test%cleanup()
        end if

        if ( &
                this%test_selector%is_enabled("stream_handler_host") ) then
            astream_handler_host_test = stream_handler_host_test()
            call astream_handler_host_test%run(assertion)
            call astream_handler_host_test%cleanup()
        end if

        if ( &
                this%test_selector%is_enabled("dependency_manager_host") ) then
            adependency_manager_host_test = dependency_manager_host_test()
            call adependency_manager_host_test%run(assertion)
            call adependency_manager_host_test%cleanup()
        end if

    end subroutine run

    subroutine cleanup(this)
        class(host_concurrency_package_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(host_concurrency_package_test), intent(inout) :: this
    end subroutine clear
end module host_concurrency_package_test_module
