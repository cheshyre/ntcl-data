! Auto-generated -- DO NOT MODIFY
module cuda_base_package_test_module
    use :: util_api, only : &
            selector, &
            assert

    use :: cuda_data_wrapper_test_module, only : cuda_data_wrapper_test

    implicit none
    private

    public :: cuda_base_package_test

    type :: cuda_base_package_test
        type(selector) :: test_selector
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type cuda_base_package_test

    interface cuda_base_package_test
        module procedure constructor
    end interface cuda_base_package_test

contains
    function constructor(aselector) result(this)
        type(selector), intent(in) :: aselector
        type(cuda_base_package_test) :: this

        call this%clear()

        this%test_selector = aselector
    end function constructor

    subroutine run(this, assertion)
        class(cuda_base_package_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(cuda_data_wrapper_test) :: acuda_data_wrapper_test

        call assertion%equal("cuda_base::Package test complete", .true.)

        if ( &
                this%test_selector%is_enabled("cuda_data_wrapper") ) then
            acuda_data_wrapper_test = cuda_data_wrapper_test()
            call acuda_data_wrapper_test%run(assertion)
            call acuda_data_wrapper_test%cleanup()
        end if

    end subroutine run

    subroutine cleanup(this)
        class(cuda_base_package_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(cuda_base_package_test), intent(inout) :: this
    end subroutine clear
end module cuda_base_package_test_module
