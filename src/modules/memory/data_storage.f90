module data_storage_module
    use, intrinsic :: iso_fortran_env, only : int64
    use, intrinsic :: iso_c_binding, only : c_ptr, c_null_ptr
    use :: fortran_c_intrinsics, only : increment_pointer

    implicit none
    private

    public :: data_storage

    type, abstract :: data_storage
        integer(int64) :: number_of_bytes
        type(c_ptr) :: actual_data
        logical :: is_allocated
    contains
        procedure :: get_data_pointer => get_data_pointer
        procedure :: set_data_pointer => set_data_pointer
        procedure :: get_pointer_offset => get_pointer_offset
        procedure(allocate_interface), deferred :: allocate_data
        procedure(clear), deferred :: deallocate_data
        procedure :: clear => clear
    end type data_storage

    abstract interface
        subroutine allocate_interface(this, number_of_bytes)
            import :: data_storage
            import :: int64

            class(data_storage), intent(inout) :: this
            integer(int64), intent(in) :: number_of_bytes
        end subroutine allocate_interface
    end interface
contains
    type(c_ptr) function get_data_pointer(this)
        class(data_storage), intent(in) :: this

        get_data_pointer = this%actual_data
    end function get_data_pointer

    type(c_ptr) function get_pointer_offset(this, offset)
        class(data_storage), intent(in) :: this
        integer(int64), intent(in) :: offset

        get_pointer_offset = increment_pointer(this%actual_data, offset)
    end function get_pointer_offset

    subroutine set_data_pointer(this, ptr, number_of_bytes)
        class(data_storage), intent(inout) :: this
        type(c_ptr), intent(in) :: ptr
        integer(int64), intent(in) :: number_of_bytes

        this%number_of_bytes = number_of_bytes
        this%is_allocated = .true.
        this%actual_data = ptr
    end subroutine set_data_pointer

    subroutine clear(this)
        class(data_storage), intent(inout) :: this

        this%number_of_bytes = 0
        this%is_allocated = .false.
        this%actual_data = c_null_ptr
    end subroutine clear
end module data_storage_module
