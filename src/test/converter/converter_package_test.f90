! Auto-generated -- DO NOT MODIFY
module converter_package_test_module
    use :: util_api, only : &
            selector, &
            assert

    use :: fortran_host_converter_test_module, only : fortran_host_converter_test
    use :: fortran_data_converter_test_module, only : fortran_data_converter_test

    implicit none
    private

    public :: converter_package_test

    type :: converter_package_test
        type(selector) :: test_selector
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type converter_package_test

    interface converter_package_test
        module procedure constructor
    end interface converter_package_test

contains
    function constructor(aselector) result(this)
        type(selector), intent(in) :: aselector
        type(converter_package_test) :: this

        call this%clear()

        this%test_selector = aselector
    end function constructor

    subroutine run(this, assertion)
        class(converter_package_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(fortran_host_converter_test) :: afortran_host_converter_test
        type(fortran_data_converter_test) :: afortran_data_converter_test

        call assertion%equal("converter::Package test complete", .true.)

        if ( &
                this%test_selector%is_enabled("fortran_host_converter") ) then
            afortran_host_converter_test = fortran_host_converter_test()
            call afortran_host_converter_test%run(assertion)
            call afortran_host_converter_test%cleanup()
        end if

        if ( &
                this%test_selector%is_enabled("fortran_data_converter") ) then
            afortran_data_converter_test = fortran_data_converter_test()
            call afortran_data_converter_test%run(assertion)
            call afortran_data_converter_test%cleanup()
        end if

    end subroutine run

    subroutine cleanup(this)
        class(converter_package_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(converter_package_test), intent(inout) :: this
    end subroutine clear
end module converter_package_test_module
