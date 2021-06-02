! Auto-generated -- DO NOT MODIFY
module hip_memory_package_test_module
    use :: util_api, only : &
            selector, &
            assert

    use :: hip_storage_test_module, only : hip_storage_test
    use :: hip_pinned_storage_test_module, only : hip_pinned_storage_test
    use :: host_hip_manager_test_module, only : host_hip_manager_test

    implicit none
    private

    public :: hip_memory_package_test

    type :: hip_memory_package_test
        type(selector) :: test_selector
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type hip_memory_package_test

    interface hip_memory_package_test
        module procedure constructor
    end interface hip_memory_package_test

contains
    function constructor(aselector) result(this)
        type(selector), intent(in) :: aselector
        type(hip_memory_package_test) :: this

        call this%clear()

        this%test_selector = aselector
    end function constructor

    subroutine run(this, assertion)
        class(hip_memory_package_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(hip_storage_test) :: ahip_storage_test
        type(hip_pinned_storage_test) :: ahip_pinned_storage_test
        type(host_hip_manager_test) :: ahost_hip_manager_test

        call assertion%equal("hip_memory::Package test complete", .true.)

        if ( &
                this%test_selector%is_enabled("hip_storage") ) then
            ahip_storage_test = hip_storage_test()
            call ahip_storage_test%run(assertion)
            call ahip_storage_test%cleanup()
        end if

        if ( &
                this%test_selector%is_enabled("hip_pinned_storage") ) then
            ahip_pinned_storage_test = hip_pinned_storage_test()
            call ahip_pinned_storage_test%run(assertion)
            call ahip_pinned_storage_test%cleanup()
        end if

        if ( &
                this%test_selector%is_enabled("host_hip_manager") ) then
            ahost_hip_manager_test = host_hip_manager_test()
            call ahost_hip_manager_test%run(assertion)
            call ahost_hip_manager_test%cleanup()
        end if

    end subroutine run

    subroutine cleanup(this)
        class(hip_memory_package_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(hip_memory_package_test), intent(inout) :: this
    end subroutine clear
end module hip_memory_package_test_module
