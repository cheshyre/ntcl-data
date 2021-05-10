module stream_handler_hip_test_module
    use, intrinsic :: iso_c_binding, only : c_associated, c_loc

    use :: util_api, only : assert
    use :: stream_handler_hip_module, only : stream_handler_hip

    use :: stream_module, only : stream
    use :: hip_concurrency_interface, only : &
            hip_query_stream

    implicit none
    private

    public :: stream_handler_hip_test

    type :: stream_handler_hip_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type stream_handler_hip_test

    interface stream_handler_hip_test
        module procedure constructor
    end interface stream_handler_hip_test
contains
    function constructor() result(this)
        type(stream_handler_hip_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(stream_handler_hip_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(stream_handler_hip) :: handler
        type(stream) :: astream

        call assertion%equal("stream_handler_hip::Test complete", .true.)

        call handler%create(astream)
        call assertion%equal("stream_handler_hip::Creates stream", &
                c_associated(astream%sid) .and. hip_query_stream(astream%sid) == 0)

        call handler%destroy(astream)
        call assertion%equal("stream_handler_hip::Destroys stream", &
                .not. c_associated(astream%sid))
    end subroutine run

    subroutine cleanup(this)
        class(stream_handler_hip_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(stream_handler_hip_test), intent(inout) :: this
    end subroutine clear
end module stream_handler_hip_test_module
