module default_concurrency_factory_module
    use :: util_api, only : &
            string, &
            dictionary, &
            string_converter, &
            add_prefix_to_priorities

    use :: concurrency_api, only : &
            abstract_concurrency_factory, &
            dependency_manager, &
            stream_handler, &
            event_handler, &
            stream, &
            event

    use :: abstract_concurrency_factory_module, only : abstract_concurrency_factory

    use :: host_concurrency_plugin, only : &
            dependency_manager_host, &
            stream_handler_host, &
            event_handler_host

#ifdef use_cuda
    use :: cuda_concurrency_plugin, only : &
            dependency_manager_cuda, &
            event_handler_cuda, &
            stream_handler_cuda
#endif

#ifdef USE_HIP
    use :: hip_concurrency_plugin, only : &
            dependency_manager_hip, &
            stream_handler_hip, &
            event_handler_hip
#endif

    implicit none
    private

    public :: default_concurrency_factory

    type, extends(abstract_concurrency_factory) :: default_concurrency_factory
    contains
        procedure :: create_dependency_manager => create_dependency_manager
        procedure :: create_stream_handler => create_stream_handler
        procedure :: create_event_handler => create_event_handler
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type default_concurrency_factory

    interface default_concurrency_factory
        module procedure constructor
    end interface default_concurrency_factory

    character(len=*), parameter :: prefix = "dependency_manager-"
    character(len=*), parameter :: concurrency_key = "concurrency"
    character(len=*), parameter :: streams_key = "number_of_streams"
    character(len=*), parameter :: events_key = "number_of_events"
    integer, parameter :: default_streams = 3
    integer, parameter :: default_events = 3
contains
    function constructor() result(this)
        type(default_concurrency_factory) :: this

        call this%clear()
    end function constructor

    subroutine create_stream_handler(this, handler, key)
        class(default_concurrency_factory), intent(in) :: this
        class(stream_handler), allocatable, intent(inout) :: handler
        type(string), intent(in) :: key

        select case (key%char_array)
        case ("host")
            handler = stream_handler_host()
#ifdef use_cuda
        case ("cuda")
            handler = stream_handler_cuda()
        case ("device")
            handler = stream_handler_cuda()
        case ("pinned")
            handler = stream_handler_cuda()
#elif USE_HIP
        case ("hip")
            handler = stream_handler_hip()
        case ("device")
            handler = stream_handler_hip()
        case ("pinned")
            handler = stream_handler_hip()
#endif
        case default
            error stop 'default_concurrency_factory::create_stream_handler:Unknown concurrency type.'
        end select
    end subroutine create_stream_handler

    subroutine create_event_handler(this, handler, key)
        class(default_concurrency_factory), intent(in) :: this
        class(event_handler), allocatable, intent(inout) :: handler
        type(string), intent(in) :: key

        select case (key%char_array)
        case ("host")
            handler = event_handler_host()
#ifdef use_cuda
        case ("cuda")
            handler = event_handler_cuda()
        case ("device")
            handler = event_handler_cuda()
        case ("pinned")
            handler = event_handler_cuda()
#elif USE_HIP
        case ("hip")
            handler = event_handler_hip()
        case ("device")
            handler = event_handler_hip()
        case ("pinned")
            handler = event_handler_hip()
#endif
        case default
            error stop 'default_concurrency_factory::create_event_handler:Unknown concurrency type.'
        end select
    end subroutine create_event_handler

    subroutine create_dependency_manager(this, manager, config, priorities)
        class(default_concurrency_factory), intent(in) :: this
        class(dependency_manager), allocatable, intent(inout) :: manager
        type(dictionary), intent(in) :: config
        type(string), dimension(:), intent(in), optional :: priorities

        type(string) :: manager_value
        type(string), dimension(:), allocatable :: my_priorities

        my_priorities = add_prefix_to_priorities(prefix, priorities)

        manager_value = config%get_value(concurrency_key, my_priorities)
        select case (manager_value%char_array)
        case ("host")
            manager = dependency_manager_host()
#ifdef use_cuda
        case ("cuda")
            manager = dependency_manager_cuda()
        case ("device")
            manager = dependency_manager_cuda()
        case ("pinned")
            manager = dependency_manager_cuda()
#elif USE_HIP
        case ("hip")
            manager = dependency_manager_hip()
        case ("device")
            manager = dependency_manager_hip()
        case ("pinned")
            manager = dependency_manager_hip()
#endif
        case default
            error stop 'default_concurrency_factory::default case selected, undefined behavior'
        end select

        call setup_dependency_manager(manager, config, my_priorities)
    end subroutine create_dependency_manager

    subroutine setup_dependency_manager(manager, config, priorities)
        class(dependency_manager), intent(inout) :: manager
        type(dictionary), intent(in) :: config
        type(string), dimension(:), intent(in) :: priorities

        type(string) :: dummy
        type(string_converter) :: converter
        integer :: number_of_streams, number_of_events

        number_of_streams = default_streams
        if ( config%has_key(streams_key, priorities) ) then
            dummy =  config%get_value(streams_key, priorities)
            number_of_streams = converter%toint(dummy)
        end if
        call manager%initialize_streams(number_of_streams)

        number_of_events = default_events
        if ( config%has_key(events_key, priorities) ) then
            dummy =  config%get_value(events_key, priorities)
            number_of_events = converter%toint(dummy)
        end if
        call manager%initialize_events(number_of_events)
    end subroutine setup_dependency_manager

    subroutine cleanup(this)
        class(default_concurrency_factory), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(default_concurrency_factory), intent(inout) :: this
    end subroutine clear
end module default_concurrency_factory_module
