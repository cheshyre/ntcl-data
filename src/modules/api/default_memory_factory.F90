module default_memory_factory_module
    use :: string_module, only : string
    use :: abstract_memory_factory_module, only : abstract_memory_factory
    use :: memory_api, only : &
            data_builder, &
            data_manager

    use :: host_builder_module, only : host_builder
    use :: host_data_manager_module, only : host_data_manager

#ifdef use_cuda
    use :: cuda_builder_module, only : cuda_builder
    use :: cuda_pinned_builder_module, only : cuda_pinned_builder
    use :: host_cuda_manager_module, only : host_cuda_manager
#endif

#ifdef USE_HIP
    use :: hip_builder_module, only : hip_builder
    use :: hip_pinned_builder_module, only : hip_pinned_builder
    use :: host_hip_manager_module, only : host_hip_manager
#endif

    implicit none
    private

    public :: default_memory_factory

    type, extends(abstract_memory_factory) :: default_memory_factory
    contains
        procedure :: create_data_builder_from_string => create_data_builder
        procedure :: allocate_data_manager => allocate_data_manager
        procedure :: get_available_memory_types => get_available_memory_types

        procedure, nopass, private :: count_available_memory_types => count_available_memory_types
        procedure :: cleanup => cleanup
    end type default_memory_factory
contains
    subroutine create_data_builder(this, builder, key)
        class(default_memory_factory), intent(in) :: this
        class(data_builder), allocatable, intent(inout) :: builder
        type(string), intent(in) :: key

        select case (key%char_array)
        case ("host")
            allocate(host_builder::builder)
#ifdef use_cuda
        case ("device")
            allocate(cuda_builder::builder)
        case ("pinned")
            allocate(cuda_pinned_builder::builder)
#endif

#ifdef USE_HIP
        case ("device")
            allocate(hip_builder::builder)
        case ("pinned")
            allocate(hip_pinned_builder::builder)
#endif
        case default
            error stop 'default_memory_factory::build:default case selected, undefined behavior'
        end select
    end subroutine create_data_builder

    integer function count_available_memory_types()

        count_available_memory_types = 1

#ifdef use_cuda
        count_available_memory_types = count_available_memory_types + 2
#endif

#ifdef USE_HIP
        count_available_memory_types = count_available_memory_types + 2
#endif
    end function count_available_memory_types

    function get_available_memory_types(this) result(types)
        class(default_memory_factory), intent(in) :: this
        type(string), dimension(:), allocatable :: types

        integer :: counter

        allocate(types(this%count_available_memory_types()))

        counter = 1
        types(counter) = "host"

#ifdef use_cuda
        counter = counter + 1
        types(counter) = "device"
        counter = counter + 1
        types(counter) = "pinned"
#endif

#ifdef USE_HIP
        counter = counter + 1
        types(counter) = "device"
        counter = counter + 1
        types(counter) = "pinned"
#endif
    end function get_available_memory_types

    subroutine allocate_data_manager(this, manager)
        class(default_memory_factory), intent(in) :: this
        class(data_manager), allocatable, intent(inout) :: manager

        if ( allocated(manager)) deallocate(manager)

#if defined use_cuda
        allocate(host_cuda_manager::manager)
#elif defined USE_HIP
        allocate(host_hip_manager::manager)
#else
        allocate(host_data_manager::manager)
#endif
    end subroutine allocate_data_manager

    subroutine cleanup(this)
        class(default_memory_factory), intent(inout) :: this

    end subroutine cleanup
end module default_memory_factory_module
