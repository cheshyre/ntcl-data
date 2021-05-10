module host_builder_test_module
    use, intrinsic :: iso_fortran_env, only : real64, int64

    use :: util_api, only : assert
    use :: host_builder_module, only : host_builder

    use :: data_storage_module, only : data_storage
    use :: host_storage_module, only : host_storage
    use :: intrinsic_pointer_builder_module, only : intrinsic_pointer_builder

    implicit none
    private

    public :: host_builder_test

    type :: host_builder_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type host_builder_test

    interface host_builder_test
        module procedure constructor
    end interface host_builder_test
contains
    function constructor() result(this)
        type(host_builder_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(host_builder_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(host_builder) :: ahost_builder
        real(real64), dimension(:), contiguous, pointer :: vector_pointer
        class(data_storage), allocatable :: storage
        type(intrinsic_pointer_builder) :: factory

        call assertion%equal("host_builder::Test complete", .true.)

        ahost_builder = host_builder()

        call ahost_builder%construct_storage(storage, int(800, int64))
        call assertion%equal("host_builder::After create real64 matrix, correct class", &
                same_type_as(storage, host_storage()))
        call assertion%equal("host_builder::After create real64 matrix, is_allocated", &
                storage%is_allocated)
        call assertion%equal("host_builder::After create real64 matrix, correct number of bytes", &
                800 == storage%number_of_bytes)

        select type (s => storage)
        type is (host_storage)
            call factory%secure_pointer(s, vector_pointer, 100)
        end select
        call assertion%equal("host_builder::After create real64 matrix, correct elements", &
                all(abs(0.0d0-vector_pointer) < 1d-15))
        call random_number(vector_pointer)
        call storage%deallocate_data()
        deallocate(storage)

    end subroutine run

    subroutine cleanup(this)
        class(host_builder_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(host_builder_test), intent(inout) :: this
    end subroutine clear
end module host_builder_test_module
