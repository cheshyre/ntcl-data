module hip_data_wrapper_test_module
    use, intrinsic :: iso_fortran_env, only : real64
    use, intrinsic :: iso_c_binding, only : c_int, c_size_t, c_ptr, c_loc

    use :: util_api, only : assert
    use :: hip_memory_wrapper_module, only : allocate_device_memory, deallocate_device_memory, hipmemgetinfowrapper
    use :: hip_data_wrapper_module, only : hip_update_device, hip_update_host

    implicit none
    private

    public :: hip_data_wrapper_test

    type :: hip_data_wrapper_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type hip_data_wrapper_test

    interface hip_data_wrapper_test
        module procedure constructor
    end interface hip_data_wrapper_test

contains
    function constructor() result(this)
        type(hip_data_wrapper_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(hip_data_wrapper_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        integer(c_int) :: error
        integer(c_size_t) :: free, total, number_of_bytes
        integer :: idx, number_of_elements
        real(real64), dimension(:), allocatable, target :: testdata, return_data
        type(c_ptr) :: address, return_address

        call assertion%equal("hip_data_wrapper::Test complete", .true.)

        error = hipmemgetinfowrapper(free, total)
        call assertion%equal("hip_data_wrapper::hipmemgetinfo test", error==0)

        number_of_elements = 10000
        testdata = [(real(idx*0.2, real64), idx = 1, number_of_elements)]
        allocate(return_data(number_of_elements))
        return_data = 0

        number_of_bytes = int(8*size(testdata), c_size_t)
        address = allocate_device_memory(number_of_bytes)
        error = hip_update_device(address, c_loc(testdata), number_of_bytes)
        call assertion%equal("hip_data_wrapper::hip_update_device test", error==0)
        error = hip_update_host(c_loc(return_data), address, number_of_bytes)
        call assertion%equal("hip_data_wrapper::hip_update_host test", error==0)

        call assertion%is_equal("hip_data_wrapper::Roundtrip device memory", &
            testdata, return_data)

        call deallocate_device_memory(address)
    end subroutine run

    subroutine cleanup(this)
        class(hip_data_wrapper_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(hip_data_wrapper_test), intent(inout) :: this
    end subroutine clear
end module hip_data_wrapper_test_module
