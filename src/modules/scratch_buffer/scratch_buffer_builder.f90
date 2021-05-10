module scratch_buffer_builder_module
    use, intrinsic :: iso_fortran_env, only : int64

    use :: util_api, only : &
            string, &
            dictionary, &
            dictionary_converter, &
            add_prefix_to_priorities

    use :: memory_api, only : &
            data_builder, &
            memory_factory
    use :: concurrency_api, only : &
            concurrency_factory

    use :: scratch_buffer_module, only : scratch_buffer
    use :: ring_buffer_module, only : ring_buffer
    use :: slot_manager_module, only : slot_manager
    use :: checkpoint_manager_module, only : checkpoint_manager

    implicit none
    private

    public :: scratch_buffer_builder

    type :: scratch_buffer_builder
    contains
        procedure :: create => create
        procedure :: get => get
    end type scratch_buffer_builder

    character(len=*), parameter :: prefix = "scratch_buffer-"
    character(len=*), parameter :: size_key = "size"
    character(len=*), parameter :: checkpoint_key = "number_of_checkpoints"
    character(len=*), parameter :: slots_key = "number_of_slots"
    integer, parameter :: default_size = 10*1024*1024
    integer, parameter :: default_slots = 3
    integer, parameter :: default_checkpoints = 1
    character(len=*), parameter :: default_memory = "host"
contains
    function get(this, memory_type, options, priorities) result(scratch)
        class(scratch_buffer_builder), intent(in) :: this
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities
        type(scratch_buffer) :: scratch

        call this%create(scratch, memory_type, options, priorities)
    end function get

    subroutine create(this, scratch, memory_type, options, priorities)
        class(scratch_buffer_builder), intent(in) :: this
        type(scratch_buffer), intent(inout) :: scratch
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional:: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(string), dimension(:), allocatable :: local_priorities
        integer :: number_of_checkpoints, number_of_slots
        integer(int64) :: array_size
        class(data_builder), allocatable :: builder
        type(dictionary_converter) :: conv

        local_priorities = add_prefix_to_priorities(prefix, priorities)

        array_size = conv%to_int64(size_key, options, local_priorities, int(default_size, int64))
        number_of_checkpoints = conv%to_int(checkpoint_key, options, local_priorities, default_checkpoints)
        number_of_slots = conv%to_int(slots_key, options, local_priorities, default_slots)

        call memory_factory%create_default_data_builder(builder, memory_type, options, local_priorities)

        scratch = scratch_buffer( &
                ring_buffer(builder%get_local_storage(), array_size), &
                checkpoint_manager( &
                        concurrency_factory%get_default_dependency_manager( &
                                memory_type, options, local_priorities), &
                        number_of_checkpoints), &
                slot_manager(number_of_slots) )
        scratch%buffer%builder = builder
    end subroutine create
end module scratch_buffer_builder_module
