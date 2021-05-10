module event_handler_cuda_module
    use :: event_handler_module, only : event_handler
    use :: event_module, only : event
    use :: cuda_concurrency_interface, only : &
            cuda_create_event, &
            cuda_destroy_event

    implicit none
    private

    public :: event_handler_cuda

    type, extends(event_handler) :: event_handler_cuda
    contains
        procedure, nopass :: create => create
        procedure, nopass :: destroy => destroy
    end type event_handler_cuda
contains
    subroutine create(e)
        type(event), intent(inout) :: e

        e%eid = cuda_create_event()
    end subroutine create

    subroutine destroy(e)
        type(event), intent(inout) :: e

        call cuda_destroy_event(e%eid)
        e = event()
    end subroutine destroy
end module event_handler_cuda_module
