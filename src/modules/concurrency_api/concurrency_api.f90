module concurrency_api
    use :: event_module, only : event
    use :: event_handler_module, only : event_handler
    use :: stream_module, only : stream
    use :: stream_handler_module, only : stream_handler
    use :: dependency_manager_module, only : dependency_manager
    use :: abstract_concurrency_factory_module, only : abstract_concurrency_factory

    implicit none
    private

    public :: event
    public :: event_handler
    public :: stream
    public :: stream_handler
    public :: dependency_manager
    public :: abstract_concurrency_factory
    public :: concurrency_factory

    public :: concurrency_initialize
    public :: concurrency_finalize

    class(abstract_concurrency_factory), allocatable :: concurrency_factory
contains
    subroutine concurrency_initialize(factory)
        class(abstract_concurrency_factory), intent(in) :: factory

        concurrency_factory = factory
    end subroutine concurrency_initialize

    subroutine concurrency_finalize()

        if ( allocated(concurrency_factory) ) then
            call concurrency_factory%cleanup()
            deallocate(concurrency_factory)
        end if
    end subroutine concurrency_finalize
end module concurrency_api
