module stream_test_module
    use, intrinsic :: iso_c_binding, only : c_associated, c_loc

    use :: util_api, only : assert
    use :: stream_module, only : stream

    implicit none
    private

    public :: stream_test

    type :: stream_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type stream_test

    interface stream_test
        module procedure constructor
    end interface stream_test
contains
    function constructor() result(this)
        type(stream_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(stream_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(stream) :: astream
        real, target :: dummy

        call assertion%equal("stream::Test complete", .true.)

        astream = stream()
        call assertion%equal("stream::Initizalized with null pointer", .not. c_associated(astream%sid))
        astream = stream(c_loc(dummy))
        call assertion%equal("stream::Initizalized with nonzero pointer", c_associated(astream%sid))

    end subroutine run

    subroutine cleanup(this)
        class(stream_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(stream_test), intent(inout) :: this
    end subroutine clear
end module stream_test_module
