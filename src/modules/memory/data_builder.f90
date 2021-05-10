module data_builder_module
    use, intrinsic :: iso_c_binding, only : c_ptr
    use, intrinsic :: iso_fortran_env, only : int64

    use :: data_storage_module, only : data_storage

    implicit none
    private

    public :: data_builder

    type, abstract :: data_builder
    contains
        generic :: initialize => &
                initialize_zero
        generic :: construct_storage => &
                construct_storage_from_size

        procedure(allocate_interface), deferred :: allocate_class
        procedure(initialize_interface), deferred :: initialize_zero
        procedure :: allocate_local_storage => allocate_local_storage
        procedure :: construct_storage_from_size => construct_storage_from_size
        procedure :: get_local_storage => get_local_storage
    end type data_builder

    abstract interface
        subroutine allocate_interface(this, dst)
            import :: data_builder
            import :: data_storage
            class(data_builder), intent(in) :: this
            class(data_storage), allocatable, intent(out) :: dst
        end subroutine allocate_interface

        subroutine initialize_interface(this, dst)
            import :: data_builder
            import :: data_storage
            class(data_builder), intent(in) :: this
            class(data_storage), intent(inout) :: dst
        end subroutine initialize_interface
    end interface

    logical, parameter :: default_initialization = .true.
contains
    function get_local_storage(this, number_of_bytes) result(dst)
        class(data_builder), intent(in) :: this
        integer(int64), intent(in), optional :: number_of_bytes
        class(data_storage), allocatable :: dst

        call this%allocate_local_storage(dst, number_of_bytes)
    end function get_local_storage

    subroutine allocate_local_storage(this, dst, number_of_bytes)
        class(data_builder), intent(in) :: this
        class(data_storage), intent(out), allocatable :: dst
        integer(int64), intent(in), optional :: number_of_bytes

        call this%allocate_class(dst)
        if (present(number_of_bytes)) call dst%allocate_data(number_of_bytes)
    end subroutine allocate_local_storage

    subroutine construct_storage_from_size(this, dst, number_of_bytes, initialize)
        class(data_builder), intent(in) :: this
        class(data_storage), intent(out), allocatable :: dst
        integer(int64), intent(in) :: number_of_bytes
        logical, optional :: initialize

        logical :: init

        init = default_initialization
        if (present(initialize)) init = initialize

        call this%allocate_local_storage(dst, number_of_bytes)
        if (init) call this%initialize(dst)
    end subroutine construct_storage_from_size
end module data_builder_module
