module ring_array_descriptor_test_module
    use :: util_api, only : assert
    use :: ring_array_descriptor_module, only : ring_array_descriptor

    implicit none
    private

    public :: ring_array_descriptor_test

    type :: ring_array_descriptor_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type ring_array_descriptor_test

    interface ring_array_descriptor_test
        module procedure constructor
    end interface ring_array_descriptor_test
contains
    function constructor() result(this)
        type(ring_array_descriptor_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(ring_array_descriptor_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(ring_array_descriptor) :: aring_array_descriptor

        call assertion%equal("ring_array_descriptor::Test complete", .true.)

        aring_array_descriptor = ring_array_descriptor(0)
        call assertion%equal("ring_array_descriptor::Correct initialization with empty constructor", &
                aring_array_descriptor%array_size == 0 .and. &
                aring_array_descriptor%current_offset == 0 .and. &
                aring_array_descriptor%elements_in_use == 0 .and. &
                aring_array_descriptor%get_next_index() == -1.and. &
                .not. aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        call assertion%equal("ring_array_descriptor::Correct initialization with constructor", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 0 .and. &
                aring_array_descriptor%elements_in_use == 0 .and. &
                aring_array_descriptor%get_next_index() == 1.and. &
                aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        call aring_array_descriptor%increase()
        call assertion%equal("ring_array_descriptor::Correct increase with zero offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 0 .and. &
                aring_array_descriptor%elements_in_use == 1 .and. &
                aring_array_descriptor%get_next_index() == 2 .and. &
                aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        call aring_array_descriptor%increase(2)
        call assertion%equal("ring_array_descriptor::Correct increase by 2 with zero offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 0 .and. &
                aring_array_descriptor%elements_in_use == 2 .and. &
                aring_array_descriptor%get_next_index() == 3 .and. &
                aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        call aring_array_descriptor%increase(3)
        call assertion%equal("ring_array_descriptor::Correct increase by 3 with zero offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 0 .and. &
                aring_array_descriptor%elements_in_use == 3 .and. &
                aring_array_descriptor%get_next_index() == 1 .and. &
                aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        aring_array_descriptor%elements_in_use = 3
        call aring_array_descriptor%decrease()
        call assertion%equal("ring_array_descriptor::Correct decrease from 3 with zero offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 1 .and. &
                aring_array_descriptor%elements_in_use == 2 .and. &
                aring_array_descriptor%get_next_index() == 1 .and. &
                aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        aring_array_descriptor%elements_in_use = 3
        call aring_array_descriptor%decrease(2)
        call assertion%equal("ring_array_descriptor::Correct decrease by 2 from 3 with zero offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 2 .and. &
                aring_array_descriptor%elements_in_use == 1 .and. &
                aring_array_descriptor%get_next_index() == 1 .and. &
                aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        aring_array_descriptor%elements_in_use = 3
        call aring_array_descriptor%decrease(3)
        call assertion%equal("ring_array_descriptor::Correct decrease by 3 from 3 with zero offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 0 .and. &
                aring_array_descriptor%elements_in_use == 0 .and. &
                aring_array_descriptor%get_next_index() == 1 .and. &
                aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        aring_array_descriptor%elements_in_use = 2
        call aring_array_descriptor%decrease()
        call assertion%equal("ring_array_descriptor::Correct decrease from 2 with zero offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 1 .and. &
                aring_array_descriptor%elements_in_use == 1 .and. &
                aring_array_descriptor%get_next_index() == 3 .and. &
                aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        aring_array_descriptor%elements_in_use = 2
        call aring_array_descriptor%decrease(2)
        call assertion%equal("ring_array_descriptor::Correct decrease by 2 from 2 with zero offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 2 .and. &
                aring_array_descriptor%elements_in_use == 0 .and. &
                aring_array_descriptor%get_next_index() == 3 .and. &
                aring_array_descriptor%is_valid())


        ! Nonzero offset
        aring_array_descriptor = ring_array_descriptor(3)
        aring_array_descriptor%current_offset = 2
        call aring_array_descriptor%increase()
        call assertion%equal("ring_array_descriptor::Correct increase from zero with 2 offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 2 .and. &
                aring_array_descriptor%elements_in_use == 1 .and. &
                aring_array_descriptor%get_next_index() == 1 .and. &
                aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        aring_array_descriptor%current_offset = 2
        call aring_array_descriptor%increase(2)
        call assertion%equal("ring_array_descriptor::Correct increase by 2 from zero with 2 offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 2 .and. &
                aring_array_descriptor%elements_in_use == 2 .and. &
                aring_array_descriptor%get_next_index() == 2 .and. &
                aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        aring_array_descriptor%current_offset = 2
        call aring_array_descriptor%increase(3)
        call assertion%equal("ring_array_descriptor::Correct increase by 3 from zero with 2 offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 2 .and. &
                aring_array_descriptor%elements_in_use == 3 .and. &
                aring_array_descriptor%get_next_index() == 3 .and. &
                aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        aring_array_descriptor%current_offset = 2
        aring_array_descriptor%elements_in_use = 3
        call aring_array_descriptor%decrease()
        call assertion%equal("ring_array_descriptor::Correct decrease from 3 with 2 offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 0 .and. &
                aring_array_descriptor%elements_in_use == 2 .and. &
                aring_array_descriptor%get_next_index() == 3 .and. &
                aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        aring_array_descriptor%current_offset = 2
        aring_array_descriptor%elements_in_use = 3
        call aring_array_descriptor%decrease(2)
        call assertion%equal("ring_array_descriptor::Correct decrease by 2 from 3 with 2 offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 1 .and. &
                aring_array_descriptor%elements_in_use == 1 .and. &
                aring_array_descriptor%get_next_index() == 3 .and. &
                aring_array_descriptor%is_valid())

!        write(*,*) aring_array_descriptor%array_size, aring_array_descriptor%current_offset, &
!                aring_array_descriptor%elements_in_use, aring_array_descriptor%get_next_index(), &
!                aring_array_descriptor%is_valid()
        aring_array_descriptor = ring_array_descriptor(3)
        aring_array_descriptor%current_offset = 2
        aring_array_descriptor%elements_in_use = 3
        call aring_array_descriptor%decrease(3)
        call assertion%equal("ring_array_descriptor::Correct decrease by 3 from 3 with 2 offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 2 .and. &
                aring_array_descriptor%elements_in_use == 0 .and. &
                aring_array_descriptor%get_next_index() == 3 .and. &
                aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        aring_array_descriptor%current_offset = 2
        aring_array_descriptor%elements_in_use = 2
        call aring_array_descriptor%decrease()
        call assertion%equal("ring_array_descriptor::Correct decrease from 2 with 2 offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 0 .and. &
                aring_array_descriptor%elements_in_use == 1 .and. &
                aring_array_descriptor%get_next_index() == 2 .and. &
                aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        aring_array_descriptor%current_offset = 2
        aring_array_descriptor%elements_in_use = 2
        call aring_array_descriptor%decrease(2)
        call assertion%equal("ring_array_descriptor::Correct decrease by 2 from 2 with zero 2", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 1 .and. &
                aring_array_descriptor%elements_in_use == 0 .and. &
                aring_array_descriptor%get_next_index() == 2 .and. &
                aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        aring_array_descriptor%elements_in_use = 1
        aring_array_descriptor%current_offset = 2
        call aring_array_descriptor%increase()
        call assertion%equal("ring_array_descriptor::Correct increase from 1 with 2 offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 2 .and. &
                aring_array_descriptor%elements_in_use == 2 .and. &
                aring_array_descriptor%get_next_index() == 2 .and. &
                aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        aring_array_descriptor%elements_in_use = 1
        aring_array_descriptor%current_offset = 2
        call aring_array_descriptor%increase(2)
        call assertion%equal("ring_array_descriptor::Correct increase by 2 from 1 with 2 offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 2 .and. &
                aring_array_descriptor%elements_in_use == 3 .and. &
                aring_array_descriptor%get_next_index() == 3 .and. &
                aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        aring_array_descriptor%elements_in_use = 5
        call assertion%equal("ring_array_descriptor::Too many elements with 2 offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 0 .and. &
                aring_array_descriptor%elements_in_use == 5 .and. &
                aring_array_descriptor%get_next_index() == -1 .and. &
                .not. aring_array_descriptor%is_valid())

        aring_array_descriptor = ring_array_descriptor(3)
        aring_array_descriptor%elements_in_use = -1
        call assertion%equal("ring_array_descriptor::Too few elements with zero offset", &
                aring_array_descriptor%array_size == 3 .and. &
                aring_array_descriptor%current_offset == 0 .and. &
                aring_array_descriptor%elements_in_use == -1 .and. &
                aring_array_descriptor%get_next_index() == -1 .and. &
                .not. aring_array_descriptor%is_valid())
    end subroutine run

    subroutine cleanup(this)
        class(ring_array_descriptor_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(ring_array_descriptor_test), intent(inout) :: this
    end subroutine clear
end module ring_array_descriptor_test_module
