module dependency_manager_module
    use, intrinsic :: iso_fortran_env, only : error_unit

    use :: event_module, only : event
    use :: event_handler_module, only : event_handler
    use :: stream_module, only : stream
    use :: stream_handler_module, only : stream_handler

    implicit none
    private

    public :: dependency_manager
    public :: event
    public :: stream

    type, abstract :: dependency_manager
        type(event), dimension(:), allocatable :: events
        class(event_handler), allocatable :: ehandler

        type(stream), dimension(:), allocatable :: streams
        class(stream_handler), allocatable :: shandler
        integer :: current_stream, current_event, max_events, max_streams
    contains
        procedure :: get_event => get_event
        procedure :: get_new_event => get_new_event
        procedure :: get_stream => get_stream
        procedure :: get_new_stream => get_new_stream
        procedure(create_dependency_interface), deferred :: create_dependency
        procedure(depends_on_interface), deferred :: depends_on_single
        procedure(register_dependency_interface), deferred :: register_dependency
        procedure(synchronize_all_interface), deferred :: synchronize_all
        procedure(synchronize_on_event_interface), deferred :: synchronize_on_event
        procedure(completed_dependency_interface), deferred :: has_dependency_completed
        procedure :: register_dependency_in_all_streams => register_dependency_in_all_streams
        procedure :: is_initialized => is_initialized
        procedure :: initialize_events => initialize_events
        procedure :: initialize_streams => initialize_streams
        procedure :: setup => setup
        generic :: synchronize => &
                synchronize_on_event, &
                synchronize_on_multiple_events, &
                synchronize_all
        generic :: depends_on => &
                depends_on_single, &
                depends_on_multiple
        procedure :: depends_on_multiple => depends_on_multiple
        procedure :: all_streams_depend_on => all_streams_depend_on
        procedure :: synchronize_on_multiple_events => synchronize_on_multiple_events
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type dependency_manager

    abstract interface
        type(event) function create_dependency_interface(this, s)
            import :: dependency_manager
            import :: event
            import :: stream
            class(dependency_manager), intent(inout) :: this
            type(stream), intent(in) :: s
        end function create_dependency_interface

        subroutine depends_on_interface(this, s, e)
            import :: dependency_manager
            import :: event
            import :: stream
            class(dependency_manager), intent(inout) :: this
            type(stream), intent(in) :: s
            type(event), intent(in) :: e
        end subroutine depends_on_interface

        subroutine register_dependency_interface(this, e, s)
            import :: dependency_manager
            import :: event
            import :: stream
            class(dependency_manager), intent(in) :: this
            type(event), intent(inout) :: e
            type(stream), intent(in), optional :: s
        end subroutine register_dependency_interface

        subroutine synchronize_all_interface(this)
            import :: dependency_manager
            class(dependency_manager), intent(in) :: this
        end subroutine synchronize_all_interface

        subroutine synchronize_on_event_interface(this, e)
            import :: dependency_manager
            import :: event
            class(dependency_manager), intent(in) :: this
            type(event), intent(in) :: e
        end subroutine synchronize_on_event_interface

        logical function completed_dependency_interface(this, e)
            import :: dependency_manager
            import :: event

            class(dependency_manager), intent(in) :: this
            type(event), intent(in) :: e
        end function completed_dependency_interface
    end interface
