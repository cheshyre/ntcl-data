module storage_builder_interface_test_module
    use, intrinsic :: iso_fortran_env, only : int64, real64

    use :: util_api, only : &
            assert, &
            string, &
            dictionary

    use :: data_api, only : &
            data_builder, &
            allocate_and_create_storage, &
            allocate_and_create_storage_in_scratch, &
            create_storage_in_scratch, &
            create_storage, &
            data_storage, &
            memory_factory, &
            scratch_buffer,&
            get_scratch_buffer

    use :: storage_builder_test_helper_module, only : &
            storage_builder_test_helper

    implicit none
    private

    public :: storage_builder_interface_test

    type :: storage_builder_interface_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type storage_builder_interface_test

    interface storage_builder_interface_test
        module procedure constructor
    end interface storage_builder_interface_test
contains
    function constructor() result(this)
        type(storage_builder_interface_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(storage_builder_interface_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(storage_builder_test_helper) :: helper
        type(string), dimension(:), allocatable :: memory_types
        type(string) :: text
        integer :: idx
        type(dictionary) :: options
        type(string), dimension(1) :: priorities

        call assertion%equal("storage_builder_interface::Test complete", .true.)

        call run_storage_tests(assertion, "storage_builder_interface::")
        call helper%run_interface_tests(assertion, "storage_builder_interface::")

        memory_types = memory_factory%get_available_memory_types()
        do idx = 1, size(memory_types)
            text = "storage_builder_interface::memory_type="//memory_types(idx)%char_array//":"
            call run_storage_tests(assertion, text%char_array, memory_type=memory_types(idx)%char_array)
            call helper%run_interface_tests(assertion, text%char_array, memory_type=memory_types(idx)%char_array)
        end do

        options = dictionary()
        do idx = 1, size(memory_types)
            call options%set_value("memory_type", memory_types(idx)%char_array)
            text = "storage_builder_interface::options(memory_type)="//memory_types(idx)%char_array//":"
            call run_storage_tests(assertion, text%char_array, options=options)
            call helper%run_interface_tests(assertion, text%char_array, options=options)
        end do

        priorities(1) = "unittest-"
        do idx = 1, size(memory_types)
            call options%set_value("memory_type", "dummy")
            call options%set_value("unittest-memory_type", memory_types(idx)%char_array)
            text = "storage_builder_interface::options(unittest-memory_type)="//memory_types(idx)%char_array//":"
            call run_storage_tests(assertion, text%char_array, options=options, priorities=priorities)
            call helper%run_interface_tests(assertion, text%char_array, options=options, priorities=priorities)
        end do

    end subroutine run

    subroutine run_storage_tests(assertion, prefix, memory_type, options, priorities)
        type(assert), intent(inout) :: assertion
        character(len=*), intent(in) :: prefix
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        integer(int64) :: number_of_bytes
        class(data_storage), allocatable :: storage, dummy
        type(scratch_buffer) :: scratch
        type(storage_builder_test_helper) :: helper
        type(string) :: text

        number_of_bytes = 100
        call memory_factory%create_data_storage(dummy, number_of_bytes, memory_type, options, priorities)

        text = prefix//"allocate_and_create"
        call allocate_and_create_storage(storage, number_of_bytes, memory_type, options, priorities)
        call helper%check_storage_equivalence(assertion, text%char_array, storage, dummy)
        call helper%check_data_equivalence(assertion, text%char_array, storage, dummy)
        call storage%deallocate_data()

        text = prefix//"create"
        call create_storage(storage, number_of_bytes, memory_type, options, priorities)
        call helper%check_storage_equivalence(assertion, text%char_array, storage, dummy)
        call helper%check_data_equivalence(assertion, text%char_array, storage, dummy)
        call storage%deallocate_data()
        deallocate(storage)

        scratch = get_scratch_buffer(memory_type, options, priorities)
        call scratch%initialize()

        text = prefix//"allocate_and_create_in_scratch"
        call allocate_and_create_storage_in_scratch(storage, scratch, number_of_bytes)
        call helper%check_storage_equivalence(assertion, text%char_array, storage, dummy)
        call helper%check_scratch_data(assertion, text%char_array, storage, scratch)
        call scratch%destroy(storage)
        call scratch%checkpoint()

        text = prefix//"create_in_scratch"
        call create_storage_in_scratch(storage, scratch, number_of_bytes)
        call helper%check_storage_equivalence(assertion, text%char_array, storage, dummy)
        call helper%check_scratch_data(assertion, text%char_array, storage, scratch)
        call scratch%destroy(storage)
        call scratch%checkpoint()

        call scratch%cleanup()
        call dummy%deallocate_data()
        deallocate(storage, dummy)
    end subroutine run_storage_tests

    subroutine cleanup(this)
        class(storage_builder_interface_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(storage_builder_interface_test), intent(inout) :: this
    end subroutine clear
end module storage_builder_interface_test_module
