module fortran_data_converter_test_module
    use, intrinsic :: iso_fortran_env, only : real64, int64

    use :: util_api, only : assert

    use :: data_dev, only : &
            fortran_data_converter, &
            create_host_storage, &
            secure_fortran_pointer_from_remote_storage, &
            release_pointer_from_remote_storage

    use :: data_dev, only : &
            host_storage

    implicit none
    private

    public :: fortran_data_converter_test

    type :: fortran_data_converter_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type fortran_data_converter_test

    interface fortran_data_converter_test
        module procedure constructor
    end interface fortran_data_converter_test
contains
    function constructor() result(this)
        type(fortran_data_converter_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(fortran_data_converter_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        real(real64), target :: t3(4,5,6), t3_new(4,5,6)
        real(real64), dimension(:,:,:), pointer, contiguous :: ptr
        class(host_storage), allocatable :: storage

        call assertion%equal("fortran_data_converter::Test complete", .true.)

        call random_number(t3)
        ptr => t3
        call create_host_storage(storage, ptr)

        call secure_fortran_pointer_from_remote_storage(ptr, storage, shape(t3))

        call assertion%equal("fortran_data_converter::real64:r=3:secure_fortran_pointer_from_remote_storage:Size", &
                size(ptr) == size(t3))
        call assertion%equal("fortran_data_converter::real64:r=3:secure_fortran_pointer_from_remote_storage:Shape", &
                all(shape(ptr) == shape(t3)))
        call assertion%equal("fortran_data_converter::real64:r=3:secure_fortran_pointer_from_remote_storage:Elements", &
                all(ptr == t3))

        call release_pointer_from_remote_storage(ptr, storage)
        call assertion%equal("fortran_data_converter::real64:release_pointer_from_remote_storage:Not assiociated", &
            .not. associated(ptr))

        t3_new = t3

    end subroutine run

    subroutine cleanup(this)
        class(fortran_data_converter_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(fortran_data_converter_test), intent(inout) :: this
    end subroutine clear
end module fortran_data_converter_test_module
