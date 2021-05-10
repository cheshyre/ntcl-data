module intrinsic_pointer_builder_module
    use, intrinsic :: iso_fortran_env, only : &
            int64, &
            real64, &
            int32
    use, intrinsic :: iso_c_binding, only : c_loc, c_f_pointer, c_ptr
    use :: host_storage_module, only : host_storage

    implicit none
    private

    public :: intrinsic_pointer_builder

    type :: intrinsic_pointer_builder
    contains
        procedure :: get_data_storage_rank1_real64 => get_data_storage_rank1_real64
        procedure :: get_data_storage_rank2_real64 => get_data_storage_rank2_real64
        procedure :: get_data_storage_rank3_real64 => get_data_storage_rank3_real64
        procedure :: get_data_storage_rank4_real64 => get_data_storage_rank4_real64
        procedure :: get_data_storage_rank5_real64 => get_data_storage_rank5_real64
        procedure :: get_data_storage_rank1_complex64 => get_data_storage_rank1_complex64
        procedure :: get_data_storage_rank2_complex64 => get_data_storage_rank2_complex64
        procedure :: get_data_storage_rank3_complex64 => get_data_storage_rank3_complex64
        procedure :: get_data_storage_rank4_complex64 => get_data_storage_rank4_complex64
        procedure :: get_data_storage_rank5_complex64 => get_data_storage_rank5_complex64
        procedure :: get_data_storage_rank1_int64 => get_data_storage_rank1_int64
        procedure :: get_data_storage_rank2_int64 => get_data_storage_rank2_int64
        procedure :: get_data_storage_rank3_int64 => get_data_storage_rank3_int64
        procedure :: get_data_storage_rank4_int64 => get_data_storage_rank4_int64
        procedure :: get_data_storage_rank5_int64 => get_data_storage_rank5_int64
        procedure :: get_data_storage_rank1_int32 => get_data_storage_rank1_int32
        procedure :: get_data_storage_rank2_int32 => get_data_storage_rank2_int32
        procedure :: get_data_storage_rank3_int32 => get_data_storage_rank3_int32
        procedure :: get_data_storage_rank4_int32 => get_data_storage_rank4_int32
        procedure :: get_data_storage_rank5_int32 => get_data_storage_rank5_int32
        procedure :: get_data_storage_rank1_cpointer => get_data_storage_rank1_cpointer
        procedure :: get_data_storage_rank2_cpointer => get_data_storage_rank2_cpointer
        procedure :: get_data_storage_rank3_cpointer => get_data_storage_rank3_cpointer
        procedure :: get_data_storage_rank4_cpointer => get_data_storage_rank4_cpointer
        procedure :: get_data_storage_rank5_cpointer => get_data_storage_rank5_cpointer
        procedure :: get_data_storage_cpointer => get_data_storage_cpointer
        procedure :: secure_pointer_rank1_real64 => secure_pointer_rank1_real64
        procedure :: secure_pointer_rank1_real64_int64 => secure_pointer_rank1_real64_int64
        procedure :: secure_pointer_rank2_real64 => secure_pointer_rank2_real64
        procedure :: secure_pointer_rank2_real64_int64 => secure_pointer_rank2_real64_int64
        procedure :: secure_pointer_rank3_real64 => secure_pointer_rank3_real64
        procedure :: secure_pointer_rank3_real64_int64 => secure_pointer_rank3_real64_int64
        procedure :: secure_pointer_rank4_real64 => secure_pointer_rank4_real64
        procedure :: secure_pointer_rank4_real64_int64 => secure_pointer_rank4_real64_int64
        procedure :: secure_pointer_rank5_real64 => secure_pointer_rank5_real64
        procedure :: secure_pointer_rank5_real64_int64 => secure_pointer_rank5_real64_int64
        procedure :: secure_pointer_rank1_complex64 => secure_pointer_rank1_complex64
        procedure :: secure_pointer_rank1_complex64_int64 => secure_pointer_rank1_complex64_int64
        procedure :: secure_pointer_rank2_complex64 => secure_pointer_rank2_complex64
        procedure :: secure_pointer_rank2_complex64_int64 => secure_pointer_rank2_complex64_int64
        procedure :: secure_pointer_rank3_complex64 => secure_pointer_rank3_complex64
        procedure :: secure_pointer_rank3_complex64_int64 => secure_pointer_rank3_complex64_int64
        procedure :: secure_pointer_rank4_complex64 => secure_pointer_rank4_complex64
        procedure :: secure_pointer_rank4_complex64_int64 => secure_pointer_rank4_complex64_int64
        procedure :: secure_pointer_rank5_complex64 => secure_pointer_rank5_complex64
        procedure :: secure_pointer_rank5_complex64_int64 => secure_pointer_rank5_complex64_int64
        procedure :: secure_pointer_rank1_int64 => secure_pointer_rank1_int64
        procedure :: secure_pointer_rank1_int64_int64 => secure_pointer_rank1_int64_int64
        procedure :: secure_pointer_rank2_int64 => secure_pointer_rank2_int64
        procedure :: secure_pointer_rank2_int64_int64 => secure_pointer_rank2_int64_int64
        procedure :: secure_pointer_rank3_int64 => secure_pointer_rank3_int64
        procedure :: secure_pointer_rank3_int64_int64 => secure_pointer_rank3_int64_int64
        procedure :: secure_pointer_rank4_int64 => secure_pointer_rank4_int64
        procedure :: secure_pointer_rank4_int64_int64 => secure_pointer_rank4_int64_int64
        procedure :: secure_pointer_rank5_int64 => secure_pointer_rank5_int64
        procedure :: secure_pointer_rank5_int64_int64 => secure_pointer_rank5_int64_int64
        procedure :: secure_pointer_rank1_int32 => secure_pointer_rank1_int32
        procedure :: secure_pointer_rank1_int32_int64 => secure_pointer_rank1_int32_int64
        procedure :: secure_pointer_rank2_int32 => secure_pointer_rank2_int32
        procedure :: secure_pointer_rank2_int32_int64 => secure_pointer_rank2_int32_int64
        procedure :: secure_pointer_rank3_int32 => secure_pointer_rank3_int32
        procedure :: secure_pointer_rank3_int32_int64 => secure_pointer_rank3_int32_int64
        procedure :: secure_pointer_rank4_int32 => secure_pointer_rank4_int32
        procedure :: secure_pointer_rank4_int32_int64 => secure_pointer_rank4_int32_int64
        procedure :: secure_pointer_rank5_int32 => secure_pointer_rank5_int32
        procedure :: secure_pointer_rank5_int32_int64 => secure_pointer_rank5_int32_int64
        procedure :: secure_pointer_rank1_cpointer => secure_pointer_rank1_cpointer
        procedure :: secure_pointer_rank1_cpointer_int64 => secure_pointer_rank1_cpointer_int64
        procedure :: secure_pointer_rank2_cpointer => secure_pointer_rank2_cpointer
        procedure :: secure_pointer_rank2_cpointer_int64 => secure_pointer_rank2_cpointer_int64
        procedure :: secure_pointer_rank3_cpointer => secure_pointer_rank3_cpointer
        procedure :: secure_pointer_rank3_cpointer_int64 => secure_pointer_rank3_cpointer_int64
        procedure :: secure_pointer_rank4_cpointer => secure_pointer_rank4_cpointer
        procedure :: secure_pointer_rank4_cpointer_int64 => secure_pointer_rank4_cpointer_int64
        procedure :: secure_pointer_rank5_cpointer => secure_pointer_rank5_cpointer
        procedure :: secure_pointer_rank5_cpointer_int64 => secure_pointer_rank5_cpointer_int64
        procedure :: secure_pointer_cpointer => secure_pointer_cpointer
        generic :: get_data_storage => &
                get_data_storage_rank1_real64, &
                get_data_storage_rank2_real64, &
                get_data_storage_rank3_real64, &
                get_data_storage_rank4_real64, &
                get_data_storage_rank5_real64, &
                get_data_storage_rank1_complex64, &
                get_data_storage_rank2_complex64, &
                get_data_storage_rank3_complex64, &
                get_data_storage_rank4_complex64, &
                get_data_storage_rank5_complex64, &
                get_data_storage_rank1_int64, &
                get_data_storage_rank2_int64, &
                get_data_storage_rank3_int64, &
                get_data_storage_rank4_int64, &
                get_data_storage_rank5_int64, &
                get_data_storage_rank1_int32, &
                get_data_storage_rank2_int32, &
                get_data_storage_rank3_int32, &
                get_data_storage_rank4_int32, &
                get_data_storage_rank5_int32, &
                get_data_storage_rank1_cpointer, &
                get_data_storage_rank2_cpointer, &
                get_data_storage_rank3_cpointer, &
                get_data_storage_rank4_cpointer, &
                get_data_storage_rank5_cpointer, &
                get_data_storage_cpointer
        generic :: secure_pointer => &
                secure_pointer_rank1_real64, &
                secure_pointer_rank1_real64_int64, &
                secure_pointer_rank2_real64, &
                secure_pointer_rank2_real64_int64, &
                secure_pointer_rank3_real64, &
                secure_pointer_rank3_real64_int64, &
                secure_pointer_rank4_real64, &
                secure_pointer_rank4_real64_int64, &
                secure_pointer_rank5_real64, &
                secure_pointer_rank5_real64_int64, &
                secure_pointer_rank1_complex64, &
                secure_pointer_rank1_complex64_int64, &
                secure_pointer_rank2_complex64, &
                secure_pointer_rank2_complex64_int64, &
                secure_pointer_rank3_complex64, &
                secure_pointer_rank3_complex64_int64, &
                secure_pointer_rank4_complex64, &
                secure_pointer_rank4_complex64_int64, &
                secure_pointer_rank5_complex64, &
                secure_pointer_rank5_complex64_int64, &
                secure_pointer_rank1_int64, &
                secure_pointer_rank1_int64_int64, &
                secure_pointer_rank2_int64, &
                secure_pointer_rank2_int64_int64, &
                secure_pointer_rank3_int64, &
                secure_pointer_rank3_int64_int64, &
                secure_pointer_rank4_int64, &
                secure_pointer_rank4_int64_int64, &
                secure_pointer_rank5_int64, &
                secure_pointer_rank5_int64_int64, &
                secure_pointer_rank1_int32, &
                secure_pointer_rank1_int32_int64, &
                secure_pointer_rank2_int32, &
                secure_pointer_rank2_int32_int64, &
                secure_pointer_rank3_int32, &
                secure_pointer_rank3_int32_int64, &
                secure_pointer_rank4_int32, &
                secure_pointer_rank4_int32_int64, &
                secure_pointer_rank5_int32, &
                secure_pointer_rank5_int32_int64, &
                secure_pointer_rank1_cpointer, &
                secure_pointer_rank1_cpointer_int64, &
                secure_pointer_rank2_cpointer, &
                secure_pointer_rank2_cpointer_int64, &
                secure_pointer_rank3_cpointer, &
                secure_pointer_rank3_cpointer_int64, &
                secure_pointer_rank4_cpointer, &
                secure_pointer_rank4_cpointer_int64, &
                secure_pointer_rank5_cpointer, &
                secure_pointer_rank5_cpointer_int64, &
                secure_pointer_cpointer
    end type intrinsic_pointer_builder
