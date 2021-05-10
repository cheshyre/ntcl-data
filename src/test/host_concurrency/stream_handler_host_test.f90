module stream_handler_host_test_module
    use, intrinsic :: iso_c_binding, only : c_associated, c_loc

    use :: util_api, only : assert
    use :: stream_handler_host_module, only : stream_handler_host

    use :: stream_module, only : stream
    implicit none
    private

    public :: stream_handler_host_test

    type :: stream_handler_host_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type stream_handler_host_test

    interface stream_handler_host_test
        module procedure constructor
    end interface stream_handler_host_test
contains
    function constructor() result(this)
        type(stream_handler_host_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(stream_handler_host_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(stream_handler_host) :: handler
        type(stream) :: astream
        real, target :: dummy

        call assertion%equal("stream_handler_host::Test complete", .true.)

        astream = stream(c_loc(dummy))
        call handler%create(astream)
        call assertion%equal("stream_handler_host::Creates stream with null pointer", &
                .not. c_associated(astream%sid))

        astream = stream(c_loc(dummy))
        call handler%destroy(astream)
        call assertion%equal("stream_handler_host::Destroys stream with null pointer", &
                .not. c_associated(astream%sid))
    end subroutine run

    subroutine cleanup(this)
        class(stream_handler_host_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(stream_handler_host_test), intent(inout) :: this
    end subroutine clear
end module stream_handler_host_test_module
