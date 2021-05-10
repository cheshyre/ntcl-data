module scratch_buffer_api
    use :: util_api, only : &
            string, &
            dictionary
    use :: scratch_buffer_module, only : scratch_buffer
    use :: scratch_buffer_builder_module, only : scratch_buffer_builder

    implicit none
    private

    public :: scratch_buffer
    public :: scratch_buffer_builder
    public :: create_scratch_buffer
    public :: get_scratch_buffer

contains
    type(scratch_buffer) function get_scratch_buffer(memory_type, options, priorities)
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(scratch_buffer_builder) :: builder

        get_scratch_buffer = builder%get(memory_type, options, priorities)
    end function get_scratch_buffer

    subroutine create_scratch_buffer(scratch, memory_type, options, priorities)
        type(scratch_buffer), intent(inout) :: scratch
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(scratch_buffer_builder) :: builder

        call builder%create(scratch, memory_type, options, priorities)
    end subroutine create_scratch_buffer
end module scratch_buffer_api
