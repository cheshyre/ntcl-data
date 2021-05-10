! Auto-generated -- DO NOT MODIFY
module concurrency_package_test_module
    use :: util_api, only : &
            selector, &
            assert

    use :: event_test_module, only : event_test
    use :: stream_test_module, only : stream_test

    implicit none
    private

    public :: concurrency_package_test

    type :: concurrency_package_test
        type(selector) :: test_selector
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type concurrency_package_test

    interface concurrency_package_test
        module procedure constructor
    end interface concurrency_package_test

contains
    function constructor(aselector) result(this)
        type(selector), intent(in) :: aselector
        type(concurrency_package_test) :: this

        call this%clear()

        this%test_selector = aselector
    end function constructor

    subroutine run(this, assertion)
        class(concurrency_package_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(event_test) :: aevent_test
        type(stream_test) :: astream_test

        call assertion%equal("concurrency::Package test complete", .true.)

        if ( &
                this%test_selector%is_enabled("event") ) then
            aevent_test = event_test()
            call aevent_test%run(assertion)
            call aevent_test%cleanup()
        end if

        if ( &
                this%test_selector%is_enabled("stream") ) then
            astream_test = stream_test()
            call astream_test%run(assertion)
            call astream_test%cleanup()
        end if

    end subroutine run

    subroutine cleanup(this)
        class(concurrency_package_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(concurrency_package_test), intent(inout) :: this
    end subroutine clear
end module concurrency_package_test_module
