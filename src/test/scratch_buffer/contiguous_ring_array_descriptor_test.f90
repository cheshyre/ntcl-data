module contiguous_ring_array_descriptor_test_module
    use, intrinsic :: iso_fortran_env, only : int64

    use :: util_api, only : assert
    use :: contiguous_ring_array_descriptor_module, only : contiguous_ring_array_descriptor

    implicit none
    private

    public :: contiguous_ring_array_descriptor_test

    type :: contiguous_ring_array_descriptor_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type contiguous_ring_array_descriptor_test

    interface contiguous_ring_array_descriptor_test
        module procedure constructor
    end interface contiguous_ring_array_descriptor_test
contains
    function constructor() result(this)
        type(contiguous_ring_array_descriptor_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(contiguous_ring_array_descriptor_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(contiguous_ring_array_descriptor) :: descr

        call assertion%equal("contiguous_ring_array_descriptor::Test complete", .true.)

        descr = contiguous_ring_array_descriptor(0)
        call assertion%equal("contiguous_ring_array_descriptor::Correct initialization with empty constructor", &
                descr%array_size == 0 .and. &
                descr%available_size == 0 .and. &
                descr%current_offset == 0 .and. &
                descr%elements_in_use == 0 .and. &
                descr%get_next_index() == -1.and. &
                .not. descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        call assertion%equal("contiguous_ring_array_descriptor::Correct initialization with constructor", &
                descr%array_size == 3 .and. &
                descr%available_size == 3 .and. &
                descr%current_offset == 0 .and. &
                descr%elements_in_use == 0 .and. &
                descr%get_next_index() == 1.and. &
                descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        call descr%increase(1)
        call assertion%equal("contiguous_ring_array_descriptor::Correct increase with zero offset", &
                descr%array_size == 3 .and. &
                descr%available_size == 2 .and. &
                descr%current_offset == 0 .and. &
                descr%elements_in_use == 1 .and. &
                descr%get_next_index() == 2 .and. &
                descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        call descr%increase(2)
        call assertion%equal("contiguous_ring_array_descriptor::Correct increase by 2 with zero offset", &
                descr%array_size == 3 .and. &
                descr%available_size == 1 .and. &
                descr%current_offset == 0 .and. &
                descr%elements_in_use == 2 .and. &
                descr%get_next_index() == 3 .and. &
                descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        call descr%increase(3)
        call assertion%equal("contiguous_ring_array_descriptor::Correct increase by 3 with zero offset", &
                descr%array_size == 3 .and. &
                descr%available_size == 0 .and. &
                descr%current_offset == 0 .and. &
                descr%elements_in_use == 3 .and. &
                descr%get_next_index() == 1 .and. &
                descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        descr%elements_in_use = 3
        descr%available_size = 0
        call descr%decrease(1)
        call assertion%equal("contiguous_ring_array_descriptor::Correct decrease from 3 with zero offset", &
                descr%array_size == 3 .and. &
                descr%available_size == 1 .and. &
                descr%current_offset == 1 .and. &
                descr%elements_in_use == 2 .and. &
                descr%get_next_index() == 1 .and. &
                descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        descr%elements_in_use = 3
        descr%available_size = 0
        call descr%decrease(2)
        call assertion%equal("contiguous_ring_array_descriptor::Correct decrease by 2 from 3 with zero offset", &
                descr%array_size == 3 .and. &
                descr%available_size == 2 .and. &
                descr%current_offset == 2 .and. &
                descr%elements_in_use == 1 .and. &
                descr%get_next_index() == 1 .and. &
                descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        descr%elements_in_use = 3
        descr%available_size = 0
        call descr%decrease(3)
        call assertion%equal("contiguous_ring_array_descriptor::Correct decrease by 3 from 3 with zero offset", &
                descr%array_size == 3 .and. &
                descr%available_size == 3 .and. &
                descr%current_offset == 0 .and. &
                descr%elements_in_use == 0 .and. &
                descr%get_next_index() == 1 .and. &
                descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        descr%elements_in_use = 2
        descr%available_size = 1
        call descr%decrease(1)
        call assertion%equal("contiguous_ring_array_descriptor::Correct decrease from 2 with zero offset", &
                descr%array_size == 3 .and. &
                descr%available_size == 1 .and. &
                descr%current_offset == 1 .and. &
                descr%elements_in_use == 1 .and. &
                descr%get_next_index() == 3 .and. &
                descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        descr%elements_in_use = 2
        descr%available_size = 1
        call descr%decrease(2)
        call assertion%equal("contiguous_ring_array_descriptor::Correct decrease by 2 from 2 with zero offset", &
                descr%array_size == 3 .and. &
                descr%available_size == 3 .and. &
                descr%current_offset == 0 .and. &
                descr%elements_in_use == 0 .and. &
                descr%get_next_index() == 1 .and. &
                descr%is_valid())

        ! Nonzero offset
        descr = contiguous_ring_array_descriptor(3)
        descr%current_offset = 2
        call descr%increase(1)
        call assertion%equal("contiguous_ring_array_descriptor::Correct increase from zero with 2 offset", &
                descr%array_size == 3 .and. &
                descr%available_size == 2 .and. &
                descr%current_offset == 2 .and. &
                descr%elements_in_use == 1 .and. &
                descr%get_next_index() == 1 .and. &
                descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        descr%current_offset = 2
        call descr%increase(2)
        call assertion%equal("contiguous_ring_array_descriptor::Correct increase by 2 from zero with 2 offset", &
                descr%array_size == 2 .and. &
                descr%available_size == 0 .and. &
                descr%current_offset == 0 .and. &
                descr%elements_in_use == 2 .and. &
                descr%get_next_index() == 1 .and. &
                descr%is_valid())

!        write(*,*) descr%array_size, descr%current_offset, &
!                descr%elements_in_use, descr%get_next_index(), &
!                descr%is_valid()
        descr = contiguous_ring_array_descriptor(3)
        descr%current_offset = 2
        call descr%truncate_array_size(3_int64)
        descr%elements_in_use = 3
        call descr%update_available_size()
        call assertion%equal("contiguous_ring_array_descriptor::Correct increase by 3 from zero with 2 offset", &
                descr%array_size == 2 .and. &
                descr%available_size == 0 .and. &
                descr%current_offset == 0 .and. &
                descr%elements_in_use == 3 .and. &
                descr%get_next_index() == -1 .and. &
                .not. descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        descr%current_offset = 2
        descr%elements_in_use = 3
        call descr%decrease(1)
        call assertion%equal("contiguous_ring_array_descriptor::Correct decrease from 3 with 2 offset", &
                descr%array_size == 3 .and. &
                descr%available_size == 1 .and. &
                descr%current_offset == 0 .and. &
                descr%elements_in_use == 2 .and. &
                descr%get_next_index() == 3 .and. &
                descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        descr%current_offset = 2
        descr%elements_in_use = 3
        call descr%decrease(2)
        call assertion%equal("contiguous_ring_array_descriptor::Correct decrease by 2 from 3 with 2 offset", &
                descr%array_size == 3 .and. &
                descr%available_size == 1 .and. &
                descr%current_offset == 1 .and. &
                descr%elements_in_use == 1 .and. &
                descr%get_next_index() == 3 .and. &
                descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        descr%current_offset = 2
        descr%elements_in_use = 3
        call descr%decrease(3)
        call assertion%equal("contiguous_ring_array_descriptor::Correct decrease by 3 from 3 with 2 offset", &
                descr%array_size == 3 .and. &
                descr%available_size == 3 .and. &
                descr%current_offset == 0 .and. &
                descr%elements_in_use == 0 .and. &
                descr%get_next_index() == 1 .and. &
                descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        descr%current_offset = 2
        descr%elements_in_use = 2
        call descr%decrease(1)
        call assertion%equal("contiguous_ring_array_descriptor::Correct decrease from 2 with 2 offset", &
                descr%array_size == 3 .and. &
                descr%available_size == 2 .and. &
                descr%current_offset == 0 .and. &
                descr%elements_in_use == 1 .and. &
                descr%get_next_index() == 2 .and. &
                descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        descr%current_offset = 2
        descr%elements_in_use = 2
        call descr%decrease(2)
        call assertion%equal("contiguous_ring_array_descriptor::Correct decrease by 2 from 2 with 2 offset", &
                descr%array_size == 3 .and. &
                descr%available_size == 3 .and. &
                descr%current_offset == 0 .and. &
                descr%elements_in_use == 0 .and. &
                descr%get_next_index() == 1 .and. &
                descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        descr%elements_in_use = 1
        descr%current_offset = 2
        call descr%increase(1)
        call assertion%equal("contiguous_ring_array_descriptor::Correct increase from 1 with 2 offset", &
                descr%array_size == 3 .and. &
                descr%available_size == 1 .and. &
                descr%current_offset == 2 .and. &
                descr%elements_in_use == 2 .and. &
                descr%get_next_index() == 2 .and. &
                descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        descr%elements_in_use = 1
        descr%current_offset = 2
        call descr%increase(2)
        call assertion%equal("contiguous_ring_array_descriptor::Correct increase by 2 from 1 with 2 offset", &
                descr%array_size == 3 .and. &
                descr%available_size == 0 .and. &
                descr%current_offset == 2 .and. &
                descr%elements_in_use == 3 .and. &
                descr%get_next_index() == 3 .and. &
                descr%is_valid())

        descr = contiguous_ring_array_descriptor(3)
        descr%elements_in_use = 5
        call assertion%equal("contiguous_ring_array_descriptor::Too many elements with 2 offset", &
                descr%array_size == 3 .and. &
                descr%current_offset == 0 .and. &
                descr%elements_in_use == 5 .and. &
                descr%get_next_index() == -1 .and. &
                .not. descr%is_valid())
        descr = contiguous_ring_array_descriptor(3)
        descr%elements_in_use = -1
        call assertion%equal("contiguous_ring_array_descriptor::Too few elements with zero offset", &
                descr%array_size == 3 .and. &
                descr%current_offset == 0 .and. &
                descr%elements_in_use == -1 .and. &
                descr%get_next_index() == -1 .and. &
                .not. descr%is_valid())

        descr = contiguous_ring_array_descriptor(4)
        descr%elements_in_use = 2
        descr%current_offset = 2
        descr%array_size = 3
        call descr%decrease(1)
        call assertion%equal("contiguous_ring_array_descriptor::Correct decrease by 1 from 2 with 2 offset "// &
                "with truncated size to 3", &
                descr%array_size == 4 .and. &
                descr%available_size == 3 .and. &
                descr%current_offset == 0 .and. &
                descr%elements_in_use == 1 .and. &
                descr%get_next_index() == 2 .and. &
                descr%is_valid())

        descr = contiguous_ring_array_descriptor(4)
        descr%elements_in_use = 3
        descr%current_offset = 1
        descr%array_size = 3
        call descr%decrease(2)
        call assertion%equal("contiguous_ring_array_descriptor::Correct decrease by 2 from 3 with 1 offset "// &
                "with truncated size to 3", &
                descr%array_size == 4 .and. &
                descr%available_size == 3 .and. &
                descr%current_offset == 0 .and. &
                descr%elements_in_use == 1 .and. &
                descr%get_next_index() == 2 .and. &
                descr%is_valid())
    end subroutine run

    subroutine cleanup(this)
        class(contiguous_ring_array_descriptor_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(contiguous_ring_array_descriptor_test), intent(inout) :: this
    end subroutine clear
end module contiguous_ring_array_descriptor_test_module
