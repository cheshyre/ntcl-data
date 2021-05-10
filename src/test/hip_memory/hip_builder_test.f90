module hip_builder_test_module
    use, intrinsic :: iso_fortran_env, only : real64, int64

    use :: util_api, only : assert
    use :: hip_builder_module, only : hip_builder

    use :: host_hip_manager_module, only : host_hip_manager
    use :: data_storage_module, only : data_storage
    use :: hip_storage_module, only : hip_storage
    use :: host_storage_module, only : host_storage
    use :: intrinsic_pointer_builder_module, only : intrinsic_pointer_builder

    implicit none
    private

    public :: hip_builder_test

    type :: hip_builder_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type hip_builder_test

    interface hip_builder_test
        module procedure constructor
    end interface hip_builder_test
contains
    function constructor() result(this)
        type(hip_builder_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(hip_builder_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(hip_builder) :: ahip_builder
        real(real64), dimension(:), allocatable :: vector
        real(real64), dimension(:), contiguous, pointer :: vector_pointer
        class(data_storage), allocatable :: storage
        type(intrinsic_pointer_builder) :: factory
        type(host_hip_manager) :: manager
        type(host_storage) :: local

        call assertion%equal("hip_builder::Test complete", .true.)

        ahip_builder = hip_builder(manager)

        allocate(vector(100))
        call random_number(vector)

        call ahip_builder%construct_storage(storage, factory%get_data_storage(vector))
        call assertion%equal("hip_builder::After copy real64 vector, correct class", &
                same_type_as(storage, hip_storage()))
        call assertion%equal("hip_builder::After copy real64 vector, is_allocated", &
                storage%is_allocated)
        call assertion%equal("hip_builder::After copy real64 vector, correct number of bytes", &
                800 == storage%number_of_bytes)

        call manager%secure_local_storage(storage, local)
        call factory%secure_pointer(local, vector_pointer, 100)

        call assertion%equal("hip_builder::After copy real64 vector, correct elements", &
                all(abs(vector - vector_pointer) < 1d-15))
        call random_number(vector_pointer)
        call assertion%equal("hip_builder::After copy real64 vector, pointer is a copy", &
                all(abs(vector - vector_pointer) > 1d-15))
        vector_pointer => null()
        call manager%release_local_storage(storage, local)
        call storage%deallocate_data()
        deallocate(storage)

        call ahip_builder%construct_storage_pointer(storage, factory%get_data_storage(vector))
        call assertion%equal("hip_builder::After pointer to real64 vector, correct class", &
                same_type_as(storage, hip_storage()))
        call assertion%equal("hip_builder::After pointer to real64 vector, is_allocated", &
                storage%is_allocated)
        call assertion%equal("hip_builder::After pointer to real64 vector, correct number of bytes", &
                800 == storage%number_of_bytes)

        call manager%secure_local_storage(storage, local)
        call factory%secure_pointer(local, vector_pointer, 100)

        call assertion%equal("hip_builder::After pointer real64 vector, correct elements", &
                all(abs(vector - vector_pointer) < 1d-15))
        call random_number(vector_pointer)
        call assertion%equal("hip_builder::After pointer real64 vector, pointer is a copy", &
                all(abs(vector - vector_pointer) > 1d-15))
        vector_pointer => null()
        call manager%release_local_storage(storage, local)
        call storage%deallocate_data()
        deallocate(storage)
        deallocate(vector)

        call ahip_builder%construct_storage(storage, int(800, int64))
        call assertion%equal("hip_builder::After create real64 matrix, correct class", &
                same_type_as(storage, hip_storage()))
        call assertion%equal("hip_builder::After create real64 matrix, is_allocated", &
                storage%is_allocated)
        call assertion%equal("hip_builder::After create real64 matrix, correct number of bytes", &
                800 == storage%number_of_bytes)

        call manager%secure_local_storage(storage, local)
        call factory%secure_pointer(local, vector_pointer, 100)

        call assertion%equal("hip_builder::After create real64 matrix, correct elements", &
                all(abs(0.0d0-vector_pointer) < 1d-15))
        call manager%release_local_storage(storage, local)
        call storage%deallocate_data()
        deallocate(storage)

    end subroutine run

    subroutine cleanup(this)
        class(hip_builder_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(hip_builder_test), intent(inout) :: this
    end subroutine clear
end module hip_builder_test_module
