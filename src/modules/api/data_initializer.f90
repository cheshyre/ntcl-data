module data_initializer
    use :: data_dev, only : &
            memory_initialize, &
            memory_finalize, &
            concurrency_initialize, &
            concurrency_finalize, &
            default_memory_factory, &
            default_concurrency_factory

    implicit none
    private

    public :: data_initialize
    public :: data_finalize
contains
    subroutine data_initialize()
        call memory_initialize(default_memory_factory())
        call concurrency_initialize(default_concurrency_factory())
    end subroutine data_initialize

    subroutine data_finalize()
        call memory_finalize()
        call concurrency_finalize()
    end subroutine data_finalize
end module data_initializer
