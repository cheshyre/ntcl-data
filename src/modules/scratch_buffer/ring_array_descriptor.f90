module ring_array_descriptor_module
    implicit none
    private

    public :: ring_array_descriptor

    type :: ring_array_descriptor
        integer :: array_size, current_offset, elements_in_use
    contains
        procedure :: get_array_index => get_array_index
        procedure :: get_next_index => get_next_index
        procedure :: increase => increase
        procedure :: decrease => decrease
        procedure :: reset => reset
        procedure :: is_full => is_full
        procedure :: cleanup => cleanup
        procedure :: clear => clear
        procedure :: is_valid => is_valid
    end type ring_array_descriptor

    interface ring_array_descriptor
        module procedure constructor_empty
        module procedure constructor
    end interface ring_array_descriptor

contains
    function constructor_empty() result(this)
        type(ring_array_descriptor) :: this

        call this%clear()
    end function constructor_empty

    function constructor(array_size) result(this)
        integer, intent(in) :: array_size
        type(ring_array_descriptor) :: this

        this = ring_array_descriptor()
        this%array_size = array_size
    end function constructor

    integer function get_array_index(this, idx)
        class(ring_array_descriptor), intent(in) :: this
        integer, intent(in) :: idx

        get_array_index = -1
        if ( this%is_valid() ) &
                get_array_index = mod(this%current_offset+idx-1, this%array_size) + 1
    end function get_array_index

    integer function get_next_index(this)
        class(ring_array_descriptor), intent(in) :: this

        get_next_index = this%get_array_index(this%elements_in_use+1)
    end function get_next_index

    logical function is_full(this)
        class(ring_array_descriptor), intent(in) :: this

        is_full = this%elements_in_use == this%array_size
    end function is_full

    subroutine reset(this)
        class(ring_array_descriptor), intent(inout) :: this

        this%current_offset = 0
        this%elements_in_use = 0
    end subroutine reset

    logical function is_valid(this)
        class(ring_array_descriptor), intent(in) :: this

        is_valid = this%array_size > 0 .and. &
                this%elements_in_use <= this%array_size .and. &
                this%elements_in_use >= 0
    end function is_valid

    subroutine increase(this, counter)
        class(ring_array_descriptor), intent(inout) :: this
        integer, intent(in), optional :: counter

        integer :: increase_by

        increase_by = 1
        if ( present(counter) ) increase_by = counter

        this%elements_in_use = this%elements_in_use + increase_by

        if ( .not. this%is_valid() ) &
                error stop "ring_array_descriptor:increase:Request to large."
    end subroutine increase

    subroutine decrease(this, counter)
        class(ring_array_descriptor), intent(inout) :: this
        integer, intent(in), optional :: counter

        integer :: decrease_by

        decrease_by = 1
        if ( present(counter) ) decrease_by = counter

        this%elements_in_use = this%elements_in_use - decrease_by
        this%current_offset = mod(this%current_offset + decrease_by, this%array_size)

        if ( .not. this%is_valid() ) &
                error stop "ring_array_descriptor:decrease:Request to large."
    end subroutine decrease

    subroutine cleanup(this)
        class(ring_array_descriptor), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(ring_array_descriptor), intent(inout) :: this

        this%array_size = 0
        call this%reset()
    end subroutine clear
end module ring_array_descriptor_module
