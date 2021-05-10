module event_handler_hip_module
    use :: event_handler_module, only : event_handler
    use :: event_module, only : event
    use :: hip_concurrency_interface, only : &
            hip_create_event, &
            hip_destroy_event

    implicit none
    private

    public :: event_handler_hip

    type, extends(event_handler) :: event_handler_hip
    contains
        procedure, nopass :: create => create
        procedure, nopass :: destroy => destroy
    end type event_handler_hip
contains
    subroutine create(e)
        type(event), intent(inout) :: e

        e%eid = hip_create_event()
    end subroutine create

    subroutine destroy(e)
        type(event), intent(inout) :: e

        call hip_destroy_event(e%eid)
        e = event()
    end subroutine destroy
end module event_handler_hip_module
