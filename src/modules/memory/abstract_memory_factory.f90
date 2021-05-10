module abstract_memory_factory_module
    use, intrinsic :: iso_fortran_env, only : int64

    use :: util_api, only : &
            string, &
            string_converter, &
            dictionary, &
            dictionary_converter

    use :: data_storage_module, only : data_storage
    use :: data_builder_module, only : data_builder
    use :: data_manager_module, only : data_manager

    implicit none
    private

    public :: abstract_memory_factory

    type, abstract :: abstract_memory_factory
    contains
        generic :: get_data_builder => &
                get_data_builder_from_string, &
                get_data_builder_from_chars, &
                get_data_builder_from_options
        procedure :: get_data_builder_from_string => get_data_builder_from_string
        procedure :: get_data_builder_from_chars => get_data_builder_from_chars
        procedure :: get_data_builder_from_options => get_data_builder_from_options
        procedure :: get_default_data_builder => get_default_data_builder

        generic :: create_data_builder => &
                create_data_builder_from_string, &
                create_data_builder_from_chars, &
                create_data_builder_from_options
        procedure :: create_data_builder_from_chars => create_data_builder_from_chars
        procedure :: create_data_builder_from_options => create_data_builder_from_options
        procedure :: create_default_data_builder => create_default_data_builder
        procedure(create_data_builder_interface), deferred :: create_data_builder_from_string

        generic :: get_data_storage => &
                get_data_storage_int64, &
                get_data_storage_int32
        procedure :: get_data_storage_int64 => get_data_storage_int64
        procedure :: get_data_storage_int32 => get_data_storage_int32

        generic :: create_data_storage => &
                create_data_storage_int64, &
                create_data_storage_int32
        procedure :: create_data_storage_int64 => create_data_storage_int64
        procedure :: create_data_storage_int32 => create_data_storage_int32

        procedure(empty), deferred :: cleanup

        procedure(allocate_manager_interface), deferred :: allocate_data_manager
        procedure(get_memory_types_interface), deferred :: get_available_memory_types
    end type abstract_memory_factory

    abstract interface
        subroutine empty(this)
            import :: abstract_memory_factory

            class(abstract_memory_factory), intent(inout) :: this
        end subroutine empty

        subroutine create_data_builder_interface(this, builder, key)
            import :: abstract_memory_factory
            import :: data_builder
            import ::string

            class(abstract_memory_factory), intent(in) :: this
            class(data_builder), intent(inout), allocatable :: builder
            type(string), intent(in) :: key
        end subroutine create_data_builder_interface

        subroutine allocate_manager_interface(this, manager)
            import :: abstract_memory_factory
            import :: data_manager

            class(abstract_memory_factory), intent(in) :: this
            class(data_manager), allocatable, intent(inout) :: manager
        end subroutine allocate_manager_interface

        function get_memory_types_interface(this) result(types)
            import :: abstract_memory_factory
            import :: string

            class(abstract_memory_factory), intent(in) :: this
            type(string), dimension(:), allocatable :: types
        end function get_memory_types_interface
    end interface

    character(len=*), parameter :: memory_type_key = "memory_type"
    character(len=*), parameter :: initialize_key = "initialize"
    character(len=*), parameter :: default_memory_type = "host"
    character(len=*), parameter :: default_initialization = "yes"
contains
    function get_data_builder_from_string(this, key) result(builder)
        class(abstract_memory_factory), intent(in) :: this
        type(string), intent(in) :: key
        class(data_builder), allocatable :: builder

        call this%create_data_builder(builder, key)
    end function get_data_builder_from_string

    function get_data_builder_from_chars(this, key) result(builder)
        class(abstract_memory_factory), intent(in) :: this
        character(len=*), intent(in) :: key
        class(data_builder), allocatable :: builder

        call this%create_data_builder(builder, string(key))
    end function get_data_builder_from_chars

    function get_data_builder_from_options(this, options, priorities) result(builder)
        class(abstract_memory_factory), intent(in) :: this
        type(dictionary), intent(in) :: options
        type(string), dimension(:), intent(in), optional :: priorities
        class(data_builder), allocatable :: builder

        call this%create_data_builder(builder, options, priorities)
    end function get_data_builder_from_options

    function get_default_data_builder(this, memory_type, options, priorities) result(builder)
        class(abstract_memory_factory), intent(in) :: this
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities
        class(data_builder), allocatable :: builder

        call this%create_default_data_builder(builder, memory_type, options, priorities)
    end function get_default_data_builder

    subroutine create_data_builder_from_chars(this, builder, key)
        class(abstract_memory_factory), intent(in) :: this
        class(data_builder), allocatable, intent(inout) :: builder
        character(len=*), intent(in) :: key

        call this%create_data_builder(builder, string(key))
    end subroutine create_data_builder_from_chars

    subroutine create_data_builder_from_options(this, builder, options, priorities)
        class(abstract_memory_factory), intent(in) :: this
        class(data_builder), allocatable, intent(inout) :: builder
        type(dictionary), intent(in) :: options
        type(string), dimension(:), intent(in), optional :: priorities

        if ( options%has_key(memory_type_key, priorities) ) then
            call this%create_data_builder(builder, options%get_value(memory_type_key, priorities))
        else
            call this%create_data_builder(builder, default_memory_type)
        end if
    end subroutine create_data_builder_from_options

    subroutine create_default_data_builder(this, builder, memory_type, options, priorities)
        class(abstract_memory_factory), intent(in) :: this
        class(data_builder), allocatable, intent(inout) :: builder
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        if ( present(memory_type) ) then
            call this%create_data_builder(builder, memory_type)
            return
        end if

        if ( present(options) ) then
            call this%create_data_builder(builder, options, priorities)
        else
            call this%create_data_builder(builder, default_memory_type)
        end if
    end subroutine create_default_data_builder

    function get_data_storage_int64(this, number_of_bytes, memory_type, options, priorities) result(storage)
        class(abstract_memory_factory), intent(in) :: this
        integer(int64), intent(in) :: number_of_bytes
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities
        class(data_storage), allocatable :: storage

        call this%create_data_storage(storage, number_of_bytes, memory_type, options, priorities)
    end function get_data_storage_int64

    function get_data_storage_int32(this, number_of_bytes, memory_type, options, priorities) result(storage)
        class(abstract_memory_factory), intent(in) :: this
        integer, intent(in) :: number_of_bytes
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities
        class(data_storage), allocatable :: storage

        storage = this%get_data_storage(int(number_of_bytes, int64), memory_type, options, priorities)
    end function get_data_storage_int32

    subroutine create_data_storage_int32(this, storage, memory_type, number_of_bytes, options, priorities)
        class(abstract_memory_factory), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: storage
        integer, intent(in) :: number_of_bytes
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        call this%create_data_storage(storage, int(number_of_bytes, int64), memory_type, options, priorities)
    end subroutine create_data_storage_int32

    subroutine create_data_storage_int64(this, storage, number_of_bytes, memory_type, options, priorities)
        class(abstract_memory_factory), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: storage
        integer(int64), intent(in) :: number_of_bytes
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(string) :: initialize
        class(data_builder), allocatable :: builder
        type(string_converter) :: converter
        type(dictionary_converter) :: dconv

        call this%create_default_data_builder(builder, memory_type, options, priorities)
        call builder%allocate_local_storage(storage, number_of_bytes)

        initialize = dconv%to_string(initialize_key, options, priorities, default_initialization)
        if ( converter%to_logical(initialize) ) &
                call builder%initialize_zero(storage)
    end subroutine create_data_storage_int64
end module abstract_memory_factory_module
