module host_storage_module
    use, intrinsic :: iso_fortran_env, only : int64
    use, intrinsic :: iso_c_binding, only : c_ptr, c_loc, c_null_ptr, c_f_pointer
    use :: data_storage_module, only : data_storage
    implicit none
    private

    public :: host_storage

    type, extends(data_storage) :: host_storage
    contains
        procedure :: allocate_data => allocate_data
        procedure :: deallocate_data => deallocate_data
        procedure :: clear => clear
    end type host_storage

    interface host_storage
        module procedure constructor_empty
        module procedure constructor
        module procedure constructor_ptr
    end interface host_storage

contains
    function constructor_empty() result(this)
        type(host_storage) :: this

        call this%clear()
    end function constructor_empty

    function constructor(number_of_bytes) result(this)
        integer(int64), intent(in) :: number_of_bytes
        type(host_storage) :: this

        this = host_storage()
        call this%allocate_data(number_of_bytes)
    end function constructor

    function constructor_ptr(ptr, number_of_bytes) result(this)
        type(c_ptr), intent(in) :: ptr
        integer(int64), intent(in) :: number_of_bytes
        type(host_storage) :: this

        this = host_storage()
        call this%set_data_pointer(ptr, number_of_bytes)
    end function constructor_ptr

    subroutine allocate_data(this, number_of_bytes)
        class(host_storage), intent(inout) :: this
        integer(int64), intent(in) :: number_of_bytes

        character(len=1), dimension(:), pointer :: ptr

        allocate(ptr(number_of_bytes))
        call this%set_data_pointer(c_loc(ptr), number_of_bytes)
        ptr => null()
    end subroutine allocate_data

    subroutine deallocate_data(this)
        class(host_storage), intent(inout) :: this

        character(len=1), dimension(:), pointer :: ptr

        if (this%is_allocated) then
            call c_f_pointer(this%actual_data, ptr, shape=[this%number_of_bytes])
            deallocate(ptr)
        end if
        call this%clear()
    end subroutine deallocate_data

    subroutine clear(this)
        class(host_storage), intent(inout) :: this

        this%number_of_bytes = 0
        this%is_allocated = .false.
        this%actual_data = c_null_ptr
    end subroutine clear
end module host_storage_module
