! Auto-generated. DO NOT MODIFY!
module storage_helper_module
    use, intrinsic :: iso_fortran_env, only : &
            int8, &
            int64, &
            real64, &
            real32, &
            int32, &
            int16, &
            int8
    use :: memory_api, only : &
            data_storage
    use :: fortran_data_converter_module, only : &
            secure_fortran_pointer_from_remote_storage, &
            release_pointer_from_remote_storage

    implicit none
    private

    public :: storage_helper

    type :: storage_helper
    contains
        generic :: equal => &
                equal_from_storage, &
                equal_complex128_rank0, &
                equal_complex128_rank1, &
                equal_complex128_rank2, &
                equal_complex128_rank3, &
                equal_complex128_rank4, &
                equal_complex128_rank5, &
                equal_complex64_rank0, &
                equal_complex64_rank1, &
                equal_complex64_rank2, &
                equal_complex64_rank3, &
                equal_complex64_rank4, &
                equal_complex64_rank5, &
                equal_real64_rank0, &
                equal_real64_rank1, &
                equal_real64_rank2, &
                equal_real64_rank3, &
                equal_real64_rank4, &
                equal_real64_rank5, &
                equal_real32_rank0, &
                equal_real32_rank1, &
                equal_real32_rank2, &
                equal_real32_rank3, &
                equal_real32_rank4, &
                equal_real32_rank5, &
                equal_int64_rank0, &
                equal_int64_rank1, &
                equal_int64_rank2, &
                equal_int64_rank3, &
                equal_int64_rank4, &
                equal_int64_rank5, &
                equal_int32_rank0, &
                equal_int32_rank1, &
                equal_int32_rank2, &
                equal_int32_rank3, &
                equal_int32_rank4, &
                equal_int32_rank5, &
                equal_int16_rank0, &
                equal_int16_rank1, &
                equal_int16_rank2, &
                equal_int16_rank3, &
                equal_int16_rank4, &
                equal_int16_rank5, &
                equal_int8_rank0, &
                equal_int8_rank1, &
                equal_int8_rank2, &
                equal_int8_rank3, &
                equal_int8_rank4, &
                equal_int8_rank5
        procedure :: equal_from_storage => equal_from_storage
        procedure :: equal_complex128_rank0 => equal_complex128_rank0
        procedure :: equal_complex128_rank1 => equal_complex128_rank1
        procedure :: equal_complex128_rank2 => equal_complex128_rank2
        procedure :: equal_complex128_rank3 => equal_complex128_rank3
        procedure :: equal_complex128_rank4 => equal_complex128_rank4
        procedure :: equal_complex128_rank5 => equal_complex128_rank5
        procedure :: equal_complex64_rank0 => equal_complex64_rank0
        procedure :: equal_complex64_rank1 => equal_complex64_rank1
        procedure :: equal_complex64_rank2 => equal_complex64_rank2
        procedure :: equal_complex64_rank3 => equal_complex64_rank3
        procedure :: equal_complex64_rank4 => equal_complex64_rank4
        procedure :: equal_complex64_rank5 => equal_complex64_rank5
        procedure :: equal_real64_rank0 => equal_real64_rank0
        procedure :: equal_real64_rank1 => equal_real64_rank1
        procedure :: equal_real64_rank2 => equal_real64_rank2
        procedure :: equal_real64_rank3 => equal_real64_rank3
        procedure :: equal_real64_rank4 => equal_real64_rank4
        procedure :: equal_real64_rank5 => equal_real64_rank5
        procedure :: equal_real32_rank0 => equal_real32_rank0
        procedure :: equal_real32_rank1 => equal_real32_rank1
        procedure :: equal_real32_rank2 => equal_real32_rank2
        procedure :: equal_real32_rank3 => equal_real32_rank3
        procedure :: equal_real32_rank4 => equal_real32_rank4
        procedure :: equal_real32_rank5 => equal_real32_rank5
        procedure :: equal_int64_rank0 => equal_int64_rank0
        procedure :: equal_int64_rank1 => equal_int64_rank1
        procedure :: equal_int64_rank2 => equal_int64_rank2
        procedure :: equal_int64_rank3 => equal_int64_rank3
        procedure :: equal_int64_rank4 => equal_int64_rank4
        procedure :: equal_int64_rank5 => equal_int64_rank5
        procedure :: equal_int32_rank0 => equal_int32_rank0
        procedure :: equal_int32_rank1 => equal_int32_rank1
        procedure :: equal_int32_rank2 => equal_int32_rank2
        procedure :: equal_int32_rank3 => equal_int32_rank3
        procedure :: equal_int32_rank4 => equal_int32_rank4
        procedure :: equal_int32_rank5 => equal_int32_rank5
        procedure :: equal_int16_rank0 => equal_int16_rank0
        procedure :: equal_int16_rank1 => equal_int16_rank1
        procedure :: equal_int16_rank2 => equal_int16_rank2
        procedure :: equal_int16_rank3 => equal_int16_rank3
        procedure :: equal_int16_rank4 => equal_int16_rank4
        procedure :: equal_int16_rank5 => equal_int16_rank5
        procedure :: equal_int8_rank0 => equal_int8_rank0
        procedure :: equal_int8_rank1 => equal_int8_rank1
        procedure :: equal_int8_rank2 => equal_int8_rank2
        procedure :: equal_int8_rank3 => equal_int8_rank3
        procedure :: equal_int8_rank4 => equal_int8_rank4
        procedure :: equal_int8_rank5 => equal_int8_rank5
    end type storage_helper

