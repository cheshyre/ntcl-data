! Auto-generated -- DO NOT MODIFY
module scratch_buffer_package_test_module
    use :: util_api, only : &
            selector, &
            assert

    use :: ring_array_descriptor_test_module, only : ring_array_descriptor_test
    use :: contiguous_ring_array_descriptor_test_module, only : contiguous_ring_array_descriptor_test
    use :: ring_buffer_test_module, only : ring_buffer_test
    use :: slot_manager_test_module, only : slot_manager_test
    use :: checkpoint_manager_test_module, only : checkpoint_manager_test
    use :: scratch_buffer_test_module, only : scratch_buffer_test

    implicit none
    private

    public :: scratch_buffer_package_test

    type :: scratch_buffer_package_test
        type(selector) :: test_selector
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type scratch_buffer_package_test

    interface scratch_buffer_package_test
        module procedure constructor
    end interface scratch_buffer_package_test

contains
    function constructor(aselector) result(this)
        type(selector), intent(in) :: aselector
        type(scratch_buffer_package_test) :: this

        call this%clear()

        this%test_selector = aselector
    end function constructor

    subroutine run(this, assertion)
        class(scratch_buffer_package_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(ring_array_descriptor_test) :: aring_array_descriptor_test
        type(contiguous_ring_array_descriptor_test) :: acontiguous_ring_array_descriptor_test
        type(ring_buffer_test) :: aring_buffer_test
        type(slot_manager_test) :: aslot_manager_test
        type(checkpoint_manager_test) :: acheckpoint_manager_test
        type(scratch_buffer_test) :: ascratch_buffer_test

        call assertion%equal("scratch_buffer::Package test complete", .true.)

        if ( &
                this%test_selector%is_enabled("ring_array_descriptor") ) then
            aring_array_descriptor_test = ring_array_descriptor_test()
            call aring_array_descriptor_test%run(assertion)
            call aring_array_descriptor_test%cleanup()
        end if

        if ( &
                this%test_selector%is_enabled("contiguous_ring_array_descriptor") ) then
            acontiguous_ring_array_descriptor_test = contiguous_ring_array_descriptor_test()
            call acontiguous_ring_array_descriptor_test%run(assertion)
            call acontiguous_ring_array_descriptor_test%cleanup()
        end if

        if ( &
                this%test_selector%is_enabled("ring_buffer") ) then
            aring_buffer_test = ring_buffer_test()
            call aring_buffer_test%run(assertion)
            call aring_buffer_test%cleanup()
        end if

        if ( &
                this%test_selector%is_enabled("slot_manager") ) then
            aslot_manager_test = slot_manager_test()
            call aslot_manager_test%run(assertion)
            call aslot_manager_test%cleanup()
        end if

        if ( &
                this%test_selector%is_enabled("checkpoint_manager") ) then
            acheckpoint_manager_test = checkpoint_manager_test()
            call acheckpoint_manager_test%run(assertion)
            call acheckpoint_manager_test%cleanup()
        end if

        if ( &
                this%test_selector%is_enabled("scratch_buffer") ) then
            ascratch_buffer_test = scratch_buffer_test()
            call ascratch_buffer_test%run(assertion)
            call ascratch_buffer_test%cleanup()
        end if

    end subroutine run

    subroutine cleanup(this)
        class(scratch_buffer_package_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(scratch_buffer_package_test), intent(inout) :: this
    end subroutine clear
end module scratch_buffer_package_test_module