contains
    type(host_storage) function get_data_storage_rank1_real64(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        real(real64), dimension(:), target, intent(in) :: dta

        get_data_storage_rank1_real64 = this%get_data_storage(c_loc(dta), 8*size(dta, kind=int64))
    end function get_data_storage_rank1_real64

    type(host_storage) function get_data_storage_rank2_real64(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        real(real64), dimension(:,:), target, intent(in) :: dta

        get_data_storage_rank2_real64 = this%get_data_storage(c_loc(dta), 8*size(dta, kind=int64))
    end function get_data_storage_rank2_real64

    type(host_storage) function get_data_storage_rank3_real64(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        real(real64), dimension(:,:,:), target, intent(in) :: dta

        get_data_storage_rank3_real64 = this%get_data_storage(c_loc(dta), 8*size(dta, kind=int64))
    end function get_data_storage_rank3_real64

    type(host_storage) function get_data_storage_rank4_real64(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        real(real64), dimension(:,:,:,:), target, intent(in) :: dta

        get_data_storage_rank4_real64 = this%get_data_storage(c_loc(dta), 8*size(dta, kind=int64))
    end function get_data_storage_rank4_real64

    type(host_storage) function get_data_storage_rank5_real64(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        real(real64), dimension(:,:,:,:,:), target, intent(in) :: dta

        get_data_storage_rank5_real64 = this%get_data_storage(c_loc(dta), 8*size(dta, kind=int64))
    end function get_data_storage_rank5_real64

    type(host_storage) function get_data_storage_rank1_complex64(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        complex(real64), dimension(:), target, intent(in) :: dta

        get_data_storage_rank1_complex64 = this%get_data_storage(c_loc(dta), 16*size(dta, kind=int64))
    end function get_data_storage_rank1_complex64

    type(host_storage) function get_data_storage_rank2_complex64(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        complex(real64), dimension(:,:), target, intent(in) :: dta

        get_data_storage_rank2_complex64 = this%get_data_storage(c_loc(dta), 16*size(dta, kind=int64))
    end function get_data_storage_rank2_complex64

    type(host_storage) function get_data_storage_rank3_complex64(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        complex(real64), dimension(:,:,:), target, intent(in) :: dta

        get_data_storage_rank3_complex64 = this%get_data_storage(c_loc(dta), 16*size(dta, kind=int64))
    end function get_data_storage_rank3_complex64

    type(host_storage) function get_data_storage_rank4_complex64(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        complex(real64), dimension(:,:,:,:), target, intent(in) :: dta

        get_data_storage_rank4_complex64 = this%get_data_storage(c_loc(dta), 16*size(dta, kind=int64))
    end function get_data_storage_rank4_complex64

    type(host_storage) function get_data_storage_rank5_complex64(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        complex(real64), dimension(:,:,:,:,:), target, intent(in) :: dta

        get_data_storage_rank5_complex64 = this%get_data_storage(c_loc(dta), 16*size(dta, kind=int64))
    end function get_data_storage_rank5_complex64

    type(host_storage) function get_data_storage_rank1_int64(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        integer(int64), dimension(:), target, intent(in) :: dta

        get_data_storage_rank1_int64 = this%get_data_storage(c_loc(dta), 8*size(dta, kind=int64))
    end function get_data_storage_rank1_int64

    type(host_storage) function get_data_storage_rank2_int64(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        integer(int64), dimension(:,:), target, intent(in) :: dta

        get_data_storage_rank2_int64 = this%get_data_storage(c_loc(dta), 8*size(dta, kind=int64))
    end function get_data_storage_rank2_int64

    type(host_storage) function get_data_storage_rank3_int64(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        integer(int64), dimension(:,:,:), target, intent(in) :: dta

        get_data_storage_rank3_int64 = this%get_data_storage(c_loc(dta), 8*size(dta, kind=int64))
    end function get_data_storage_rank3_int64

    type(host_storage) function get_data_storage_rank4_int64(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        integer(int64), dimension(:,:,:,:), target, intent(in) :: dta

        get_data_storage_rank4_int64 = this%get_data_storage(c_loc(dta), 8*size(dta, kind=int64))
    end function get_data_storage_rank4_int64

    type(host_storage) function get_data_storage_rank5_int64(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        integer(int64), dimension(:,:,:,:,:), target, intent(in) :: dta

        get_data_storage_rank5_int64 = this%get_data_storage(c_loc(dta), 8*size(dta, kind=int64))
    end function get_data_storage_rank5_int64

    type(host_storage) function get_data_storage_rank1_int32(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        integer(int32), dimension(:), target, intent(in) :: dta

        get_data_storage_rank1_int32 = this%get_data_storage(c_loc(dta), 4*size(dta, kind=int64))
    end function get_data_storage_rank1_int32

    type(host_storage) function get_data_storage_rank2_int32(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        integer(int32), dimension(:,:), target, intent(in) :: dta

        get_data_storage_rank2_int32 = this%get_data_storage(c_loc(dta), 4*size(dta, kind=int64))
    end function get_data_storage_rank2_int32

    type(host_storage) function get_data_storage_rank3_int32(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        integer(int32), dimension(:,:,:), target, intent(in) :: dta

        get_data_storage_rank3_int32 = this%get_data_storage(c_loc(dta), 4*size(dta, kind=int64))
    end function get_data_storage_rank3_int32

    type(host_storage) function get_data_storage_rank4_int32(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        integer(int32), dimension(:,:,:,:), target, intent(in) :: dta

        get_data_storage_rank4_int32 = this%get_data_storage(c_loc(dta), 4*size(dta, kind=int64))
    end function get_data_storage_rank4_int32

    type(host_storage) function get_data_storage_rank5_int32(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        integer(int32), dimension(:,:,:,:,:), target, intent(in) :: dta

        get_data_storage_rank5_int32 = this%get_data_storage(c_loc(dta), 4*size(dta, kind=int64))
    end function get_data_storage_rank5_int32

    type(host_storage) function get_data_storage_rank1_cpointer(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        type(c_ptr), dimension(:), target, intent(in) :: dta

        get_data_storage_rank1_cpointer = this%get_data_storage(c_loc(dta), 8*size(dta, kind=int64))
    end function get_data_storage_rank1_cpointer

    type(host_storage) function get_data_storage_rank2_cpointer(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        type(c_ptr), dimension(:,:), target, intent(in) :: dta

        get_data_storage_rank2_cpointer = this%get_data_storage(c_loc(dta), 8*size(dta, kind=int64))
    end function get_data_storage_rank2_cpointer

    type(host_storage) function get_data_storage_rank3_cpointer(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        type(c_ptr), dimension(:,:,:), target, intent(in) :: dta

        get_data_storage_rank3_cpointer = this%get_data_storage(c_loc(dta), 8*size(dta, kind=int64))
    end function get_data_storage_rank3_cpointer

    type(host_storage) function get_data_storage_rank4_cpointer(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        type(c_ptr), dimension(:,:,:,:), target, intent(in) :: dta

        get_data_storage_rank4_cpointer = this%get_data_storage(c_loc(dta), 8*size(dta, kind=int64))
    end function get_data_storage_rank4_cpointer

    type(host_storage) function get_data_storage_rank5_cpointer(this, dta)
        class(intrinsic_pointer_builder), intent(in) :: this
        type(c_ptr), dimension(:,:,:,:,:), target, intent(in) :: dta

        get_data_storage_rank5_cpointer = this%get_data_storage(c_loc(dta), 8*size(dta, kind=int64))
    end function get_data_storage_rank5_cpointer

    type(host_storage) function get_data_storage_cpointer(this, dta, number_of_bytes)
        class(intrinsic_pointer_builder), intent(in) :: this
        type(c_ptr), intent(in) :: dta
        integer(int64), intent(in) :: number_of_bytes

        get_data_storage_cpointer = host_storage()
        call get_data_storage_cpointer%set_data_pointer(dta, number_of_bytes)
    end function get_data_storage_cpointer

    subroutine secure_pointer_rank1_real64(this, storage, ptr, d1)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        real(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1])
    end subroutine secure_pointer_rank1_real64

    subroutine secure_pointer_rank1_real64_int64(this, storage, ptr, d1)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        real(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1])
    end subroutine secure_pointer_rank1_real64_int64

    subroutine secure_pointer_rank2_real64(this, storage, ptr, d1, d2)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        real(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2])
    end subroutine secure_pointer_rank2_real64

    subroutine secure_pointer_rank2_real64_int64(this, storage, ptr, d1, d2)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        real(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2])
    end subroutine secure_pointer_rank2_real64_int64

    subroutine secure_pointer_rank3_real64(this, storage, ptr, d1, d2, d3)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        real(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2, d3

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3])
    end subroutine secure_pointer_rank3_real64

    subroutine secure_pointer_rank3_real64_int64(this, storage, ptr, d1, d2, d3)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        real(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2, d3

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3])
    end subroutine secure_pointer_rank3_real64_int64

    subroutine secure_pointer_rank4_real64(this, storage, ptr, d1, d2, d3, d4)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        real(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2, d3, d4

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4])
    end subroutine secure_pointer_rank4_real64

    subroutine secure_pointer_rank4_real64_int64(this, storage, ptr, d1, d2, d3, d4)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        real(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2, d3, d4

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4])
    end subroutine secure_pointer_rank4_real64_int64

    subroutine secure_pointer_rank5_real64(this, storage, ptr, d1, d2, d3, d4, d5)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        real(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2, d3, d4, d5

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4, d5])
    end subroutine secure_pointer_rank5_real64

    subroutine secure_pointer_rank5_real64_int64(this, storage, ptr, d1, d2, d3, d4, d5)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        real(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2, d3, d4, d5

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4, d5])
    end subroutine secure_pointer_rank5_real64_int64

    subroutine secure_pointer_rank1_complex64(this, storage, ptr, d1)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        complex(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1])
    end subroutine secure_pointer_rank1_complex64

    subroutine secure_pointer_rank1_complex64_int64(this, storage, ptr, d1)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        complex(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1])
    end subroutine secure_pointer_rank1_complex64_int64

    subroutine secure_pointer_rank2_complex64(this, storage, ptr, d1, d2)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        complex(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2])
    end subroutine secure_pointer_rank2_complex64

    subroutine secure_pointer_rank2_complex64_int64(this, storage, ptr, d1, d2)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        complex(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2])
    end subroutine secure_pointer_rank2_complex64_int64

    subroutine secure_pointer_rank3_complex64(this, storage, ptr, d1, d2, d3)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        complex(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2, d3

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3])
    end subroutine secure_pointer_rank3_complex64

    subroutine secure_pointer_rank3_complex64_int64(this, storage, ptr, d1, d2, d3)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        complex(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2, d3

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3])
    end subroutine secure_pointer_rank3_complex64_int64

    subroutine secure_pointer_rank4_complex64(this, storage, ptr, d1, d2, d3, d4)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        complex(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2, d3, d4

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4])
    end subroutine secure_pointer_rank4_complex64

    subroutine secure_pointer_rank4_complex64_int64(this, storage, ptr, d1, d2, d3, d4)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        complex(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2, d3, d4

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4])
    end subroutine secure_pointer_rank4_complex64_int64

    subroutine secure_pointer_rank5_complex64(this, storage, ptr, d1, d2, d3, d4, d5)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        complex(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2, d3, d4, d5

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4, d5])
    end subroutine secure_pointer_rank5_complex64

    subroutine secure_pointer_rank5_complex64_int64(this, storage, ptr, d1, d2, d3, d4, d5)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        complex(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2, d3, d4, d5

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4, d5])
    end subroutine secure_pointer_rank5_complex64_int64

    subroutine secure_pointer_rank1_int64(this, storage, ptr, d1)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1])
    end subroutine secure_pointer_rank1_int64

    subroutine secure_pointer_rank1_int64_int64(this, storage, ptr, d1)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1])
    end subroutine secure_pointer_rank1_int64_int64

    subroutine secure_pointer_rank2_int64(this, storage, ptr, d1, d2)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2])
    end subroutine secure_pointer_rank2_int64

    subroutine secure_pointer_rank2_int64_int64(this, storage, ptr, d1, d2)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2])
    end subroutine secure_pointer_rank2_int64_int64

    subroutine secure_pointer_rank3_int64(this, storage, ptr, d1, d2, d3)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2, d3

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3])
    end subroutine secure_pointer_rank3_int64

    subroutine secure_pointer_rank3_int64_int64(this, storage, ptr, d1, d2, d3)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2, d3

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3])
    end subroutine secure_pointer_rank3_int64_int64

    subroutine secure_pointer_rank4_int64(this, storage, ptr, d1, d2, d3, d4)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2, d3, d4

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4])
    end subroutine secure_pointer_rank4_int64

    subroutine secure_pointer_rank4_int64_int64(this, storage, ptr, d1, d2, d3, d4)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2, d3, d4

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4])
    end subroutine secure_pointer_rank4_int64_int64

    subroutine secure_pointer_rank5_int64(this, storage, ptr, d1, d2, d3, d4, d5)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2, d3, d4, d5

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4, d5])
    end subroutine secure_pointer_rank5_int64

    subroutine secure_pointer_rank5_int64_int64(this, storage, ptr, d1, d2, d3, d4, d5)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2, d3, d4, d5

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4, d5])
    end subroutine secure_pointer_rank5_int64_int64

    subroutine secure_pointer_rank1_int32(this, storage, ptr, d1)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1])
    end subroutine secure_pointer_rank1_int32

    subroutine secure_pointer_rank1_int32_int64(this, storage, ptr, d1)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1])
    end subroutine secure_pointer_rank1_int32_int64

    subroutine secure_pointer_rank2_int32(this, storage, ptr, d1, d2)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2])
    end subroutine secure_pointer_rank2_int32

    subroutine secure_pointer_rank2_int32_int64(this, storage, ptr, d1, d2)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2])
    end subroutine secure_pointer_rank2_int32_int64

    subroutine secure_pointer_rank3_int32(this, storage, ptr, d1, d2, d3)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2, d3

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3])
    end subroutine secure_pointer_rank3_int32

    subroutine secure_pointer_rank3_int32_int64(this, storage, ptr, d1, d2, d3)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2, d3

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3])
    end subroutine secure_pointer_rank3_int32_int64

    subroutine secure_pointer_rank4_int32(this, storage, ptr, d1, d2, d3, d4)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2, d3, d4

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4])
    end subroutine secure_pointer_rank4_int32

    subroutine secure_pointer_rank4_int32_int64(this, storage, ptr, d1, d2, d3, d4)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2, d3, d4

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4])
    end subroutine secure_pointer_rank4_int32_int64

    subroutine secure_pointer_rank5_int32(this, storage, ptr, d1, d2, d3, d4, d5)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2, d3, d4, d5

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4, d5])
    end subroutine secure_pointer_rank5_int32

    subroutine secure_pointer_rank5_int32_int64(this, storage, ptr, d1, d2, d3, d4, d5)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        integer(int32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2, d3, d4, d5

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4, d5])
    end subroutine secure_pointer_rank5_int32_int64

    subroutine secure_pointer_rank1_cpointer(this, storage, ptr, d1)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        type(c_ptr), dimension(:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1])
    end subroutine secure_pointer_rank1_cpointer

    subroutine secure_pointer_rank1_cpointer_int64(this, storage, ptr, d1)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        type(c_ptr), dimension(:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1])
    end subroutine secure_pointer_rank1_cpointer_int64

    subroutine secure_pointer_rank2_cpointer(this, storage, ptr, d1, d2)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        type(c_ptr), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2])
    end subroutine secure_pointer_rank2_cpointer

    subroutine secure_pointer_rank2_cpointer_int64(this, storage, ptr, d1, d2)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        type(c_ptr), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2])
    end subroutine secure_pointer_rank2_cpointer_int64

    subroutine secure_pointer_rank3_cpointer(this, storage, ptr, d1, d2, d3)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        type(c_ptr), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2, d3

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3])
    end subroutine secure_pointer_rank3_cpointer

    subroutine secure_pointer_rank3_cpointer_int64(this, storage, ptr, d1, d2, d3)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        type(c_ptr), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2, d3

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3])
    end subroutine secure_pointer_rank3_cpointer_int64

    subroutine secure_pointer_rank4_cpointer(this, storage, ptr, d1, d2, d3, d4)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        type(c_ptr), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2, d3, d4

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4])
    end subroutine secure_pointer_rank4_cpointer

    subroutine secure_pointer_rank4_cpointer_int64(this, storage, ptr, d1, d2, d3, d4)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        type(c_ptr), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2, d3, d4

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4])
    end subroutine secure_pointer_rank4_cpointer_int64

    subroutine secure_pointer_rank5_cpointer(this, storage, ptr, d1, d2, d3, d4, d5)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        type(c_ptr), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer, intent(in) :: d1, d2, d3, d4, d5

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4, d5])
    end subroutine secure_pointer_rank5_cpointer

    subroutine secure_pointer_rank5_cpointer_int64(this, storage, ptr, d1, d2, d3, d4, d5)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        type(c_ptr), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        integer(int64), intent(in) :: d1, d2, d3, d4, d5

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[d1, d2, d3, d4, d5])
    end subroutine secure_pointer_rank5_cpointer_int64

    subroutine secure_pointer_cpointer(this, storage, ptr)
        class(intrinsic_pointer_builder), intent(in) :: this
        class(host_storage), intent(in) :: storage
        type(c_ptr), intent(inout) :: ptr

        ptr = storage%get_data_pointer()
    end subroutine secure_pointer_cpointer
end module intrinsic_pointer_builder_module
