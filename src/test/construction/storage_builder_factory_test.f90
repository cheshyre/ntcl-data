module storage_builder_factory_test_module
    use :: util_api, only : &
            assert, &
            string, &
            dictionary

    use :: data_api, only : &
            memory_factory, &
            data_builder

    use :: storage_construction_api, only : &
            get_storage_builder, &
            storage_builder

    implicit none
    private

    public :: storage_builder_factory_test

    type :: storage_builder_factory_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type storage_builder_factory_test

    interface storage_builder_factory_test
        module procedure constructor
    end interface storage_builder_factory_test
contains
    function constructor() result(this)
        type(storage_builder_factory_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(storage_builder_factory_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(storage_builder) :: builder
        class(data_builder), allocatable :: dummy ! Because of ice in gfortran
        type(string), dimension(:), allocatable :: memory_types
        integer :: idx
        type(dictionary) :: options
        type(string), dimension(1) :: priorities

        call assertion%equal("storage_builder_factory::Test complete", .true.)

        builder = get_storage_builder()
        dummy = memory_factory%get_default_data_builder()

        call assertion%equal("storage_builder_factory::Empty constructor:Allocated", &
                allocated(builder%builder))

        call assertion%equal("storage_builder_factory::Empty constructor:Correct builder", &
                same_type_as(dummy, builder%builder))

        call builder%cleanup()
        deallocate(dummy)

        memory_types = memory_factory%get_available_memory_types()
        do idx = 1, size(memory_types)
            builder = get_storage_builder(memory_type=memory_types(idx)%char_array)
            dummy = memory_factory%get_default_data_builder(memory_type=memory_types(idx)%char_array)

            call assertion%equal("storage_builder_factory::memory_type="//memory_types(idx)%char_array&
                    //":Allocated", allocated(builder%builder))

            call assertion%equal("storage_builder_factory::memory_type="//memory_types(idx)%char_array&
                    //":Correct builder", same_type_as(dummy, builder%builder))

            call builder%cleanup()
            deallocate(dummy)
        end do

        do idx = 1, size(memory_types)
            options = dictionary()
            call options%set_value(string("memory_type"), memory_types(idx))

            builder = get_storage_builder(options=options)
            dummy = memory_factory%get_default_data_builder(options=options)

            call assertion%equal("storage_builder_factory::options(memory_type)="//memory_types(idx)%char_array&
                    //":Allocated", allocated(builder%builder))

            call assertion%equal("storage_builder_factory::options(memory_type)="//memory_types(idx)%char_array&
                    //":Correct builder", same_type_as(dummy, builder%builder))

            call options%cleanup()
            call builder%cleanup()
            deallocate(dummy)
        end do

        priorities = [string("unittest-")]
        do idx = 1, size(memory_types)
            options = dictionary()
            call options%set_value(string("unittest-memory_type"), memory_types(idx))
            call options%set_value(string("memory_type"), string("none"))

            builder = get_storage_builder(options=options, priorities=priorities)
            dummy = memory_factory%get_default_data_builder(options=options, priorities=priorities)

            call assertion%equal("storage_builder_factory::options(unittest-memory_type)="//memory_types(idx)%char_array&
                    //":Allocated", allocated(builder%builder))

            call assertion%equal("storage_builder_factory::options(unittest-memory_type)="//memory_types(idx)%char_array&
                    //":Correct builder", same_type_as(dummy, builder%builder))

            call options%cleanup()
            call builder%cleanup()
            deallocate(dummy)
        end do
        call priorities(1)%cleanup()
    end subroutine run

    subroutine cleanup(this)
        class(storage_builder_factory_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(storage_builder_factory_test), intent(inout) :: this
    end subroutine clear
end module storage_builder_factory_test_module
