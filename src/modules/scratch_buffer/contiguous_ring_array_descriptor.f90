module contiguous_ring_array_descriptor_module
    use, intrinsic :: iso_fortran_env, only : int64

    implicit none
    private

    public :: contiguous_ring_array_descriptor

    type :: contiguous_ring_array_descriptor
        integer(int64) :: array_size, current_offset, elements_in_use, total_size
        integer(int64) :: available_size
    contains
        procedure :: get_array_index => get_array_index
        procedure :: get_next_index => get_next_index
        procedure :: get_available_size => get_available_size
        generic :: increase => increase_int64, increase_int32
        generic :: decrease => decrease_int32, decrease_int64
        procedure :: increase_int32 => increase_int32
        procedure :: increase_int64 => increase_int64
        procedure :: decrease_int32 => decrease_int32
        procedure :: decrease_int64 => decrease_int64
        procedure :: reset => reset
        procedure :: cleanup => cleanup
        procedure :: clear => clear
        procedure :: is_valid => is_valid
        procedure :: truncate_array_size => truncate_array_size
        procedure :: restore_array_size => restore_array_size
        procedure :: update_available_size => update_available_size
    end type contiguous_ring_array_descriptor

    interface contiguous_ring_array_descriptor
        module procedure constructor_empty
        module procedure constructor
        module procedure constructor_int32
    end interface contiguous_ring_array_descriptor

contains
    function constructor_empty() result(this)
        type(contiguous_ring_array_descriptor) :: this

        call this%clear()
    end function constructor_empty

    function constructor_int32(total_size) result(this)
        integer, intent(in) :: total_size
        type(contiguous_ring_array_descriptor) :: this

        this = contiguous_ring_array_descriptor(int(total_size, int64))
    end function constructor_int32

    function constructor(total_size) result(this)
        integer(int64), intent(in) :: total_size
        type(contiguous_ring_array_descriptor) :: this

        this = contiguous_ring_array_descriptor()
        this%total_size = total_size
        call this%reset()
    end function constructor

    integer(int64) function get_array_index(this, idx)
        class(contiguous_ring_array_descriptor), intent(in) :: this
        integer(int64), intent(in) :: idx

        get_array_index = -1
        if ( this%is_valid() ) &
                get_array_index = mod(this%current_offset+idx-1, this%array_size) + 1
    end function get_array_index

    integer(int64) function get_next_index(this)
        class(contiguous_ring_array_descriptor), intent(in) :: this

        get_next_index = this%get_array_index(this%elements_in_use+1)
    end function get_next_index

    integer(int64) function get_available_size(this)
        class(contiguous_ring_array_descriptor), intent(in) :: this

        get_available_size = this%available_size
    end function get_available_size

    subroutine reset(this)
        class(contiguous_ring_array_descriptor), intent(inout) :: this

        this%current_offset = 0
        this%elements_in_use = 0
        this%array_size = this%total_size
        this%available_size = this%array_size
    end subroutine reset

    logical function is_valid(this)
        class(contiguous_ring_array_descriptor), intent(in) :: this

        is_valid = this%array_size > 0 .and. &
                this%elements_in_use <= this%array_size .and. &
                this%elements_in_use >= 0
    end function is_valid

    subroutine increase_int32(this, increase_by)
        class(contiguous_ring_array_descriptor), intent(inout) :: this
        integer, intent(in) :: increase_by

        call this%increase(int(increase_by, int64))
    end subroutine increase_int32

    subroutine increase_int64(this, increase_by)
        class(contiguous_ring_array_descriptor), intent(inout) :: this
        integer(int64), intent(in) :: increase_by

        call this%truncate_array_size(increase_by)

        this%elements_in_use = this%elements_in_use + increase_by
        call this%update_available_size()

        if ( .not. this%is_valid() ) &
                error stop "contiguous_ring_array_descriptor:increase:Request to large."
    end subroutine increase_int64

    subroutine truncate_array_size(this, increase_by)
        class(contiguous_ring_array_descriptor), intent(inout) :: this
        integer(int64), intent(in) :: increase_by

        integer(int64) :: last, next

        next = this%get_next_index()
        last = next - 1
        if ( next > this%current_offset .and. &
                last + increase_by > this%array_size ) then
            this%array_size = last
            this%current_offset = mod(this%current_offset, this%array_size)
        end if
    end subroutine truncate_array_size

    subroutine decrease_int32(this, decrease_by)
        class(contiguous_ring_array_descriptor), intent(inout) :: this
        integer, intent(in) :: decrease_by

        call this%decrease(int(decrease_by, int64))
    end subroutine decrease_int32

    subroutine decrease_int64(this, decrease_by)
        class(contiguous_ring_array_descriptor), intent(inout) :: this
        integer(int64), intent(in) :: decrease_by

        this%elements_in_use = this%elements_in_use - decrease_by
        this%current_offset = mod(this%current_offset + decrease_by, this%array_size)

        call this%restore_array_size()
        if ( this%elements_in_use == 0 ) then
            call this%reset()
        else
            call this%update_available_size()
        end if

        if ( .not. this%is_valid() ) &
                error stop "contiguous_ring_array_descriptor:decrease:Request to large."
    end subroutine decrease_int64

    subroutine restore_array_size(this)
        class(contiguous_ring_array_descriptor), intent(inout) :: this

        if ( this%current_offset == 0 ) this%array_size = this%total_size
    end subroutine restore_array_size

    subroutine update_available_size(this)
        class(contiguous_ring_array_descriptor), intent(inout) :: this

        integer(int64) :: next

        next = this%get_next_index()

        if ( next > this%current_offset ) then
            this%available_size = max(this%array_size - next + 1, this%current_offset)
        else
            this%available_size = this%current_offset - next + 1
        end if
        if ( this%elements_in_use >= this%array_size .or. this%get_next_index() == -1 ) this%available_size = 0
    end subroutine update_available_size

    subroutine cleanup(this)
        class(contiguous_ring_array_descriptor), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(contiguous_ring_array_descriptor), intent(inout) :: this

        this%total_size = 0
        call this%reset()
    end subroutine clear
end module contiguous_ring_array_descriptor_module
