module scratch_buffer_test_module
    use, intrinsic :: iso_fortran_env, only : int64

    use :: util_api, only : &
            assert, &
            string, &
            dictionary

    use :: data_api, only : &
            data_storage, &
            data_storage_wrapper, &
            scratch_buffer, &
            create_scratch_buffer, &
            memory_factory

    use :: data_dev, only : &
            host_storage

    implicit none
    private

    public :: scratch_buffer_test

    type :: scratch_buffer_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type scratch_buffer_test

    interface scratch_buffer_test
        module procedure constructor
    end interface scratch_buffer_test
contains
    function constructor() result(this)
        type(scratch_buffer_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(scratch_buffer_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(dictionary) :: options
        type(string), dimension(:), allocatable :: memory_types
        type(string), dimension(1) :: priorities
        integer :: idx
        type(string) :: text

        memory_types = memory_factory%get_available_memory_types()
        priorities(1) = string("unittest-")

        call assertion%equal("scratch_buffer::Test complete", .true.)

        call test_scratch_buffer(assertion, "scratch_buffer::default:")

        do idx = 1, size(memory_types)
            text = "scratch_buffer::memory_type="//memory_types(idx)%char_array//":"
            call test_scratch_buffer(assertion, text%char_array, memory_type=memory_types(idx)%char_array)
        end do

        options = dictionary()
        do idx = 1, size(memory_types)
            call options%set_value("memory_type", memory_types(idx)%char_array)
            text = "scratch_buffer::options(memory_type)="//memory_types(idx)%char_array//":"
            call test_scratch_buffer(assertion, text%char_array, options=options)
        end do

        priorities(1) = "unittest-"
        do idx = 1, size(memory_types)
            call options%set_value("memory_type", "dummy")
            call options%set_value("unittest-memory_type", memory_types(idx)%char_array)
            text = "scratch_buffer::options(unittest-memory_type)="//memory_types(idx)%char_array//":"
            call test_scratch_buffer(assertion, text%char_array, options=options, priorities=priorities)
        end do

    end subroutine run

    subroutine test_scratch_buffer(assertion, prefix, memory_type, options, priorities)
        type(assert), intent(inout) :: assertion
        character(len=*), intent(in) :: prefix
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(scratch_buffer) :: scratch
        class(data_storage), allocatable :: test_storage
        class(data_storage), allocatable :: dta1

        call memory_factory%create_data_storage(test_storage, memory_type, 100, options, priorities)

        call create_scratch_buffer(scratch, memory_type, options, priorities)
        call scratch%initialize()

        call scratch%allocate_storage_object(dta1)
        call assertion%equal(prefix//"allocate_storage_object:Allocated", &
                allocated(dta1))
        call assertion%equal(prefix//"allocate_storage_object:Correct datatype", &
                same_type_as(dta1, test_storage))

        call scratch%create(dta1, int(20, int64))
        call assertion%equal(prefix//"create:number_of_bytes", &
                20 == dta1%number_of_bytes)
        call scratch%destroy(dta1)
        call scratch%checkpoint()

        call scratch%create(dta1, int(20, int64))
        call assertion%equal(prefix//"create:number_of_bytes:second time", &
                20 == dta1%number_of_bytes)
        call scratch%destroy(dta1)
        call scratch%checkpoint()

        call run_through_buffer(scratch, 3, 200, 2000)

        call assertion%equal(prefix//"Run through buffer multiple times", .true.)

        deallocate(dta1)
        call scratch%cleanup()
    end subroutine test_scratch_buffer

    subroutine run_through_buffer(scratch, number_of_objects, number_of_times, data_size)
        type(scratch_buffer), intent(inout) :: scratch
        integer, intent(in) :: number_of_objects, number_of_times, data_size

        type(data_storage_wrapper), dimension(:), allocatable :: wrappers
        integer :: idx, t

        allocate(wrappers(number_of_objects))
        do idx = 1, number_of_objects
            call scratch%allocate_storage_object(wrappers(idx)%item)
        end do
        do t = 1, number_of_times
            do idx = 1, number_of_objects
                call scratch%create(wrappers(idx)%item, int(data_size, int64))
            end do

            do idx = number_of_objects, 1, -1
                call scratch%destroy(wrappers(idx)%item)
            end do
            call scratch%checkpoint()
        end do
        do idx = 1, number_of_objects
            deallocate(wrappers(idx)%item)
        end do
        deallocate(wrappers)
    end subroutine run_through_buffer

    subroutine cleanup(this)
        class(scratch_buffer_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(scratch_buffer_test), intent(inout) :: this
    end subroutine clear
end module scratch_buffer_test_module
