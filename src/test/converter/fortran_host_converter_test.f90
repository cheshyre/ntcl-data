module fortran_host_converter_test_module
    use, intrinsic :: iso_fortran_env, only : real64, int64
    use, intrinsic :: iso_c_binding, only : c_f_pointer

    use :: util_api, only : assert

    use :: data_api, only : &
            fortran_host_converter, &
            create_host_storage, &
            secure_fortran_pointer_from_host, &
            get_host_storage_from_array

    use :: data_dev, only : &
            host_storage

    implicit none
    private

    public :: fortran_host_converter_test

    type :: fortran_host_converter_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type fortran_host_converter_test

    interface fortran_host_converter_test
        module procedure constructor
    end interface fortran_host_converter_test
contains
    function constructor() result(this)
        type(fortran_host_converter_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(fortran_host_converter_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(fortran_host_converter) :: afortran_host_converter
        real(real64), target :: t3(4,5,6)
        real(real64), dimension(:,:,:), pointer, contiguous :: ptr
        class(host_storage), allocatable :: storage
        type(host_storage) :: fixed_storage

        call assertion%equal("fortran_host_converter::Test complete", .true.)

        afortran_host_converter = fortran_host_converter()

        call random_number(t3)

        fixed_storage = get_host_storage_from_array(t3)
        call c_f_pointer(fixed_storage%get_data_pointer(), ptr, shape=shape(t3))

        call assertion%equal("fortran_host_converter::real64:r=3:get_host_storage_from_array:Size", &
                fixed_storage%number_of_bytes/8 == size(t3))
        call assertion%equal("fortran_host_converter::real64:r=3:get_host_storage_from_array:Elements", &
                all(ptr == t3))

        ptr => t3
        call create_host_storage(storage, ptr)
        ptr => null()
        call assertion%equal("fortran_host_converter::real64:r=3:create_host_storage:Size", &
                storage%number_of_bytes == size(t3)*8)

        call secure_fortran_pointer_from_host(ptr, storage, shape(t3, kind=int64))
        call assertion%equal("fortran_host_converter::real64:r=3:secure_fortran_pointer_from_host:Size", &
                size(ptr) == size(t3))
        call assertion%equal("fortran_host_converter::real64:r=3:secure_fortran_pointer_from_host:Shape", &
                all(shape(ptr) == shape(t3)))
        call assertion%equal("fortran_host_converter::real64:r=3:secure_fortran_pointer_from_host:Elements", &
                all(ptr == t3))

    end subroutine run

    subroutine cleanup(this)
        class(fortran_host_converter_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(fortran_host_converter_test), intent(inout) :: this
    end subroutine clear
end module fortran_host_converter_test_module
