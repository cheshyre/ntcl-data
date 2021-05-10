module cuda_builder_module
    use, intrinsic :: iso_c_binding, only : &
            c_size_t, &
            c_int

    use :: memory_api, only : &
            data_builder, &
            data_storage

    use :: cuda_storage_module, only : cuda_storage
    use :: cuda_memory_interface, only : &
            cudamemset, &
            check_cuda

    implicit none
    private

    public :: cuda_builder

    type, extends(data_builder) :: cuda_builder
    contains
        procedure :: allocate_class => allocate_class
        procedure :: initialize_zero => initialize_zero
    end type cuda_builder

contains
    subroutine allocate_class(this, dst)
        class(cuda_builder), intent(in) :: this
        class(data_storage), allocatable, intent(out) :: dst

        allocate(cuda_storage::dst)
        call dst%clear()
    end subroutine allocate_class

    subroutine initialize_zero(this, dst)
        class(cuda_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst

        integer(c_int) :: error

        error = cudamemset(dst%get_data_pointer(), 0, int(dst%number_of_bytes, c_size_t))
        call check_cuda(error, "cuda_storage_factory::initialize zero")
    end subroutine initialize_zero
end module cuda_builder_module
