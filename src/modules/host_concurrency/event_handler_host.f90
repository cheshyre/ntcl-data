module event_handler_host_module
    use :: event_handler_module, only : event_handler
    use :: event_module, only : event

    implicit none
    private

    public :: event_handler_host

    type, extends(event_handler) :: event_handler_host
    contains
        procedure, nopass :: create => create
        procedure, nopass :: destroy => create
    end type event_handler_host
contains
    subroutine create(e)
        type(event), intent(inout) :: e

        e = event()
    end subroutine create
end module event_handler_host_module
