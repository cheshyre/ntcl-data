module stream_handler_module
    use :: stream_module, only : stream

    implicit none
    private

    public :: stream_handler

    type, abstract :: stream_handler
    contains
        procedure(stream_interface), deferred, nopass :: create
        procedure(stream_interface), deferred, nopass :: destroy
    end type stream_handler

    abstract interface
        subroutine stream_interface(s)
            import :: stream
            type(stream), intent(inout) :: s
        end subroutine stream_interface
    end interface
end module stream_handler_module
