module event_handler_cuda_test_module
    use, intrinsic :: iso_c_binding, only : c_associated, c_loc

    use :: util_api, only : assert

    use :: data_api, only : &
            concurrency_factory, &
            event, &
            event_handler

    use :: event_handler_cuda_module, only : event_handler_cuda
    use :: cuda_concurrency_interface, only : &
            cuda_query_event

    implicit none
    private

    public :: event_handler_cuda_test

    type :: event_handler_cuda_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type event_handler_cuda_test

    interface event_handler_cuda_test
        module procedure constructor
    end interface event_handler_cuda_test
contains
    function constructor() result(this)
        type(event_handler_cuda_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(event_handler_cuda_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(event_handler_cuda) :: handler
        type(event) :: aevent
        class(event_handler), allocatable :: ahandler

        call assertion%equal("event_handler_cuda::Test complete", .true.)

        call handler%create(aevent)
        call assertion%equal("event_handler_cuda::Creates event", &
                c_associated(aevent%eid) .and. cuda_query_event(aevent%eid) == 0)

        call handler%destroy(aevent)
        call assertion%equal("event_handler_cuda::Destroys event", &
                .not. c_associated(aevent%eid))

        call concurrency_factory%create_default_event_handler(ahandler, "device")
        call assertion%equal("event_handler_cuda::Create event handler:Same type", &
                same_type_as(handler, ahandler))
        deallocate(ahandler)
    end subroutine run

    subroutine cleanup(this)
        class(event_handler_cuda_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(event_handler_cuda_test), intent(inout) :: this
    end subroutine clear
end module event_handler_cuda_test_module
