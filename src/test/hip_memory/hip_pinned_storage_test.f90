module hip_pinned_storage_test_module
    use, intrinsic :: iso_fortran_env, only : int64, real64
    use, intrinsic :: iso_c_binding, only : c_associated, c_loc, c_int, c_size_t

    use :: util_api, only : assert
    use :: hip_pinned_storage_module, only : hip_pinned_storage
    use :: hip_data_wrapper_module, only : hip_update_device, hip_update_host

    implicit none
    private

    public :: hip_pinned_storage_test

    type :: hip_pinned_storage_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type hip_pinned_storage_test

    interface hip_pinned_storage_test
        module procedure constructor
    end interface hip_pinned_storage_test
contains
    function constructor() result(this)
        type(hip_pinned_storage_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(hip_pinned_storage_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(hip_pinned_storage) :: ahip_pinned_storage
        real(real64), dimension(:), allocatable, target :: odata, rdata
        integer(int64) :: number_of_bytes
        integer :: number_of_elements
        integer(c_int) :: error

        call assertion%equal("hip_pinned_storage::Test complete", .true.)

        number_of_elements = 10
        number_of_bytes = 8*number_of_elements

        ahip_pinned_storage = hip_pinned_storage(number_of_bytes)
        call assertion%equal("hip_pinned_storage::Object after constructor", &
            ahip_pinned_storage%is_allocated .and. ahip_pinned_storage%number_of_bytes == number_of_bytes .and. &
            c_associated(ahip_pinned_storage%actual_data) )

        call ahip_pinned_storage%deallocate_data()
        call assertion%equal("hip_pinned_storage::Object after deallocation", &
            .not. ahip_pinned_storage%is_allocated .and. ahip_pinned_storage%number_of_bytes == 0 .and. &
            .not. c_associated(ahip_pinned_storage%actual_data) )

        call ahip_pinned_storage%allocate_data(number_of_bytes)
        call assertion%equal("hip_pinned_storage::Object after allocation", &
            ahip_pinned_storage%is_allocated .and. ahip_pinned_storage%number_of_bytes == number_of_bytes .and. &
            c_associated(ahip_pinned_storage%actual_data) )
        call ahip_pinned_storage%deallocate_data()

        allocate(odata(number_of_elements), rdata(number_of_elements))
        call random_number(odata); rdata = 0.0d0

        call ahip_pinned_storage%allocate_data(number_of_bytes)

        error = hip_update_device(ahip_pinned_storage%get_data_pointer(), c_loc(odata), &
                int(number_of_bytes, c_size_t))
        error = hip_update_host(c_loc(rdata), ahip_pinned_storage%get_data_pointer(), &
                int(number_of_bytes, c_size_t))

        call assertion%is_equal("hip_pinned_storage::Data after roundtrip", odata, rdata)
        call ahip_pinned_storage%deallocate_data()
    end subroutine run

    subroutine cleanup(this)
        class(hip_pinned_storage_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(hip_pinned_storage_test), intent(inout) :: this
    end subroutine clear
end module hip_pinned_storage_test_module
