! Auto-generated -- DO NOT MODIFY
module helpers_package_test_module
    use :: util_api, only : &
            selector, &
            assert

    use :: storage_helper_test_module, only : storage_helper_test

    implicit none
    private

    public :: helpers_package_test

    type :: helpers_package_test
        type(selector) :: test_selector
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type helpers_package_test

    interface helpers_package_test
        module procedure constructor
    end interface helpers_package_test

contains
    function constructor(aselector) result(this)
        type(selector), intent(in) :: aselector
        type(helpers_package_test) :: this

        call this%clear()

        this%test_selector = aselector
    end function constructor

    subroutine run(this, assertion)
        class(helpers_package_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(storage_helper_test) :: astorage_helper_test

        call assertion%equal("helpers::Package test complete", .true.)

        ! The following tests will not be run when -long is specified.
        if ( &
                this%test_selector%is_enabled("storage_helper") .and. &
                this%test_selector%is_enabled("long") ) then
            astorage_helper_test = storage_helper_test()
            call astorage_helper_test%run(assertion)
            call astorage_helper_test%cleanup()
        end if

    end subroutine run

    subroutine cleanup(this)
        class(helpers_package_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(helpers_package_test), intent(inout) :: this
    end subroutine clear
end module helpers_package_test_module
