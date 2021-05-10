module cuda_pinned_builder_module
    use :: memory_api, only : data_storage
    use :: host_builder_module, only : host_builder
    use :: cuda_pinned_storage_module, only : cuda_pinned_storage

    implicit none
    private

    public :: cuda_pinned_builder

    type, extends(host_builder) :: cuda_pinned_builder
    contains
        procedure :: allocate_class => allocate_class
    end type cuda_pinned_builder

contains
    subroutine allocate_class(this, dst)
        class(cuda_pinned_builder), intent(in) :: this
        class(data_storage), allocatable, intent(out) :: dst

        allocate(cuda_pinned_storage::dst)
        call dst%clear()
    end subroutine allocate_class
end module cuda_pinned_builder_module
