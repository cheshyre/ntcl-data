module ring_buffer_test_module
    use, intrinsic :: iso_fortran_env, only : int64
    use, intrinsic :: iso_c_binding, only : c_f_pointer

    use :: util_api, only : assert
    use :: ring_buffer_module, only : ring_buffer
    use :: data_dev, only : host_storage

    implicit none
    private

    public :: ring_buffer_test

    type :: ring_buffer_test
    contains
        procedure :: run => run
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type ring_buffer_test

    interface ring_buffer_test
        module procedure constructor
    end interface ring_buffer_test
contains
    function constructor() result(this)
        type(ring_buffer_test) :: this

        call this%clear()
    end function constructor

    subroutine run(this, assertion)
        class(ring_buffer_test), intent(in) :: this
        type(assert), intent(inout) :: assertion

        type(ring_buffer) :: aring_buffer
        type(host_storage) :: dta
        integer, dimension(:), pointer, contiguous :: ptr

        call assertion%equal("ring_buffer::Test complete", .true.)

        dta = host_storage()

        aring_buffer = ring_buffer(dta, 20)
        call assertion%equal("ring_buffer::Constructor with host_storage and int32 size", &
                allocated(aring_buffer%internal_buffer) .and. &
                same_type_as(dta, aring_buffer%internal_buffer) .and. &
                aring_buffer%counter%total_size == 20)

        aring_buffer = ring_buffer(dta, int(20, int64))
        call assertion%equal("ring_buffer::Constructor with host_storage and int64 size", &
                allocated(aring_buffer%internal_buffer) .and. &
                same_type_as(dta, aring_buffer%internal_buffer) .and. &
                aring_buffer%counter%total_size == 20)

        call aring_buffer%cleanup()
        call assertion%equal("ring_buffer::Cleanup", &
                (.not. allocated(aring_buffer%internal_buffer)) .and. &
                aring_buffer%counter%total_size == 0)

        aring_buffer = ring_buffer(host_storage(), 20)
        call aring_buffer%allocate_buffer()
        call assertion%equal("ring_buffer::Allocate buffer with unallocated existing", &
                aring_buffer%internal_buffer%is_allocated .and. &
                aring_buffer%internal_buffer%number_of_bytes == 20 )

        aring_buffer = ring_buffer(host_storage(int(21, int64)), 20)
        call aring_buffer%allocate_buffer()
        call assertion%equal("ring_buffer::Allocate buffer with allocated existing", &
                aring_buffer%internal_buffer%is_allocated .and. &
                aring_buffer%internal_buffer%number_of_bytes == 20 )

        call c_f_pointer(aring_buffer%internal_buffer%actual_data, ptr, [5])
        ptr(:) = [1, 2, 3, 4, 5]
        ptr => null()

        call aring_buffer%add_buffer(dta, int(8, int64))
        call c_f_pointer(dta%actual_data, ptr, [2])
        call assertion%equal("ring_buffer::Allcoate 2 ints from 5 with offset 0", &
                all(ptr == [1,2]))
        ptr => null()

        call aring_buffer%add_buffer(dta, int(8, int64))
        call c_f_pointer(dta%actual_data, ptr, [2])
        call assertion%equal("ring_buffer::Allcoate 2 ints from 5 with offset 2", &
                all(ptr == [3,4]))
        ptr => null()

        call assertion%equal("ring_buffer::Available size after 2x2 int buffers out of 5", &
                aring_buffer%get_available_size() == 4)

        call aring_buffer%del_buffer(int(8, int64))
        call assertion%equal("ring_buffer::Available size when not contiguous", &
                aring_buffer%get_available_size() == 8)

        call aring_buffer%add_buffer(dta, int(8, int64))
        call c_f_pointer(dta%actual_data, ptr, [2])
        call assertion%equal("ring_buffer::Allcoate 2 ints from 5 with offset 4", &
                all(ptr == [1,2]))
        ptr => null()

        call aring_buffer%del_buffer(int(16, int64))
        call assertion%equal("ring_buffer::Available size after all free", &
                aring_buffer%get_available_size() == 20)

        call aring_buffer%add_buffer(dta, int(20, int64))
        call c_f_pointer(dta%actual_data, ptr, [5])
        call assertion%equal("ring_buffer::Allcoate 5 ints from 5 with offset 0", &
                all(ptr == [1,2,3,4,5]))
        ptr => null()

        call aring_buffer%del_buffer(int(8, int64))
        call aring_buffer%reset()
        call assertion%equal("ring_buffer::Available size after reset", &
                aring_buffer%get_available_size() == 20)
        call aring_buffer%cleanup()
    end subroutine run

    subroutine cleanup(this)
        class(ring_buffer_test), intent(inout) :: this

        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(ring_buffer_test), intent(inout) :: this
    end subroutine clear
end module ring_buffer_test_module
