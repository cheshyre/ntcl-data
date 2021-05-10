module event_handler_module
    use :: event_module, only : event

    implicit none
    private

    public :: event_handler

    type, abstract :: event_handler
    contains
        procedure(event_interface), deferred, nopass :: create
        procedure(event_interface), deferred, nopass :: destroy
    end type event_handler

    abstract interface
        subroutine event_interface(e)
            import :: event
            type(event), intent(inout) :: e
        end subroutine event_interface
    end interface
end module event_handler_module
