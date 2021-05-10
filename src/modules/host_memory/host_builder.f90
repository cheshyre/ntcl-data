module host_builder_module
    use, intrinsic :: iso_c_binding, only : c_ptr

    use :: util_api, only : memset

    use :: memory_api, only : &
            data_storage, &
            data_builder

    use :: host_storage_module, only : host_storage

    implicit none
    private

    public :: host_builder

    type, extends(data_builder) :: host_builder
    contains
        procedure :: allocate_class => allocate_class
        procedure :: initialize_zero => initialize_zero
        procedure :: allocate_host_storage => allocate_host_storage
    end type host_builder
contains
    subroutine allocate_class(this, dst)
        class(host_builder), intent(in) :: this
        class(data_storage), allocatable, intent(out) :: dst

        allocate(host_storage::dst)
        call dst%clear()
    end subroutine allocate_class

    subroutine allocate_host_storage(this, dst)
        class(host_builder), intent(in) :: this
        class(host_storage), allocatable, intent(out) :: dst

        allocate(host_storage::dst)
        call dst%clear()
    end subroutine allocate_host_storage

    subroutine initialize_zero(this, dst)
        class(host_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst

        type(c_ptr) :: res

        select type (dst)
        class is (host_storage)
            res = memset(dst%actual_data, 0, dst%number_of_bytes)
        class default
            error stop "host_builder::initialize_zero:Incorrect memory type."
        end select
    end subroutine initialize_zero
end module host_builder_module
