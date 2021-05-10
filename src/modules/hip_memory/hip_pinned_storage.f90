module hip_pinned_storage_module
    use, intrinsic :: iso_fortran_env, only : int64
    use, intrinsic :: iso_c_binding, only : c_size_t, c_int, c_ptr
    use :: hip_memory_wrapper_module, only : hipmallochostwrapper, hipfreehostwrapper, hipSuccess
    use :: host_storage_module, only : host_storage
    implicit none
    private

    public :: hip_pinned_storage

    type, extends(host_storage) :: hip_pinned_storage
    contains
        procedure :: allocate_data => allocate_data
        procedure :: deallocate_data => deallocate_data
    end type hip_pinned_storage

    interface hip_pinned_storage
        module procedure constructor_empty
        module procedure constructor
        module procedure constructor_ptr
    end interface hip_pinned_storage

contains
    function constructor_empty() result(this)
        type(hip_pinned_storage) :: this

        call this%clear()
    end function constructor_empty

    function constructor(number_of_bytes) result(this)
        integer(int64), intent(in) :: number_of_bytes
        type(hip_pinned_storage) :: this

        this = hip_pinned_storage()
        call this%allocate_data(number_of_bytes)
    end function constructor

    function constructor_ptr(ptr, number_of_bytes) result(this)
        type(c_ptr), intent(in) :: ptr
        integer(int64), intent(in) :: number_of_bytes
        type(hip_pinned_storage) :: this

        this = hip_pinned_storage()
        call this%set_data_pointer(ptr, number_of_bytes)
    end function constructor_ptr

    subroutine allocate_data(this, number_of_bytes)
        class(hip_pinned_storage), intent(inout) :: this
        integer(int64), intent(in) :: number_of_bytes

        integer(c_int) :: error

        if (this%is_allocated .and. this%number_of_bytes == number_of_bytes) return
        if (this%is_allocated ) call this%deallocate_data()

        error = hipmallochostwrapper(this%actual_data, int(number_of_bytes, c_size_t))
        if (error == hipSuccess) then
            this%number_of_bytes = number_of_bytes
            this%is_allocated = .true.
        else
            error stop "hip_pinned_storage::allocate_data:Can not allocate data."
        end if
    end subroutine allocate_data

    subroutine deallocate_data(this)
        class(hip_pinned_storage), intent(inout) :: this

        integer(c_int) :: error

        if (this%is_allocated ) then
            error = hipfreehostwrapper(this%actual_data)
            if (error /= hipSuccess) then
                error stop "hip_pinned_storage::deallocate_data:Can not deallocate data."
            end if
        end if
        call this%clear()
    end subroutine deallocate_data
end module hip_pinned_storage_module
