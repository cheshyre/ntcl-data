module stream_handler_cuda_module
    use :: stream_handler_module, only : stream_handler
    use :: stream_module, only : stream
    use :: cuda_concurrency_interface, only : &
            cuda_create_stream, &
            cuda_destroy_stream

    implicit none
    private

    public :: stream_handler_cuda

    type, extends(stream_handler) :: stream_handler_cuda
    contains
        procedure, nopass :: create => create
        procedure, nopass :: destroy => destroy
    end type stream_handler_cuda
contains
    subroutine create(s)
        type(stream), intent(inout) :: s

        s%sid = cuda_create_stream()
    end subroutine create

    subroutine destroy(s)
        type(stream), intent(inout) :: s

        call cuda_destroy_stream(s%sid)
        s = stream()
    end subroutine destroy
end module stream_handler_cuda_module
