module hip_memory_wrapper_module
    use, intrinsic :: iso_c_binding, only : C_NULL_PTR, c_ptr, c_size_t, c_int
    implicit none
    private

    public :: allocate_device_memory
    public :: deallocate_device_memory
    public :: hipmallocwrapper
    public :: hipfreewrapper
    public :: hipmallochostwrapper
    public :: hipfreehostwrapper
    public :: hipmemgetinfowrapper
    public :: hipmemgetinfo
    public :: hipDeviceQuery
    public :: hipSuccess

    interface
        integer(c_int) function hipmallocwrapper(buffer, nbytes) bind(c, name="hipMallocWrapper")
            import ::  c_int, c_ptr, c_size_t
            type(c_ptr) :: buffer
            integer (c_size_t), value :: nbytes
        end function hipmallocwrapper

        integer(c_int) function hipmallochostwrapper(buffer, nbytes) bind(c, name="hipMallocHostWrapper")
            import :: c_ptr, c_size_t, c_int
            type(c_ptr) :: buffer
            integer (c_size_t), value :: nbytes
        end function hipmallochostwrapper

        integer(c_int) function hipfreewrapper(buffer)  bind(c,name="hipFreeWrapper")
            import :: c_ptr, c_int
            type (c_ptr), value :: buffer
        end function hipfreewrapper

        integer(c_int) function hipfreehostwrapper(buffer)  bind(c,name="hipFreeHostWrapper")
            import :: c_ptr, c_int
            type (c_ptr), value :: buffer
        end function hipfreehostwrapper

        integer(c_int) function hipmemgetinfowrapper(free, total) bind(c, name="hipMemGetInfoWrapper")
            import :: c_int, c_size_t
            integer(c_size_t) :: free, total
        end function hipmemgetinfowrapper

        integer(c_int) function hipmemgetinfo(free, total) bind(c, name="hipMemGetInfo")
            import :: c_int, c_size_t
            integer(c_size_t) :: free, total
        end function hipmemgetinfo

        integer(c_int) function hipDeviceQuery() bind(c,name="hipDevProp")
            import :: c_int
        end function hipDeviceQuery

    end interface

    integer(c_int) :: hipSuccess = 0

contains
    function allocate_device_memory(number_of_bytes) result(address)
        integer(c_size_t), intent(in) :: number_of_bytes
        type(c_ptr) :: address

        integer :: error

        error = hipmallocwrapper(address, number_of_bytes)
    end function allocate_device_memory

    subroutine deallocate_device_memory(address)
        type(c_ptr), intent(inout) :: address

        integer :: error

        error = hipfreewrapper(address)
    end subroutine deallocate_device_memory
end module hip_memory_wrapper_module
