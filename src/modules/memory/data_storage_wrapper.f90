module data_storage_wrapper_module
    use :: data_storage_module, only : data_storage

    implicit none
    private

    public :: data_storage_wrapper

    type :: data_storage_wrapper
        class(data_storage), allocatable :: item
    contains
        procedure :: cleanup => cleanup
    end type data_storage_wrapper
contains
    subroutine cleanup(this)
        class(data_storage_wrapper), intent(inout) :: this

        if (allocated(this%item) ) deallocate(this%item)
    end subroutine cleanup
end module data_storage_wrapper_module
