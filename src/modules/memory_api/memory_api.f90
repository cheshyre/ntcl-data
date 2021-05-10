module memory_api
    use :: data_storage_module, only : data_storage
    use :: data_manager_module, only : data_manager
    use :: data_builder_module, only : data_builder
    use :: data_storage_wrapper_module, only : data_storage_wrapper
    use :: abstract_memory_factory_module, only : abstract_memory_factory

    implicit none
    private

    public :: data_storage
    public :: data_manager
    public :: data_builder
    public :: data_storage_wrapper
    public :: abstract_memory_factory
    public :: memory_factory
    public :: memory_manager

    public :: memory_initialize
    public :: memory_finalize

    class(abstract_memory_factory), allocatable :: memory_factory
    class(data_manager), allocatable :: memory_manager
contains
    subroutine memory_initialize(factory)
        class(abstract_memory_factory), intent(in) :: factory

        if ( .not. allocated(memory_factory) ) then
            memory_factory = factory
            call memory_factory%allocate_data_manager(memory_manager)
        else
            error stop "memory_initialize:Already initialized."
        end if
    end subroutine memory_initialize

    subroutine memory_finalize()
        if ( allocated(memory_factory) ) then
            call memory_factory%cleanup()
            deallocate(memory_factory)
        end if

        if ( allocated(memory_manager) ) deallocate(memory_manager)
    end subroutine memory_finalize
end module memory_api
