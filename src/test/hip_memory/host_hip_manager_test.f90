module host_hip_manager_test_module
    use, intrinsic :: iso_fortran_env, only : int64, real64
    use, intrinsic :: iso_c_binding, only : c_f_pointer

    use :: util_api, only : assert
    use :: host_hip_manager_module, only : host_hip_manager
    use :: host_storage_module, only : host_storage
    use :: hip_storage_module, only : hip_storage

    implicit none
    private

    public :: host_hip_manager_test

    type :: host_hip_manager_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type host_hip_manager_test

    interface host_hip_manager_test
        module procedure constructor
    end interface host_hip_manager_test
contains
    function constructor() result(this)
        type(host_hip_manager_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(host_hip_manager_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(host_hip_manager) :: manager
        real(real64), dimension(:), pointer :: odata, rdata
        integer(int64) :: number_of_bytes
        integer :: number_of_elements
        type(host_storage) :: hdata_original, hdata_return
        type(hip_storage) :: cdata_original, cdata_return

        call assertion%equal("host_hip_manager::Test complete", .true.)

        ! Host src not allocated, hip dst not allocated
        hdata_original = host_storage()
        cdata_original = hip_storage()
        call manager%copy_storage(hdata_original, cdata_original)
        call assertion%equal("host_hip_manager::h2c, src and dst not allocated", &
            .not. hdata_original%is_allocated .and. .not. cdata_original%is_allocated)

        ! HIP src not allocated, host dst not allocated
        hdata_original = host_storage()
        cdata_original = hip_storage()
        call manager%copy_storage(cdata_original, hdata_original)
        call assertion%equal("host_hip_manager::c2h, src and dst not allocated", &
            .not. hdata_original%is_allocated .and. .not. cdata_original%is_allocated)

        number_of_elements = 10
        number_of_bytes = 8*number_of_elements

        ! Host src allocated, hip dst not allocated
        hdata_original = host_storage(number_of_bytes)
        cdata_original = hip_storage()
        call manager%copy_storage(hdata_original, cdata_original)
        call assertion%equal("host_hip_manager::h2c, src allocated, dst correct size", &
            hdata_original%is_allocated .and. cdata_original%is_allocated .and. &
            hdata_original%number_of_bytes == cdata_original%number_of_bytes)

        ! HIP src allocated, host dst not allocated
        hdata_original = host_storage()
        cdata_original = hip_storage(number_of_bytes)
        call manager%copy_storage(cdata_original, hdata_original)
        call assertion%equal("host_hip_manager::c2h, src allocated, dst correct size", &
            hdata_original%is_allocated .and. cdata_original%is_allocated .and. &
            hdata_original%number_of_bytes == cdata_original%number_of_bytes)

        ! Host src allocated, hip dst allocated wrong size
        hdata_original = host_storage(number_of_bytes)
        cdata_original = hip_storage(2*number_of_bytes)
        call manager%copy_storage(hdata_original, cdata_original)
        call assertion%equal("host_hip_manager::h2c, dst allocated wrong size", &
            hdata_original%is_allocated .and. cdata_original%is_allocated .and. &
            hdata_original%number_of_bytes == cdata_original%number_of_bytes)

        ! HIP src allocated, host dst allocated wrong size
        hdata_original = host_storage(2*number_of_bytes)
        cdata_original = hip_storage(number_of_bytes)
        call manager%copy_storage(cdata_original, hdata_original)
        call assertion%equal("host_hip_manager::c2h, dst allocated wrong size", &
            hdata_original%is_allocated .and. cdata_original%is_allocated .and. &
            hdata_original%number_of_bytes == cdata_original%number_of_bytes)

        ! Host src allocated, hip dst allocated right size
        hdata_original = host_storage(number_of_bytes)
        cdata_original = hip_storage(number_of_bytes)
        call manager%copy_storage(hdata_original, cdata_original)
        call assertion%equal("host_hip_manager::h2c, dst allocated right size", &
            hdata_original%is_allocated .and. cdata_original%is_allocated .and. &
            hdata_original%number_of_bytes == cdata_original%number_of_bytes)

        ! HIP src allocated, host dst allocated right size
        hdata_original = host_storage(number_of_bytes)
        cdata_original = hip_storage(number_of_bytes)
        call manager%copy_storage(cdata_original, hdata_original)
        call assertion%equal("host_hip_manager::c2h, dst allocated right size", &
            hdata_original%is_allocated .and. cdata_original%is_allocated .and. &
            hdata_original%number_of_bytes == cdata_original%number_of_bytes)

        hdata_return = host_storage()
        cdata_return = hip_storage()

        call c_f_pointer(hdata_original%get_data_pointer(), odata, shape=[number_of_elements])
        call random_number(odata)
        call manager%copy_storage(hdata_original, cdata_original)
        call manager%copy_storage(cdata_original, hdata_return)
        call c_f_pointer(hdata_return%get_data_pointer(), rdata, shape=[number_of_elements])
        call assertion%is_equal("host_hip_manager::Rountrip host device host", odata, rdata)
    end subroutine run

    subroutine cleanup(this)
        class(host_hip_manager_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(host_hip_manager_test), intent(inout) :: this
    end subroutine clear
end module host_hip_manager_test_module