contains
    logical function is_initialized(this)
        class(dependency_manager), intent(in) :: this

        is_initialized = allocated(this%events) .and. allocated(this%streams)
        if ( is_initialized ) &
                is_initialized = this%max_events == size(this%events) .and. &
                this%max_streams ==size(this%streams)
    end function is_initialized

    type(event) function get_event(this)
        class(dependency_manager), intent(inout) :: this

        if ( this%is_initialized() ) then
            this%current_event = mod(this%current_event, this%max_events) + 1
            get_event = this%events(this%current_event)
        else
            get_event = event()
        end if
    end function get_event

    type(event) function get_new_event(this)
        class(dependency_manager), intent(inout) :: this

        call this%ehandler%create(get_new_event)
    end function get_new_event

    type(stream) function get_stream(this)
        class(dependency_manager), intent(inout) :: this

        if ( this%is_initialized() ) then
            this%current_stream = mod(this%current_stream, this%max_streams) + 1
            get_stream = this%streams(this%current_stream)
        else
            get_stream = stream()
        end if
    end function get_stream

    type(stream) function get_new_stream(this)
        class(dependency_manager), intent(inout) :: this

        call this%shandler%create(get_new_stream)
    end function get_new_stream

    subroutine register_dependency_in_all_streams(this, events)
        class(dependency_manager), intent(in) :: this
        type(event), dimension(:), intent(inout) :: events

        integer :: idx

        if ( size(events) /= size(this%streams)) then
            write(error_unit, *) "dependency_manager::register_dependency_in_all_streams:"//&
                    "Wrong number of events."
            stop
        end if

        do idx = 1, size(this%streams)
            call this%register_dependency(events(idx), this%streams(idx))
        end do
    end subroutine register_dependency_in_all_streams

    subroutine synchronize_on_multiple_events(this, events)
        class(dependency_manager), intent(in) :: this
        type(event), dimension(:), intent(in) :: events

        integer :: idx

        do idx = 1, size(events)
            call this%synchronize(events(idx))
        end do
    end subroutine synchronize_on_multiple_events

    subroutine all_streams_depend_on(this, e)
        class(dependency_manager), intent(inout) :: this
        type(event), intent(in) :: e

        integer :: idx

        do idx = 1, size(this%streams)
            call this%depends_on(this%streams(idx), e)
        end do
    end subroutine all_streams_depend_on

    subroutine depends_on_multiple(this, s, events)
        class(dependency_manager), intent(inout) :: this
        type(stream), intent(in) :: s
        type(event), dimension(:), intent(in) :: events

        integer :: idx

        do idx = 1, size(events)
            call this%depends_on(s, events(idx))
        end do
    end subroutine depends_on_multiple

    subroutine initialize_streams(this, number_of_streams)
        class(dependency_manager), intent(inout) :: this
        integer, intent(in) :: number_of_streams

        integer :: idx

        this%max_streams = number_of_streams
        if ( allocated(this%shandler) .and. this%max_streams > 0 ) then
            allocate(this%streams(this%max_streams))
            do idx = 1, this%max_streams
                this%streams(idx) = this%get_new_stream()
            end do
        end if
    end subroutine initialize_streams

    subroutine initialize_events(this, number_of_events)
        class(dependency_manager), intent(inout) :: this
        integer, intent(in) :: number_of_events

        integer :: idx

        this%max_events = number_of_events
        if ( allocated(this%ehandler) .and. this%max_events > 0 ) then
            allocate(this%events(this%max_events))
            do idx = 1, this%max_events
                this%events(idx) = this%get_new_event()
            end do
        end if
    end subroutine initialize_events

    subroutine setup(this, max_events, max_streams)
        class(dependency_manager), intent(inout) :: this
        integer, intent(in) :: max_events, max_streams

        call this%initialize_events(max_events)
        call this%initialize_streams(max_streams)
    end subroutine setup

    subroutine cleanup(this)
        class(dependency_manager), intent(inout) :: this

        integer :: idx

        if (allocated(this%events)) then
            if ( allocated(this%ehandler)) then
                do idx = 1, size(this%events)
                    call this%ehandler%destroy(this%events(idx))
                end do
                deallocate(this%ehandler)
            end if
            deallocate(this%events)
        end if

        if (allocated(this%streams)) then
            if ( allocated(this%shandler)) then
                do idx = 1, size(this%streams)
                    call this%shandler%destroy(this%streams(idx))
                end do
                deallocate(this%shandler)
            end if
            deallocate(this%streams)
        end if
        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(dependency_manager), intent(inout) :: this

        this%current_event = 0
        this%current_stream = 0
        this%max_events = 0
        this%max_streams = 0
    end subroutine clear
end module dependency_manager_module
