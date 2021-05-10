! Auto-generated -- DO NOT MODIFY
module cuda_memory_package_test_module
    use :: util_api, only : &
            selector, &
            assert

    use :: cuda_storage_test_module, only : cuda_storage_test
    use :: cuda_pinned_storage_test_module, only : cuda_pinned_storage_test
    use :: host_cuda_manager_test_module, only : host_cuda_manager_test

    implicit none
    private

    public :: cuda_memory_package_test

    type :: cuda_memory_package_test
        type(selector) :: test_selector
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type cuda_memory_package_test

    interface cuda_memory_package_test
        module procedure constructor
    end interface cuda_memory_package_test

contains
    function constructor(aselector) result(this)
        type(selector), intent(in) :: aselector
        type(cuda_memory_package_test) :: this

        call this%clear()

        this%test_selector = aselector
    end function constructor

    subroutine run(this, assertion)
        class(cuda_memory_package_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(cuda_storage_test) :: acuda_storage_test
        type(cuda_pinned_storage_test) :: acuda_pinned_storage_test
        type(host_cuda_manager_test) :: ahost_cuda_manager_test

        call assertion%equal("cuda_memory::Package test complete", .true.)

        if ( &
                this%test_selector%is_enabled("cuda_storage") ) then
            acuda_storage_test = cuda_storage_test()
            call acuda_storage_test%run(assertion)
            call acuda_storage_test%cleanup()
        end if

        if ( &
                this%test_selector%is_enabled("cuda_pinned_storage") ) then
            acuda_pinned_storage_test = cuda_pinned_storage_test()
            call acuda_pinned_storage_test%run(assertion)
            call acuda_pinned_storage_test%cleanup()
        end if

        if ( &
                this%test_selector%is_enabled("host_cuda_manager") ) then
            ahost_cuda_manager_test = host_cuda_manager_test()
            call ahost_cuda_manager_test%run(assertion)
            call ahost_cuda_manager_test%cleanup()
        end if

    end subroutine run

    subroutine cleanup(this)
        class(cuda_memory_package_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(cuda_memory_package_test), intent(inout) :: this
    end subroutine clear
end module cuda_memory_package_test_module
