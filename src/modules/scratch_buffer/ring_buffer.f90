module ring_buffer_module
    use, intrinsic :: iso_fortran_env, only : int64

    use :: memory_api, only : &
            data_storage, &
            data_builder

    use :: contiguous_ring_array_descriptor_module, only : contiguous_ring_array_descriptor

    implicit none
    private

    public :: ring_buffer

    type :: ring_buffer
        class(data_builder), allocatable :: builder
        class(data_storage), allocatable :: internal_buffer
        type(contiguous_ring_array_descriptor) :: counter
    contains
        procedure :: allocate_storage_object => allocate_storage_object
        procedure :: allocate_buffer => allocate_buffer
        procedure :: add_buffer => add_buffer
        procedure :: del_buffer => del_buffer
        procedure :: get_available_size => get_available_size
        procedure :: reset => reset
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type ring_buffer

    interface ring_buffer
        module procedure constructor_empty
        module procedure constructor_int32
        module procedure constructor
    end interface ring_buffer

contains
    function constructor_empty() result(this)
        type(ring_buffer) :: this

        call this%clear()
    end function constructor_empty

    function constructor(buffer, number_of_bytes) result(this)
        class(data_storage), intent(in) :: buffer
        integer(int64), intent(in) :: number_of_bytes
        type(ring_buffer) :: this

        this%counter = contiguous_ring_array_descriptor(number_of_bytes)
        this%internal_buffer = buffer
    end function constructor

    function constructor_int32(buffer, number_of_bytes) result(this)
        class(data_storage), intent(in) :: buffer
        integer, intent(in) :: number_of_bytes
        type(ring_buffer) :: this

        this = ring_buffer(buffer, int(number_of_bytes, int64))
    end function constructor_int32

    subroutine allocate_storage_object(this, storage)
        class(ring_buffer), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: storage

        if ( .not. allocated(this%internal_buffer) ) &
                error stop "ring_buffer::allocate_storage_object:Internal buffer is not allocated."

        allocate(storage, mold=this%internal_buffer)
    end subroutine allocate_storage_object

    subroutine allocate_buffer(this)
        class(ring_buffer), intent(inout) :: this

        if ( this%internal_buffer%is_allocated .and. &
                this%internal_buffer%number_of_bytes /= this%counter%total_size ) &
                        call this%internal_buffer%deallocate_data()

        if ( .not. this%internal_buffer%is_allocated ) &
                call this%internal_buffer%allocate_data(this%counter%total_size)
    end subroutine allocate_buffer

     subroutine add_buffer(this, dta, number_of_bytes, initialize)
        class(ring_buffer), intent(inout) :: this
        class(data_storage), intent(inout) :: dta
        integer(int64), intent(in) :: number_of_bytes
        logical, intent(in), optional :: initialize

        integer(int64) :: offset

        if ( .not. same_type_as(this%internal_buffer, dta) ) &
                error stop "ring_buffer:add_buffer:Not the same type."

        call this%counter%increase(number_of_bytes)
        offset = max(int(0, int64), this%counter%get_next_index() - 1 - number_of_bytes)
        call dta%set_data_pointer(this%internal_buffer%get_pointer_offset(offset), number_of_bytes)

        if ( present(initialize) ) then
            if ( initialize ) call this%builder%initialize(dta)
        end if
    end subroutine add_buffer

    subroutine del_buffer(this, number_of_bytes)
        class(ring_buffer), intent(inout) :: this
        integer(int64), intent(in) :: number_of_bytes

        call this%counter%decrease(number_of_bytes)
    end subroutine del_buffer

    integer(int64) function get_available_size(this)
        class(ring_buffer), intent(in) :: this

        get_available_size = this%counter%get_available_size()
    end function  get_available_size

    subroutine reset(this)
        class(ring_buffer), intent(inout) :: this

        call this%counter%reset()
    end subroutine reset

    subroutine cleanup(this)
        class(ring_buffer), intent(inout) :: this

        if ( allocated(this%internal_buffer) ) then
            call this%internal_buffer%deallocate_data()
            deallocate(this%internal_buffer)
        end if
        call this%counter%cleanup()

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(ring_buffer), intent(inout) :: this

        this%counter = contiguous_ring_array_descriptor()
    end subroutine clear
end module ring_buffer_module
