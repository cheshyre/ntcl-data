module abstract_concurrency_factory_module
    use :: util_api, only : &
            string, &
            dictionary, &
            dictionary_converter

    use :: stream_module, only : stream
    use :: stream_handler_module, only : stream_handler
    use :: event_module, only : event
    use :: event_handler_module, only : event_handler
    use :: dependency_manager_module, only : dependency_manager

    implicit none
    private

    public :: abstract_concurrency_factory

    type, abstract :: abstract_concurrency_factory
    contains
        procedure :: get_dependency_manager => get_dependency_manager
        procedure :: get_default_dependency_manager => get_default_dependency_manager
        procedure :: create_default_dependency_manager => create_default_dependency_manager
        procedure :: get_stream => get_stream
        procedure :: create_stream => create_stream
        procedure :: get_event => get_event
        procedure :: create_event => create_event
        procedure :: get_default_stream_handler => get_default_stream_handler
        procedure :: create_default_stream_handler => create_default_stream_handler
        procedure :: get_default_event_handler => get_default_event_handler
        procedure :: create_default_event_handler => create_default_event_handler
        procedure(create_dependency_manager_interface), deferred :: create_dependency_manager
        procedure(create_stream_handler_interface), deferred :: create_stream_handler
        procedure(create_event_handler_interface), deferred :: create_event_handler
        procedure(empty), deferred :: cleanup
    end type abstract_concurrency_factory

    abstract interface
        subroutine empty(this)
            import :: abstract_concurrency_factory

            class(abstract_concurrency_factory), intent(inout) :: this
        end subroutine empty

        subroutine create_dependency_manager_interface(this, manager, config, priorities)
            import :: abstract_concurrency_factory
            import :: dependency_manager
            import :: dictionary
            import ::string

            class(abstract_concurrency_factory), intent(in) :: this
            class(dependency_manager), intent(inout), allocatable :: manager
            type(dictionary), intent(in) :: config
            type(string), dimension(:), intent(in), optional :: priorities
        end subroutine create_dependency_manager_interface

        subroutine create_stream_handler_interface(this, handler, key)
            import :: abstract_concurrency_factory
            import :: stream_handler
            import :: string

            class(abstract_concurrency_factory), intent(in) :: this
            class(stream_handler), allocatable, intent(inout) :: handler
            type(string), intent(in) :: key
        end subroutine create_stream_handler_interface

        subroutine create_event_handler_interface(this, handler, key)
            import :: abstract_concurrency_factory
            import :: event_handler
            import :: string

            class(abstract_concurrency_factory), intent(in) :: this
            class(event_handler), allocatable, intent(inout) :: handler
            type(string), intent(in) :: key
        end subroutine create_event_handler_interface
    end interface

    character(len=*), parameter :: default_concurrency_type = "host"
    character(len=*), parameter :: default_concurrency_key = "concurrency"
contains
    function get_dependency_manager(this, config, priorities) result(manager)
        class(abstract_concurrency_factory), intent(in) :: this
        type(dictionary), intent(in) :: config
        type(string), dimension(:), intent(in), optional :: priorities
        class(dependency_manager), allocatable :: manager

        call this%create_dependency_manager(manager, config, priorities)
    end function get_dependency_manager

    function get_default_dependency_manager(this, manager_type, options, priorities) result(manager)
        class(abstract_concurrency_factory), intent(in) :: this
        character(len=*), intent(in), optional :: manager_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities
        class(dependency_manager), allocatable :: manager

        call this%create_default_dependency_manager(manager, manager_type, options, priorities)
    end function get_default_dependency_manager

    function get_stream(this, stream_type, options, priorities) result(astream)
        class(abstract_concurrency_factory), intent(in) :: this
        character(len=*), intent(in), optional :: stream_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities
        type(stream) :: astream

        call this%create_stream(astream, stream_type, options, priorities)
    end function get_stream

    subroutine create_stream(this, astream, stream_type, options, priorities)
        class(abstract_concurrency_factory), intent(in) :: this
        type(stream), intent(inout) :: astream
        character(len=*), intent(in), optional :: stream_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        class(stream_handler), allocatable :: handler

        call this%create_default_stream_handler(handler, stream_type, options, priorities)
        call handler%create(astream)
        deallocate(handler)
    end subroutine create_stream

    function get_event(this, event_type, options, priorities) result(enevent)
        class(abstract_concurrency_factory), intent(in) :: this
        character(len=*), intent(in), optional :: event_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities
        type(event) :: enevent

        call this%create_event(enevent, event_type, options, priorities)
    end function get_event

    subroutine create_event(this, anevent, event_type, options, priorities)
        class(abstract_concurrency_factory), intent(in) :: this
        type(event), intent(inout) :: anevent
        character(len=*), intent(in), optional :: event_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        class(event_handler), allocatable :: handler

        call this%create_default_event_handler(handler, event_type, options, priorities)
        call handler%create(anevent)
        deallocate(handler)
    end subroutine create_event

    function get_default_stream_handler(this, stream_type, options, priorities) result(handler)
        class(abstract_concurrency_factory), intent(in) :: this
        character(len=*), intent(in), optional :: stream_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities
        class(stream_handler), allocatable :: handler

        call this%create_default_stream_handler(handler, stream_type, options, priorities)
    end function get_default_stream_handler

    subroutine create_default_stream_handler(this, handler, stream_type, options, priorities)
        class(abstract_concurrency_factory), intent(in) :: this
        class(stream_handler), allocatable, intent(inout) :: handler
        character(len=*), intent(in), optional :: stream_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(dictionary_converter) :: conv
        type(string) :: key

        if ( present(stream_type) ) then
            call this%create_stream_handler(handler, string(stream_type))
        else
            key = conv%to_string(default_concurrency_key, options, priorities, default_concurrency_type)
            call this%create_stream_handler(handler, key)
        end if
    end subroutine create_default_stream_handler

    function get_default_event_handler(this, event_type, options, priorities) result(handler)
        class(abstract_concurrency_factory), intent(in) :: this
        character(len=*), intent(in), optional :: event_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities
        class(event_handler), allocatable :: handler

        call this%create_default_event_handler(handler, event_type, options, priorities)
    end function get_default_event_handler

    subroutine create_default_event_handler(this, handler, event_type, options, priorities)
        class(abstract_concurrency_factory), intent(in) :: this
        class(event_handler), allocatable, intent(inout) :: handler
        character(len=*), intent(in), optional :: event_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(dictionary_converter) :: conv
        type(string) :: key

        if ( present(event_type) ) then
            call this%create_event_handler(handler, string(event_type))
        else
            key = conv%to_string(default_concurrency_key, options, priorities, default_concurrency_type)
            call this%create_event_handler(handler, key)
        end if
    end subroutine create_default_event_handler

    subroutine create_default_dependency_manager(this, manager, manager_type, options, priorities)
        class(abstract_concurrency_factory), intent(in) :: this
        class(dependency_manager), allocatable, intent(inout) :: manager
        character(len=*), intent(in), optional :: manager_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(dictionary) :: local_options
        type(string) :: key

        local_options = dictionary()
        if ( present(options) ) then
            local_options = options
        end if
        if ( .not. local_options%has_key(default_concurrency_key, priorities) ) &
                call local_options%set_value(default_concurrency_key, default_concurrency_type)

        if ( present(manager_type) ) then
            call local_options%set_value(default_concurrency_key, manager_type)
        end if
        call this%create_dependency_manager(manager, local_options, priorities)
    end subroutine create_default_dependency_manager
end module abstract_concurrency_factory_module
