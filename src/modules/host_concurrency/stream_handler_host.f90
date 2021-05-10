module stream_handler_host_module
    use :: stream_handler_module, only : stream_handler
    use :: stream_module, only : stream

    implicit none
    private

    public :: stream_handler_host

    type, extends(stream_handler) :: stream_handler_host
    contains
        procedure, nopass :: create => create
        procedure, nopass :: destroy => create
    end type stream_handler_host
contains
    subroutine create(s)
        type(stream), intent(inout) :: s

        s = stream()
    end subroutine create
end module stream_handler_host_module
