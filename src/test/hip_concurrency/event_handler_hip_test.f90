module event_handler_hip_test_module
    use, intrinsic :: iso_c_binding, only : c_associated, c_loc

    use :: util_api, only : assert
    use :: event_handler_hip_module, only : event_handler_hip

    use :: event_module, only : event
    use :: hip_concurrency_interface, only : &
            hip_query_event

    implicit none
    private

    public :: event_handler_hip_test

    type :: event_handler_hip_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type event_handler_hip_test

    interface event_handler_hip_test
        module procedure constructor
    end interface event_handler_hip_test
contains
    function constructor() result(this)
        type(event_handler_hip_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(event_handler_hip_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(event_handler_hip) :: handler
        type(event) :: aevent

        call assertion%equal("event_handler_hip::Test complete", .true.)

        call handler%create(aevent)
        call assertion%equal("event_handler_hip::Creates event", &
                c_associated(aevent%eid) .and. hip_query_event(aevent%eid) == 0)

        call handler%destroy(aevent)
        call assertion%equal("event_handler_hip::Destroys event", &
                .not. c_associated(aevent%eid))
    end subroutine run

    subroutine cleanup(this)
        class(event_handler_hip_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(event_handler_hip_test), intent(inout) :: this
    end subroutine clear
end module event_handler_hip_test_module
