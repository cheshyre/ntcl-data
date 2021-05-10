module stream_handler_cuda_test_module
    use, intrinsic :: iso_c_binding, only : c_associated, c_loc

    use :: util_api, only : assert
    use :: data_api, only : &
            concurrency_factory, &
            stream_handler, &
            stream

    use :: stream_handler_cuda_module, only : stream_handler_cuda
    use :: cuda_concurrency_interface, only : &
            cuda_query_stream

    implicit none
    private

    public :: stream_handler_cuda_test

    type :: stream_handler_cuda_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type stream_handler_cuda_test

    interface stream_handler_cuda_test
        module procedure constructor
    end interface stream_handler_cuda_test
contains
    function constructor() result(this)
        type(stream_handler_cuda_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(stream_handler_cuda_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(stream_handler_cuda) :: handler
        type(stream) :: astream
        class(stream_handler), allocatable :: ahandler

        call assertion%equal("stream_handler_cuda::Test complete", .true.)

        call handler%create(astream)
        call assertion%equal("stream_handler_cuda::Creates stream", &
                c_associated(astream%sid) .and. cuda_query_stream(astream%sid) == 0)

        call handler%destroy(astream)
        call assertion%equal("stream_handler_cuda::Destroys stream", &
                .not. c_associated(astream%sid))

        call concurrency_factory%create_default_stream_handler(ahandler, "device")
        call assertion%equal("stream_handler_cuda::Create stream handler:Same type", &
                same_type_as(handler, ahandler))
        deallocate(ahandler)
    end subroutine run

    subroutine cleanup(this)
        class(stream_handler_cuda_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(stream_handler_cuda_test), intent(inout) :: this
    end subroutine clear
end module stream_handler_cuda_test_module
