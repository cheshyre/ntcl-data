module stream_handler_hip_module
    use :: stream_handler_module, only : stream_handler
    use :: stream_module, only : stream
    use :: hip_concurrency_interface, only : &
            hip_create_stream, &
            hip_destroy_stream

    implicit none
    private

    public :: stream_handler_hip

    type, extends(stream_handler) :: stream_handler_hip
    contains
        procedure, nopass :: create => create
        procedure, nopass :: destroy => destroy
    end type stream_handler_hip
contains
    subroutine create(s)
        type(stream), intent(inout) :: s

        s%sid = hip_create_stream()
    end subroutine create

    subroutine destroy(s)
        type(stream), intent(inout) :: s

        call hip_destroy_stream(s%sid)
        s = stream()
    end subroutine destroy
end module stream_handler_hip_module
