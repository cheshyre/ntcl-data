module storage_builder_factory_module
    use :: util_api, only : &
        string, &
        dictionary

    use :: memory_api, only : memory_factory

    use :: storage_builder_module, only : storage_builder

    implicit none
    private

    public :: create_storage_builder
    public :: get_storage_builder

contains
    function get_storage_builder(memory_type, options, priorities) result(builder)
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities
        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
    end function get_storage_builder

    subroutine create_storage_builder(builder, memory_type, options, priorities)
        type(storage_builder), intent(inout) :: builder
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        builder = storage_builder(memory_factory%get_default_data_builder(memory_type, options, priorities))
    end subroutine create_storage_builder

end module storage_builder_factory_module
