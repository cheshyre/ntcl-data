module hip_storage_module
    use, intrinsic :: iso_fortran_env, only : int64
    use, intrinsic :: iso_c_binding, only : &
            c_size_t, &
            c_int, &
            c_ptr

    use :: hip_memory_wrapper_module, only : &
            hipmallocwrapper, &
            hipfreewrapper, &
            hipSuccess, &
            hipmemgetinfo

    use :: data_storage_module, only : data_storage

    implicit none
    private

    public :: hip_storage

    type, extends(data_storage) :: hip_storage
    contains
        procedure :: query_memory => query_memory
        procedure :: allocate_data => allocate_data
        procedure :: deallocate_data => deallocate_data
    end type hip_storage

    interface hip_storage
        module procedure constructor_empty
        module procedure constructor
        module procedure constructor_ptr
    end interface hip_storage

contains
    function constructor_empty() result(this)
        type(hip_storage) :: this

        call this%clear()
    end function constructor_empty

    function constructor(number_of_bytes) result(this)
        integer(int64), intent(in) :: number_of_bytes
        type(hip_storage) :: this

        this = hip_storage()
        call this%allocate_data(number_of_bytes)
    end function constructor

    function constructor_ptr(ptr, number_of_bytes) result(this)
        type(c_ptr), intent(in) :: ptr
        integer(int64), intent(in) :: number_of_bytes
        type(hip_storage) :: this

        this = hip_storage()
        call this%set_data_pointer(ptr, number_of_bytes)
    end function constructor_ptr

    subroutine allocate_data(this, number_of_bytes)
        class(hip_storage), intent(inout) :: this
        integer(int64), intent(in) :: number_of_bytes

        integer(c_int) :: error

        if (this%is_allocated .and. this%number_of_bytes == number_of_bytes) return
        if (this%is_allocated ) call this%deallocate_data()

        error = hipmallocwrapper(this%actual_data, int(number_of_bytes, c_size_t))
        if (error == hipSuccess) then
            this%number_of_bytes = number_of_bytes
            this%is_allocated = .true.
        else
            error stop "hip_storage::allocate_data:Can not allocate data."
        end if
    end subroutine allocate_data

    subroutine deallocate_data(this)
        class(hip_storage), intent(inout) :: this

        integer(c_int) :: error

        if (this%is_allocated ) then
            error = hipfreewrapper(this%actual_data)
            if (error /= hipSuccess) then
                error stop "hip_storage::deallocate_data:Can not deallocate data."
            end if
        end if
        call this%clear()
    end subroutine deallocate_data

    subroutine query_memory(this, unitf)
        class(hip_storage), intent(in) :: this
        integer, intent(in) :: unitf

        integer(c_size_t) :: free, total
        integer :: error

        error = hipmemgetinfo(free, total)

        write(unitf, *) "Free: ", free, ", Total: ", total
    end subroutine query_memory
end module hip_storage_module
