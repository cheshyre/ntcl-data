! Auto-generated -- DO NOT MODIFY
module cuda_concurrency_package_test_module
    use :: util_api, only : &
            selector, &
            assert

    use :: event_handler_cuda_test_module, only : event_handler_cuda_test
    use :: stream_handler_cuda_test_module, only : stream_handler_cuda_test
    use :: dependency_manager_cuda_test_module, only : dependency_manager_cuda_test

    implicit none
    private

    public :: cuda_concurrency_package_test

    type :: cuda_concurrency_package_test
        type(selector) :: test_selector
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type cuda_concurrency_package_test

    interface cuda_concurrency_package_test
        module procedure constructor
    end interface cuda_concurrency_package_test

contains
    function constructor(aselector) result(this)
        type(selector), intent(in) :: aselector
        type(cuda_concurrency_package_test) :: this

        call this%clear()

        this%test_selector = aselector
    end function constructor

    subroutine run(this, assertion)
        class(cuda_concurrency_package_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(event_handler_cuda_test) :: aevent_handler_cuda_test
        type(stream_handler_cuda_test) :: astream_handler_cuda_test
        type(dependency_manager_cuda_test) :: adependency_manager_cuda_test

        call assertion%equal("cuda_concurrency::Package test complete", .true.)

        if ( &
                this%test_selector%is_enabled("event_handler_cuda") ) then
            aevent_handler_cuda_test = event_handler_cuda_test()
            call aevent_handler_cuda_test%run(assertion)
            call aevent_handler_cuda_test%cleanup()
        end if

        if ( &
                this%test_selector%is_enabled("stream_handler_cuda") ) then
            astream_handler_cuda_test = stream_handler_cuda_test()
            call astream_handler_cuda_test%run(assertion)
            call astream_handler_cuda_test%cleanup()
        end if

        if ( &
                this%test_selector%is_enabled("dependency_manager_cuda") ) then
            adependency_manager_cuda_test = dependency_manager_cuda_test()
            call adependency_manager_cuda_test%run(assertion)
            call adependency_manager_cuda_test%cleanup()
        end if

    end subroutine run

    subroutine cleanup(this)
        class(cuda_concurrency_package_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(cuda_concurrency_package_test), intent(inout) :: this
    end subroutine clear
end module cuda_concurrency_package_test_module
