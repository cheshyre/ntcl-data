module cuda_memory_wrapper_module
    use, intrinsic :: iso_c_binding, only : C_NULL_PTR, c_ptr, c_size_t
    use :: cuda_memory_interface, only : cudamalloc, cudafree
    implicit none
    private

    public :: allocate_device_memory
    public :: deallocate_device_memory
contains
    function allocate_device_memory(number_of_bytes) result(address)
        integer(c_size_t), intent(in) :: number_of_bytes
        type(c_ptr) :: address

        integer :: error

        error = cudamalloc(address, number_of_bytes)
    end function allocate_device_memory

    subroutine deallocate_device_memory(address)
        type(c_ptr), intent(inout) :: address

        integer :: error

        error = cudafree(address)
    end subroutine deallocate_device_memory
end module cuda_memory_wrapper_module
