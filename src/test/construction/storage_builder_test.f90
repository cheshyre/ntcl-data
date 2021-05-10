module storage_builder_test_module
    use :: util_api, only : assert
    use :: storage_builder_module, only : storage_builder

    implicit none
    private

    public :: storage_builder_test

    type :: storage_builder_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type storage_builder_test

    interface storage_builder_test
        module procedure constructor
    end interface storage_builder_test
contains
    function constructor() result(this)
        type(storage_builder_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(storage_builder_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(storage_builder) :: astorage_builder

        call assertion%equal("storage_builder::Test complete", .true.)

        astorage_builder = storage_builder()
    end subroutine run

    subroutine cleanup(this)
        class(storage_builder_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(storage_builder_test), intent(inout) :: this
    end subroutine clear
end module storage_builder_test_module
