module event_handler_host_test_module
    use, intrinsic :: iso_c_binding, only : c_associated, c_loc

    use :: util_api, only : assert
    use :: event_handler_host_module, only : event_handler_host

    use :: event_module, only : event
    implicit none
    private

    public :: event_handler_host_test

    type :: event_handler_host_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type event_handler_host_test

    interface event_handler_host_test
        module procedure constructor
    end interface event_handler_host_test
contains
    function constructor() result(this)
        type(event_handler_host_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(event_handler_host_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(event_handler_host) :: handler
        type(event) :: aevent
        real, target :: dummy

        call assertion%equal("event_handler_host::Test complete", .true.)

        aevent = event(c_loc(dummy))
        call handler%create(aevent)
        call assertion%equal("event_handler_host::Creates event with null pointer", &
                .not. c_associated(aevent%eid))

        aevent = event(c_loc(dummy))
        call handler%destroy(aevent)
        call assertion%equal("event_handler_host::Destroys event with null pointer", &
                .not. c_associated(aevent%eid))
    end subroutine run

    subroutine cleanup(this)
        class(event_handler_host_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(event_handler_host_test), intent(inout) :: this
    end subroutine clear
end module event_handler_host_test_module
