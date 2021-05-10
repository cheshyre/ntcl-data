! Auto-generated -- DO NOT MODIFY
module host_memory_package_test_module
    use :: util_api, only : &
            selector, &
            assert

    use :: host_builder_test_module, only : host_builder_test

    implicit none
    private

    public :: host_memory_package_test

    type :: host_memory_package_test
        type(selector) :: test_selector
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type host_memory_package_test

    interface host_memory_package_test
        module procedure constructor
    end interface host_memory_package_test

contains
    function constructor(aselector) result(this)
        type(selector), intent(in) :: aselector
        type(host_memory_package_test) :: this

        call this%clear()

        this%test_selector = aselector
    end function constructor

    subroutine run(this, assertion)
        class(host_memory_package_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(host_builder_test) :: ahost_builder_test

        call assertion%equal("host_memory::Package test complete", .true.)

        if ( &
                this%test_selector%is_enabled("host_builder") ) then
            ahost_builder_test = host_builder_test()
            call ahost_builder_test%run(assertion)
            call ahost_builder_test%cleanup()
        end if

    end subroutine run

    subroutine cleanup(this)
        class(host_memory_package_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(host_memory_package_test), intent(inout) :: this
    end subroutine clear
end module host_memory_package_test_module
