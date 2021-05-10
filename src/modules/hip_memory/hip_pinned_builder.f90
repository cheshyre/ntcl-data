module hip_pinned_builder_module
    use, intrinsic :: iso_fortran_env, only : real64, error_unit
    use :: memory_api, only : data_storage
    use :: host_builder_module, only : host_builder
    use :: hip_pinned_storage_module, only : hip_pinned_storage

    implicit none
    private

    public :: hip_pinned_builder

    type, extends(host_builder) :: hip_pinned_builder
    contains
        procedure :: allocate_class => allocate_class
    end type hip_pinned_builder
contains
    subroutine allocate_class(this, dst)
        class(hip_pinned_builder), intent(in) :: this
        class(data_storage), allocatable, intent(out) :: dst

        allocate(hip_pinned_storage::dst)
        call dst%clear()
    end subroutine allocate_class
end module hip_pinned_builder_module
