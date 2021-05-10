module event_test_module
    use, intrinsic :: iso_c_binding, only : c_associated, c_loc

    use :: util_api, only : assert
    use :: event_module, only : event

    implicit none
    private

    public :: event_test

    type :: event_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type event_test

    interface event_test
        module procedure constructor
    end interface event_test
contains
    function constructor() result(this)
        type(event_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(event_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(event) :: aevent
        real, target :: dummy

        call assertion%equal("event::Test complete", .true.)

        aevent = event()
        call assertion%equal("event::Initizalized with null pointer", .not. c_associated(aevent%eid))

        aevent = event(c_loc(dummy))
        call assertion%equal("event::Initizalized with nonzero pointer", c_associated(aevent%eid))
    end subroutine run

    subroutine cleanup(this)
        class(event_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(event_test), intent(inout) :: this
    end subroutine clear
end module event_test_module
