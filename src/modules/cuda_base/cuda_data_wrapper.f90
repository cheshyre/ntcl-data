module cuda_data_wrapper_module
    use, intrinsic :: iso_c_binding, only : &
        c_ptr, &
        c_size_t, &
        c_int

    implicit none
    private

    public :: cuda_update_device
    public :: cuda_update_host
    public :: cuda_update_device_async
    public :: cuda_update_device_async_with_stream
    public :: cuda_update_host_async
    public :: cuda_update_host_async_with_stream
    public :: cuda_device2device
    public :: cuda_device2device_with_stream
    public :: cudamemgetinfo

    integer, public, parameter :: CUDA_DATA_SUCCESS = 0

    interface
        integer(c_int) function cuda_update_device( dst, src, nbytes) &
                                                bind(c, name="cuda_update_device")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr), value :: dst, src
            integer(c_size_t), value :: nbytes
        end function cuda_update_device

        integer(c_int) function cuda_update_host( dst, src, nbytes) &
                                                bind(c, name="cuda_update_host")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr), value :: dst, src
            integer(c_size_t), value :: nbytes
        end function cuda_update_host

        integer(c_int) function cuda_update_device_async( dst, src, nbytes) &
                                                bind(c, name="cuda_update_device_async")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr), value :: dst, src
            integer(c_size_t), value :: nbytes
        end function cuda_update_device_async

        integer(c_int) function cuda_update_host_async( dst, src, nbytes) &
                                                bind(c, name="cuda_update_host_async")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr), value :: dst, src
            integer(c_size_t), value :: nbytes
        end function cuda_update_host_async

        integer(c_int) function cuda_update_device_async_with_stream( dst, src, nbytes, astream) &
                                                bind(c, name="cuda_update_device_async_with_stream")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr), value :: dst, src
            integer(c_size_t), value :: nbytes
            type(c_ptr), value :: astream
        end function cuda_update_device_async_with_stream

        integer(c_int) function cuda_update_host_async_with_stream( dst, src, nbytes, astream) &
                                                bind(c, name="cuda_update_host_async_with_stream")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr), value :: dst, src
            integer(c_size_t), value :: nbytes
            type(c_ptr), value :: astream
        end function cuda_update_host_async_with_stream

        integer(c_int) function cuda_device2device( dst, src, nbytes) &
                                                bind(c, name="cuda_device2device")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr), value :: dst, src
            integer(c_size_t), value :: nbytes
        end function cuda_device2device

        integer(c_int) function cuda_device2device_with_stream( dst, src, nbytes, astream) &
                                                bind(c, name="cuda_device2device_with_stream")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr), value :: dst, src
            integer(c_size_t), value :: nbytes
            type(c_ptr), value :: astream
        end function cuda_device2device_with_stream

        integer(c_int) function cudamemgetinfo( free, total) &
                                                bind(c, name="cudaMemGetInfo")
            import :: c_size_t, c_int
            integer(c_size_t) :: free, total
        end function cudamemgetinfo
    end interface
end module cuda_data_wrapper_module

