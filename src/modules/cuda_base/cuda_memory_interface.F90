module cuda_memory_interface
    use, intrinsic :: iso_c_binding, only : &
        c_ptr, &
        c_size_t, &
        c_int

    implicit none

    interface
        integer(c_int) function cudamalloc(buffer, size_) bind(c, name="cudaMalloc")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr) :: buffer
            integer (c_size_t), value :: size_
        end function cudamalloc

        integer(c_int) function cudamallochost(buffer, size_) bind(c, name="cudaMallocHost")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr) :: buffer
            integer (c_size_t), value :: size_
        end function cudamallochost

        integer(c_int) function cudafree(buffer)  bind(c,name="cudaFree")
            import :: c_ptr, c_int
            type (c_ptr), value :: buffer
        end function cudafree

        integer(c_int) function cudafreehost(buffer)  bind(c,name="cudaFreeHost")
            import :: c_ptr, c_int
            type (c_ptr), value :: buffer
        end function cudafreehost

        integer(c_int) function cudamemgetinfo(free, total) bind(c, name="cudaMemGetInfo")
            import :: c_int, c_size_t
            integer(c_size_t) :: free, total
        end function cudamemgetinfo

        integer(c_int) function cudadevicesynchronize() bind(c, name="cudaDeviceSynchronize")
            import :: c_int
        end function cudadevicesynchronize

        integer(c_int) function cudadevicereset() bind(c, name="cudaDeviceReset")
            import :: c_int
        end function cudadevicereset

        integer(c_int) function cudamemset(buffer, set_val, size_) bind(c, name="cudaMemset")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr), value :: buffer
            integer(c_int), value :: set_val
            integer(c_size_t), value :: size_
        end function cudamemset

        integer(c_int) function check_cuda_peek_at_last_error() &
                                                bind(c, name="check_cuda_peek_at_last_error")
            import :: c_int
        end function check_cuda_peek_at_last_error

        subroutine cuda_error_printer( error ) bind(c, name="cuda_error_printer")
            import :: c_int

            integer(c_int), value :: error
        end subroutine cuda_error_printer
    end interface

    integer(c_int) :: cudaSuccess = 0
contains

    subroutine check_cuda(error, str)
        integer, intent(in) :: error
        character(len=*), intent(in) :: str
#ifdef DEBUG
            if (error /= cudaSuccess) then
                call cuda_error_printer(error)
                error stop str
            end if
#endif
    end subroutine check_cuda
end module cuda_memory_interface

