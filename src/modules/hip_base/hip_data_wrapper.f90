module hip_data_wrapper_module
    use, intrinsic :: iso_c_binding, only : &
        c_ptr, &
        c_size_t, &
        c_int
    use :: hip_memory_wrapper_module, only : hipSuccess

    implicit none
    private

    public :: hip_update_device
    public :: hip_update_host
    public :: hip_update_device_async
    public :: hip_update_device_async_with_stream
    public :: hip_update_host_async
    public :: hip_update_host_async_with_stream
    public :: hip_device2device
    public :: hip_device2device_with_stream
    public :: hipdevicesynchronize
    public :: hipstreamsynchronize
    public :: hipmemset
    public :: check_hip

    integer, public, parameter :: HIP_DATA_SUCCESS = 0

    interface
        integer(c_int) function hip_update_device( dst, src, nbytes) &
                                                bind(c, name="hip_update_device")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr), value :: dst, src
            integer(c_size_t), value :: nbytes
        end function hip_update_device

        integer(c_int) function hip_update_host( dst, src, nbytes) &
                                                bind(c, name="hip_update_host")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr), value :: dst, src
            integer(c_size_t), value :: nbytes
        end function hip_update_host

        integer(c_int) function hip_update_device_async( dst, src, nbytes) &
                                                bind(c, name="hip_update_device_async")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr), value :: dst, src
            integer(c_size_t), value :: nbytes
        end function hip_update_device_async

        integer(c_int) function hip_update_host_async( dst, src, nbytes) &
                                                bind(c, name="hip_update_host_async")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr), value :: dst, src
            integer(c_size_t), value :: nbytes
        end function hip_update_host_async

        integer(c_int) function hip_update_device_async_with_stream( dst, src, nbytes, astream) &
                                                bind(c, name="hip_update_device_async_with_stream")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr), value :: dst, src
            integer(c_size_t), value :: nbytes
            type(c_ptr), value :: astream
        end function hip_update_device_async_with_stream

        integer(c_int) function hip_update_host_async_with_stream( dst, src, nbytes, astream) &
                                                bind(c, name="hip_update_host_async_with_stream")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr), value :: dst, src
            integer(c_size_t), value :: nbytes
            type(c_ptr), value :: astream
        end function hip_update_host_async_with_stream

        integer(c_int) function hip_device2device( dst, src, nbytes) &
                                                bind(c, name="hip_device2device")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr), value :: dst, src
            integer(c_size_t), value :: nbytes
        end function hip_device2device

        integer(c_int) function hip_device2device_with_stream( dst, src, nbytes, astream) &
                                                bind(c, name="hip_device2device_with_stream")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr), value :: dst, src
            integer(c_size_t), value :: nbytes
            type(c_ptr), value :: astream
        end function hip_device2device_with_stream

        integer(c_int) function hipdevicesynchronize() bind(c, name="hipDeviceSynchronizeWrapper")
            import :: c_int
        end function hipdevicesynchronize

        integer(c_int) function hipstreamsynchronize(stream) bind(c, name="hipStreamSynchronizeWrapper")
            import :: c_int
            import :: c_ptr

            type(c_ptr), value :: stream
        end function hipstreamsynchronize

        integer(c_int) function hipdevicereset() bind(c, name="hipDeviceReset")
            import :: c_int
        end function hipdevicereset

        integer(c_int) function hipmemset(dst, val, nbytes) bind(c, name="hipMemset")
            import :: c_int, c_size_t, c_ptr
            type(c_ptr), value :: dst
            integer(c_int), value :: val
            integer(c_size_t), value :: nbytes
        end function hipmemset

        integer(c_int) function check_hip_peek_at_last_error() &
                                                bind(c, name="check_hip_peek_at_last_error")
            import :: c_int
        end function check_hip_peek_at_last_error

        subroutine hip_error_printer( error ) bind(c, name="hip_error_printer")
            import :: c_int

            integer(c_int), value :: error
        end subroutine hip_error_printer
    end interface

contains

    subroutine check_hip(error, str)
        integer, intent(in) :: error
        character(len=*), intent(in) :: str
            if (error /= hipSuccess) then
                call hip_error_printer(error)
                error stop str
            end if
    end subroutine check_hip

end module hip_data_wrapper_module