contains
    function equal_from_storage(this, first, second) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        class(data_storage), intent(in) :: second
        logical :: res

        integer(int8), dimension(:), pointer, contiguous :: ptr1, ptr2

        res = .false.
        if ( first%number_of_bytes /= second%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr1, first, dims=[first%number_of_bytes])
        call secure_fortran_pointer_from_remote_storage(ptr2, second, dims=[second%number_of_bytes])

        res = all(ptr1==ptr2)

        call release_pointer_from_remote_storage(ptr1, first)
        call release_pointer_from_remote_storage(ptr2, second)
    end function equal_from_storage

    function equal_complex128_rank0(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        complex(real64), intent(in) :: second
        complex(real64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        complex(real64), pointer :: ptr
        complex(real64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes = storage_size((1.0_real64, 1.0_real64))/8

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first)
        res = abs(real(second)-real(ptr)) <= real(my_tolerance)
        res = res .and. abs(aimag(second)-aimag(ptr)) <= real(my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_complex128_rank0

    function equal_complex128_rank1(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        complex(real64), dimension(:), intent(in) :: second
        complex(real64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        complex(real64), dimension(:), pointer, contiguous :: ptr
        complex(real64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size((1.0_real64, 1.0_real64))/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(real(second)-real(ptr)) <= real(my_tolerance))
        res = res .and. all(abs(aimag(second)-aimag(ptr)) <= real(my_tolerance))
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_complex128_rank1

    function equal_complex128_rank2(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        complex(real64), dimension(:,:), intent(in) :: second
        complex(real64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        complex(real64), dimension(:,:), pointer, contiguous :: ptr
        complex(real64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size((1.0_real64, 1.0_real64))/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(real(second)-real(ptr)) <= real(my_tolerance))
        res = res .and. all(abs(aimag(second)-aimag(ptr)) <= real(my_tolerance))
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_complex128_rank2

    function equal_complex128_rank3(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        complex(real64), dimension(:,:,:), intent(in) :: second
        complex(real64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        complex(real64), dimension(:,:,:), pointer, contiguous :: ptr
        complex(real64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size((1.0_real64, 1.0_real64))/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(real(second)-real(ptr)) <= real(my_tolerance))
        res = res .and. all(abs(aimag(second)-aimag(ptr)) <= real(my_tolerance))
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_complex128_rank3

    function equal_complex128_rank4(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        complex(real64), dimension(:,:,:,:), intent(in) :: second
        complex(real64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        complex(real64), dimension(:,:,:,:), pointer, contiguous :: ptr
        complex(real64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size((1.0_real64, 1.0_real64))/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(real(second)-real(ptr)) <= real(my_tolerance))
        res = res .and. all(abs(aimag(second)-aimag(ptr)) <= real(my_tolerance))
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_complex128_rank4

    function equal_complex128_rank5(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        complex(real64), dimension(:,:,:,:,:), intent(in) :: second
        complex(real64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        complex(real64), dimension(:,:,:,:,:), pointer, contiguous :: ptr
        complex(real64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size((1.0_real64, 1.0_real64))/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(real(second)-real(ptr)) <= real(my_tolerance))
        res = res .and. all(abs(aimag(second)-aimag(ptr)) <= real(my_tolerance))
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_complex128_rank5

    function equal_complex64_rank0(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        complex(real32), intent(in) :: second
        complex(real32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        complex(real32), pointer :: ptr
        complex(real32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes = storage_size((1.0_real32, 1.0_real32))/8

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first)
        res = abs(real(second)-real(ptr)) <= real(my_tolerance)
        res = res .and. abs(aimag(second)-aimag(ptr)) <= real(my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_complex64_rank0

    function equal_complex64_rank1(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        complex(real32), dimension(:), intent(in) :: second
        complex(real32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        complex(real32), dimension(:), pointer, contiguous :: ptr
        complex(real32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size((1.0_real32, 1.0_real32))/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(real(second)-real(ptr)) <= real(my_tolerance))
        res = res .and. all(abs(aimag(second)-aimag(ptr)) <= real(my_tolerance))
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_complex64_rank1

    function equal_complex64_rank2(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        complex(real32), dimension(:,:), intent(in) :: second
        complex(real32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        complex(real32), dimension(:,:), pointer, contiguous :: ptr
        complex(real32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size((1.0_real32, 1.0_real32))/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(real(second)-real(ptr)) <= real(my_tolerance))
        res = res .and. all(abs(aimag(second)-aimag(ptr)) <= real(my_tolerance))
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_complex64_rank2

    function equal_complex64_rank3(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        complex(real32), dimension(:,:,:), intent(in) :: second
        complex(real32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        complex(real32), dimension(:,:,:), pointer, contiguous :: ptr
        complex(real32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size((1.0_real32, 1.0_real32))/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(real(second)-real(ptr)) <= real(my_tolerance))
        res = res .and. all(abs(aimag(second)-aimag(ptr)) <= real(my_tolerance))
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_complex64_rank3

    function equal_complex64_rank4(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        complex(real32), dimension(:,:,:,:), intent(in) :: second
        complex(real32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        complex(real32), dimension(:,:,:,:), pointer, contiguous :: ptr
        complex(real32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size((1.0_real32, 1.0_real32))/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(real(second)-real(ptr)) <= real(my_tolerance))
        res = res .and. all(abs(aimag(second)-aimag(ptr)) <= real(my_tolerance))
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_complex64_rank4

    function equal_complex64_rank5(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        complex(real32), dimension(:,:,:,:,:), intent(in) :: second
        complex(real32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        complex(real32), dimension(:,:,:,:,:), pointer, contiguous :: ptr
        complex(real32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size((1.0_real32, 1.0_real32))/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(real(second)-real(ptr)) <= real(my_tolerance))
        res = res .and. all(abs(aimag(second)-aimag(ptr)) <= real(my_tolerance))
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_complex64_rank5

    function equal_real64_rank0(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        real(real64), intent(in) :: second
        real(real64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        real(real64), pointer :: ptr
        real(real64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes = storage_size(1.0_real64)/8

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first)
        res = abs(second-ptr) <= my_tolerance
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_real64_rank0

    function equal_real64_rank1(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        real(real64), dimension(:), intent(in) :: second
        real(real64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        real(real64), dimension(:), pointer, contiguous :: ptr
        real(real64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1.0_real64)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_real64_rank1

    function equal_real64_rank2(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        real(real64), dimension(:,:), intent(in) :: second
        real(real64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        real(real64), dimension(:,:), pointer, contiguous :: ptr
        real(real64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1.0_real64)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_real64_rank2

    function equal_real64_rank3(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        real(real64), dimension(:,:,:), intent(in) :: second
        real(real64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        real(real64), dimension(:,:,:), pointer, contiguous :: ptr
        real(real64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1.0_real64)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_real64_rank3

    function equal_real64_rank4(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        real(real64), dimension(:,:,:,:), intent(in) :: second
        real(real64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        real(real64), dimension(:,:,:,:), pointer, contiguous :: ptr
        real(real64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1.0_real64)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_real64_rank4

    function equal_real64_rank5(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        real(real64), dimension(:,:,:,:,:), intent(in) :: second
        real(real64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        real(real64), dimension(:,:,:,:,:), pointer, contiguous :: ptr
        real(real64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1.0_real64)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_real64_rank5

    function equal_real32_rank0(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        real(real32), intent(in) :: second
        real(real32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        real(real32), pointer :: ptr
        real(real32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes = storage_size(1.0_real32)/8

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first)
        res = abs(second-ptr) <= my_tolerance
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_real32_rank0

    function equal_real32_rank1(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        real(real32), dimension(:), intent(in) :: second
        real(real32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        real(real32), dimension(:), pointer, contiguous :: ptr
        real(real32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1.0_real32)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_real32_rank1

    function equal_real32_rank2(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        real(real32), dimension(:,:), intent(in) :: second
        real(real32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        real(real32), dimension(:,:), pointer, contiguous :: ptr
        real(real32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1.0_real32)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_real32_rank2

    function equal_real32_rank3(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        real(real32), dimension(:,:,:), intent(in) :: second
        real(real32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        real(real32), dimension(:,:,:), pointer, contiguous :: ptr
        real(real32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1.0_real32)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_real32_rank3

    function equal_real32_rank4(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        real(real32), dimension(:,:,:,:), intent(in) :: second
        real(real32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        real(real32), dimension(:,:,:,:), pointer, contiguous :: ptr
        real(real32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1.0_real32)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_real32_rank4

    function equal_real32_rank5(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        real(real32), dimension(:,:,:,:,:), intent(in) :: second
        real(real32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        real(real32), dimension(:,:,:,:,:), pointer, contiguous :: ptr
        real(real32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1.0_real32)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_real32_rank5

    function equal_int64_rank0(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int64), intent(in) :: second
        integer(int64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer(int64), pointer :: ptr
        integer(int64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes = storage_size(1_int64)/8

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first)
        res = abs(second-ptr) <= my_tolerance
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int64_rank0

    function equal_int64_rank1(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int64), dimension(:), intent(in) :: second
        integer(int64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int64), dimension(:), pointer, contiguous :: ptr
        integer(int64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int64)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int64_rank1

    function equal_int64_rank2(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int64), dimension(:,:), intent(in) :: second
        integer(int64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int64), dimension(:,:), pointer, contiguous :: ptr
        integer(int64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int64)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int64_rank2

    function equal_int64_rank3(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int64), dimension(:,:,:), intent(in) :: second
        integer(int64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int64), dimension(:,:,:), pointer, contiguous :: ptr
        integer(int64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int64)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int64_rank3

    function equal_int64_rank4(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int64), dimension(:,:,:,:), intent(in) :: second
        integer(int64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int64), dimension(:,:,:,:), pointer, contiguous :: ptr
        integer(int64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int64)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int64_rank4

    function equal_int64_rank5(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int64), dimension(:,:,:,:,:), intent(in) :: second
        integer(int64), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int64), dimension(:,:,:,:,:), pointer, contiguous :: ptr
        integer(int64) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int64)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int64_rank5

    function equal_int32_rank0(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int32), intent(in) :: second
        integer(int32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer(int32), pointer :: ptr
        integer(int32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes = storage_size(1_int32)/8

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first)
        res = abs(second-ptr) <= my_tolerance
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int32_rank0

    function equal_int32_rank1(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int32), dimension(:), intent(in) :: second
        integer(int32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int32), dimension(:), pointer, contiguous :: ptr
        integer(int32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int32)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int32_rank1

    function equal_int32_rank2(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int32), dimension(:,:), intent(in) :: second
        integer(int32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int32), dimension(:,:), pointer, contiguous :: ptr
        integer(int32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int32)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int32_rank2

    function equal_int32_rank3(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int32), dimension(:,:,:), intent(in) :: second
        integer(int32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int32), dimension(:,:,:), pointer, contiguous :: ptr
        integer(int32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int32)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int32_rank3

    function equal_int32_rank4(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int32), dimension(:,:,:,:), intent(in) :: second
        integer(int32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int32), dimension(:,:,:,:), pointer, contiguous :: ptr
        integer(int32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int32)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int32_rank4

    function equal_int32_rank5(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int32), dimension(:,:,:,:,:), intent(in) :: second
        integer(int32), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int32), dimension(:,:,:,:,:), pointer, contiguous :: ptr
        integer(int32) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int32)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int32_rank5

    function equal_int16_rank0(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int16), intent(in) :: second
        integer(int16), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer(int16), pointer :: ptr
        integer(int16) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes = storage_size(1_int16)/8

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first)
        res = abs(second-ptr) <= my_tolerance
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int16_rank0

    function equal_int16_rank1(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int16), dimension(:), intent(in) :: second
        integer(int16), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int16), dimension(:), pointer, contiguous :: ptr
        integer(int16) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int16)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int16_rank1

    function equal_int16_rank2(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int16), dimension(:,:), intent(in) :: second
        integer(int16), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int16), dimension(:,:), pointer, contiguous :: ptr
        integer(int16) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int16)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int16_rank2

    function equal_int16_rank3(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int16), dimension(:,:,:), intent(in) :: second
        integer(int16), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int16), dimension(:,:,:), pointer, contiguous :: ptr
        integer(int16) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int16)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int16_rank3

    function equal_int16_rank4(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int16), dimension(:,:,:,:), intent(in) :: second
        integer(int16), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int16), dimension(:,:,:,:), pointer, contiguous :: ptr
        integer(int16) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int16)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int16_rank4

    function equal_int16_rank5(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int16), dimension(:,:,:,:,:), intent(in) :: second
        integer(int16), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int16), dimension(:,:,:,:,:), pointer, contiguous :: ptr
        integer(int16) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int16)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int16_rank5

    function equal_int8_rank0(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int8), intent(in) :: second
        integer(int8), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer(int8), pointer :: ptr
        integer(int8) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes = storage_size(1_int8)/8

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first)
        res = abs(second-ptr) <= my_tolerance
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int8_rank0

    function equal_int8_rank1(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int8), dimension(:), intent(in) :: second
        integer(int8), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int8), dimension(:), pointer, contiguous :: ptr
        integer(int8) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int8)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int8_rank1

    function equal_int8_rank2(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int8), dimension(:,:), intent(in) :: second
        integer(int8), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int8), dimension(:,:), pointer, contiguous :: ptr
        integer(int8) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int8)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int8_rank2

    function equal_int8_rank3(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int8), dimension(:,:,:), intent(in) :: second
        integer(int8), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int8), dimension(:,:,:), pointer, contiguous :: ptr
        integer(int8) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int8)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int8_rank3

    function equal_int8_rank4(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int8), dimension(:,:,:,:), intent(in) :: second
        integer(int8), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int8), dimension(:,:,:,:), pointer, contiguous :: ptr
        integer(int8) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int8)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int8_rank4

    function equal_int8_rank5(this, first, second, tolerance) result(res)
        class(storage_helper), intent(in) :: this
        class(data_storage), intent(in) :: first
        integer(int8), dimension(:,:,:,:,:), intent(in) :: second
        integer(int8), intent(in), optional :: tolerance
        logical :: res

        integer(int64) :: number_of_bytes
        integer :: number_of_bytes_per_element
        integer(int8), dimension(:,:,:,:,:), pointer, contiguous :: ptr
        integer(int8) :: my_tolerance

        res = .false.

        my_tolerance = 0
        if ( present(tolerance) ) my_tolerance = tolerance

        number_of_bytes_per_element = storage_size(1_int8)/8
        number_of_bytes = size(second, kind=int64)*number_of_bytes_per_element

        if ( number_of_bytes /= first%number_of_bytes ) return

        call secure_fortran_pointer_from_remote_storage(ptr, first, shape(second, kind=int64))
        res = all(abs(second-ptr) <= my_tolerance)
        call release_pointer_from_remote_storage(ptr, first)
    end function equal_int8_rank5
end module storage_helper_module
