module storage_helper_test_module
    use :: util_api, only : &
            assert

    use :: data_api, only : &
            data_storage, &
            storage_helper, &
            allocate_and_copy_storage

    implicit none
    private

    public :: storage_helper_test

    type :: storage_helper_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type storage_helper_test

    interface storage_helper_test
        module procedure constructor
    end interface storage_helper_test
contains
    function constructor() result(this)
        type(storage_helper_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(storage_helper_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(storage_helper) :: helper
        real, dimension(:), allocatable :: src
        complex, dimension(:), allocatable :: csrc
        class(data_storage), allocatable :: dst

        call assertion%equal("storage_helper::Test complete", .true.)

        allocate(src(80000))

        src = 0.0
        call allocate_and_copy_storage(dst, src)
        call assertion%equal("storage_helper::real:Number of bytes fit in a fortran integer", &
                helper%equal(dst, src))

        call dst%deallocate_data()
        deallocate(src, dst)

        allocate(src(800000000)) ! 800M*4 > max fortran integer

        src = 0.0
        call allocate_and_copy_storage(dst, src)
        call assertion%equal("storage_helper::real:Number of bytes does not fit a fortran integer", &
                helper%equal(dst, src))

        call dst%deallocate_data()
        deallocate(src, dst)

        allocate(csrc(80000))

        csrc = 0.0
        call allocate_and_copy_storage(dst, csrc)
        call assertion%equal("storage_helper::complex:Number of bytes fit in a fortran integer", &
                helper%equal(dst, csrc))

        call dst%deallocate_data()
        deallocate(csrc, dst)

        allocate(csrc(400000000)) ! 400M*8 > max fortran integer

        csrc = 0.0
        call allocate_and_copy_storage(dst, csrc)
        call assertion%equal("storage_helper::complex:Number of bytes does not fit a fortran integer", &
                helper%equal(dst, csrc))

        call dst%deallocate_data()
        deallocate(csrc, dst)
    end subroutine run

    subroutine cleanup(this)
        class(storage_helper_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(storage_helper_test), intent(inout) :: this
    end subroutine clear
end module storage_helper_test_module
