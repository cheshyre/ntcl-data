module hip_builder_module
    use, intrinsic :: iso_c_binding, only : &
            c_size_t, &
            c_int

    use :: memory_api, only : &
            data_storage, &
            data_builder, &
            memory_manager

    use :: hip_storage_module, only : hip_storage
    use :: hip_data_wrapper_module, only : &
            hipmemset, &
            check_hip

    implicit none
    private

    public :: hip_builder

    type, extends(data_builder) :: hip_builder
    contains
        procedure :: allocate_class => allocate_class
        procedure :: initialize_zero => initialize_zero
    end type hip_builder
contains
    subroutine allocate_class(this, dst)
        class(hip_builder), intent(in) :: this
        class(data_storage), allocatable, intent(out) :: dst

        allocate(hip_storage::dst)
        call dst%clear()
    end subroutine allocate_class

    subroutine initialize_zero(this, dst)
        class(hip_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst

        integer(c_int) :: error

        error = hipmemset(dst%get_data_pointer(), 0, int(dst%number_of_bytes, c_size_t))
        call check_hip(error, "hip_storage_factory::initialize zero")
    end subroutine initialize_zero
end module hip_builder_module
