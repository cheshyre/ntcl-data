! Auto-generated -- DO NOT MODIFY
module hip_base_package_test_module
    use :: util_api, only : &
            selector, &
            assert

    use :: hip_data_wrapper_test_module, only : hip_data_wrapper_test

    implicit none
    private

    public :: hip_base_package_test

    type :: hip_base_package_test
        type(selector) :: test_selector
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type hip_base_package_test

    interface hip_base_package_test
        module procedure constructor
    end interface hip_base_package_test

contains
    function constructor(aselector) result(this)
        type(selector), intent(in) :: aselector
        type(hip_base_package_test) :: this

        call this%clear()

        this%test_selector = aselector
    end function constructor

    subroutine run(this, assertion)
        class(hip_base_package_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(hip_data_wrapper_test) :: ahip_data_wrapper_test

        call assertion%equal("hip_base::Package test complete", .true.)

        if ( &
                this%test_selector%is_enabled("hip_data_wrapper") ) then
            ahip_data_wrapper_test = hip_data_wrapper_test()
            call ahip_data_wrapper_test%run(assertion)
            call ahip_data_wrapper_test%cleanup()
        end if

    end subroutine run

    subroutine cleanup(this)
        class(hip_base_package_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(hip_base_package_test), intent(inout) :: this
    end subroutine clear
end module hip_base_package_test_module
