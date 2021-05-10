module slot_manager_test_module
    use, intrinsic :: iso_fortran_env, only : int64
    use, intrinsic :: iso_c_binding, only : &
            c_ptr, &
            c_loc, &
            c_associated

    use :: util_api, only : assert
    use :: slot_manager_module, only : slot_manager

    implicit none
    private

    public :: slot_manager_test

    type :: slot_manager_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type slot_manager_test

    interface slot_manager_test
        module procedure constructor
    end interface slot_manager_test
contains
    function constructor() result(this)
        type(slot_manager_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(slot_manager_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(slot_manager) :: aslot_manager
        integer :: nchks, nslots
        integer, target :: dummy, dummy2
        type(c_ptr) :: dptr, dptr2
        integer(int64) :: bytes_to_clear

        dummy = 2; dummy2 = 4
        dptr = c_loc(dummy)

        call assertion%equal("slot_manager::Test complete", .true.)

        aslot_manager = slot_manager()
        call assertion%equal("slot_manager::Uninitialized after empty constructor", &
                (.not. allocated(aslot_manager%slots)) .and. &
                aslot_manager%counter%array_size == 0 )

        nslots = 1

        aslot_manager = slot_manager(nslots)
        call assertion%equal("slot_manager::Uninitialized after proper constructor", &
                (.not. allocated(aslot_manager%slots)) .and. &
                aslot_manager%counter%array_size == nslots )

        nslots = 20
        aslot_manager = slot_manager(nslots)
        call aslot_manager%initialize()
        call assertion%equal("slot_manager::Initialized after initialize", &
                allocated(aslot_manager%slots) .and. &
                size(aslot_manager%slots) == nslots .and. &
                aslot_manager%counter%array_size == nslots )

        call aslot_manager%cleanup()
        call assertion%equal("slot_manager::Uninitialized after cleanup", &
                (.not. allocated(aslot_manager%slots)) .and. &
                aslot_manager%counter%array_size == 0 )

        nslots = 1
        aslot_manager = slot_manager(nslots)
        call aslot_manager%initialize()

        call assertion%equal("slot_manager::has_more_slots for 1 of 1", &
                aslot_manager%has_more_slots() )
        call aslot_manager%counter%increase()
        call assertion%equal("slot_manager::No more slots because of counter", &
                .not. aslot_manager%has_more_slots() )
        call aslot_manager%counter%decrease()
        aslot_manager%slots(1)%stat = 1
        call assertion%equal("slot_manager::No more slots because of slot status", &
                .not. aslot_manager%has_more_slots() )
        call aslot_manager%clear_slot(1)
        call assertion%equal("slot_manager::has_more_slots after clear_slot", &
                aslot_manager%has_more_slots() )

        call aslot_manager%add_slot(dptr, int(4, int64))
        call assertion%equal("slot_manager::add_slot for 0 of 1 slots", &
               c_associated(aslot_manager%slots(1)%address, dptr) .and. &
               aslot_manager%slots(1)%number_of_bytes == 4 .and. &
               aslot_manager%slots(1)%stat == 1 .and. &
               (.not. aslot_manager%has_more_slots()) .and. &
               aslot_manager%counter%elements_in_use == 1 .and. &
               aslot_manager%find_slot(dptr) == 1)

        call aslot_manager%mark_slot_for_destruction(dptr)
        call assertion%equal("slot_manager::Mark for destruction for 1 of 1 slots", &
               c_associated(aslot_manager%slots(1)%address, dptr) .and. &
               aslot_manager%slots(1)%number_of_bytes == 4 .and. &
               aslot_manager%slots(1)%stat == 2 .and. &
               (.not. aslot_manager%has_more_slots()) .and. &
               aslot_manager%counter%elements_in_use == 1 .and. &
               aslot_manager%find_slot(dptr) == 1)

        call aslot_manager%mark_unmarked_slots_with_checkpoint(1)
        call assertion%equal("slot_manager::Mark slots with checkpoint", &
               c_associated(aslot_manager%slots(1)%address , dptr) .and. &
               aslot_manager%slots(1)%number_of_bytes == 4 .and. &
               aslot_manager%slots(1)%stat == 2 .and. &
               aslot_manager%slots(1)%checkpoint == 1 .and. &
               (.not. aslot_manager%has_more_slots()) .and. &
               aslot_manager%counter%elements_in_use == 1 .and. &
               aslot_manager%find_slot(dptr) == 1)

        bytes_to_clear = aslot_manager%clear_slots_associated_with_a_checkpoint(1)
        call assertion%equal("slot_manager::Clear slots with checkpoint", &
                bytes_to_clear == 4 .and. &
                (.not. c_associated(aslot_manager%slots(1)%address)) .and. &
               aslot_manager%slots(1)%number_of_bytes == 0 .and. &
               aslot_manager%slots(1)%stat == 3 .and. &
               aslot_manager%slots(1)%checkpoint == 0 .and. &
               aslot_manager%has_more_slots() .and. &
               aslot_manager%counter%elements_in_use == 0 .and. &
               aslot_manager%find_slot(dptr) == 0)

        aslot_manager = slot_manager(2)
        call aslot_manager%initialize()

        dptr = c_loc(dummy)
        dptr2 = c_loc(dummy2)
        call aslot_manager%add_slot(dptr, int(20, int64))
        call aslot_manager%add_slot(dptr2, int(20, int64))
        call aslot_manager%mark_slot_for_destruction(dptr2)
        call aslot_manager%mark_slot_for_destruction(dptr)
        call assertion%equal("slot_manager::All slots marked for destruction", &
                aslot_manager%slots(1)%stat==2 .and. aslot_manager%slots(2)%stat==2)
        call aslot_manager%mark_unmarked_slots_with_checkpoint(1)
        call assertion%equal("slot_manager::All slots have checkpoint", &
                aslot_manager%slots(1)%checkpoint==1 .and. aslot_manager%slots(2)%checkpoint==1)
        call assertion%equal("slot_manager::Bytes cleared in clear_slots", &
                aslot_manager%clear_slots_associated_with_a_checkpoint(1)==40)
        call assertion%equal("slot_manager::All slots cleared after clear slots", &
                aslot_manager%slots(1)%stat==3 .and. aslot_manager%slots(2)%stat==3)

    end subroutine run

    subroutine cleanup(this)
        class(slot_manager_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(slot_manager_test), intent(inout) :: this
    end subroutine clear
end module slot_manager_test_module
