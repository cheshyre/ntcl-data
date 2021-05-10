module cuda_pinned_storage_module
    use, intrinsic :: iso_fortran_env, only : int64
    use, intrinsic :: iso_c_binding, only : c_size_t, c_int, c_ptr
    use :: cuda_memory_interface, only : cudamallochost, cudafreehost, cudaSuccess, check_cuda
    use :: host_storage_module, only : host_storage
    implicit none
    private

    public :: cuda_pinned_storage

    type, extends(host_storage) :: cuda_pinned_storage
    contains
        procedure :: allocate_data => allocate_data
        procedure :: deallocate_data => deallocate_data
    end type cuda_pinned_storage

    interface cuda_pinned_storage
        module procedure constructor_empty
        module procedure constructor
        module procedure constructor_ptr
    end interface cuda_pinned_storage

contains
    function constructor_empty() result(this)
        type(cuda_pinned_storage) :: this

        call this%clear()
    end function constructor_empty

    function constructor(number_of_bytes) result(this)
        integer(int64), intent(in) :: number_of_bytes
        type(cuda_pinned_storage) :: this

        this = cuda_pinned_storage()
        call this%allocate_data(number_of_bytes)
    end function constructor

    function constructor_ptr(ptr, number_of_bytes) result(this)
        type(c_ptr), intent(in) :: ptr
        integer(int64), intent(in) :: number_of_bytes
        type(cuda_pinned_storage) :: this

        this = cuda_pinned_storage()
        call this%set_data_pointer(ptr, number_of_bytes)
    end function constructor_ptr

    subroutine allocate_data(this, number_of_bytes)
        class(cuda_pinned_storage), intent(inout) :: this
        integer(int64), intent(in) :: number_of_bytes

        integer(c_int) :: error

        if (this%is_allocated .and. this%number_of_bytes == number_of_bytes) return
        if (this%is_allocated ) call this%deallocate_data()

        error = cudamallochost(this%actual_data, int(number_of_bytes, c_size_t))
        call check_cuda(error, "cuda_pinned_storage::deallocate_data")

        this%number_of_bytes = number_of_bytes
        this%is_allocated = .true.
    end subroutine allocate_data

    subroutine deallocate_data(this)
        class(cuda_pinned_storage), intent(inout) :: this

        integer(c_int) :: error

        if (this%is_allocated ) then
            error = cudafreehost(this%actual_data)
            call check_cuda(error, "cuda_pinned_storage::deallocate_data")
        end if

        call this%clear()
    end subroutine deallocate_data
end module cuda_pinned_storage_module
