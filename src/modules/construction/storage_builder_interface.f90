! Auto-generated. DO NOT MODIFY!
module storage_builder_interface
    use, intrinsic :: iso_fortran_env, only : &
            int64, &
            real64, &
            real32, &
            int32, &
            int16, &
            int8
    use, intrinsic :: iso_c_binding, only : &
            c_ptr
    use :: util_api, only : &
            string, &
            dictionary, &
            dictionary_converter
    use :: memory_api, only : &
            data_storage
    use :: storage_builder_factory_module, only : &
            create_storage_builder
    use :: storage_builder_module, only : &
            storage_builder
    use :: scratch_buffer_module, only : &
            scratch_buffer

    implicit none
    private

    public :: allocate_and_create_storage
    public :: create_storage
    public :: allocate_and_create_storage_in_scratch
    public :: create_storage_in_scratch
    public :: allocate_and_copy_storage
    public :: copy_storage
    public :: allocate_and_copy_storage_to_scratch
    public :: copy_storage_to_scratch
    public :: allocate_and_point_to_storage
    public :: point_to_storage
    public :: copy_storage_from_c_ptr
    public :: copy_storage_to_scratch_from_c_ptr

    interface allocate_and_create_storage
        module procedure allocate_and_create_from_size
    end interface allocate_and_create_storage

    interface create_storage
        module procedure create_from_size
    end interface create_storage

    interface allocate_and_create_storage_in_scratch
        module procedure allocate_and_create_in_scratch_from_size
    end interface allocate_and_create_storage_in_scratch

    interface create_storage_in_scratch
        module procedure create_in_scratch_from_size
    end interface create_storage_in_scratch

    interface allocate_and_copy_storage
        module procedure allocate_and_copy_from_storage
        module procedure allocate_and_copy_from_complex128_rank0
        module procedure allocate_and_copy_from_complex128_rank1
        module procedure allocate_and_copy_from_complex128_rank2
        module procedure allocate_and_copy_from_complex128_rank3
        module procedure allocate_and_copy_from_complex128_rank4
        module procedure allocate_and_copy_from_complex128_rank5
        module procedure allocate_and_copy_from_complex64_rank0
        module procedure allocate_and_copy_from_complex64_rank1
        module procedure allocate_and_copy_from_complex64_rank2
        module procedure allocate_and_copy_from_complex64_rank3
        module procedure allocate_and_copy_from_complex64_rank4
        module procedure allocate_and_copy_from_complex64_rank5
        module procedure allocate_and_copy_from_real64_rank0
        module procedure allocate_and_copy_from_real64_rank1
        module procedure allocate_and_copy_from_real64_rank2
        module procedure allocate_and_copy_from_real64_rank3
        module procedure allocate_and_copy_from_real64_rank4
        module procedure allocate_and_copy_from_real64_rank5
        module procedure allocate_and_copy_from_real32_rank0
        module procedure allocate_and_copy_from_real32_rank1
        module procedure allocate_and_copy_from_real32_rank2
        module procedure allocate_and_copy_from_real32_rank3
        module procedure allocate_and_copy_from_real32_rank4
        module procedure allocate_and_copy_from_real32_rank5
        module procedure allocate_and_copy_from_int64_rank0
        module procedure allocate_and_copy_from_int64_rank1
        module procedure allocate_and_copy_from_int64_rank2
        module procedure allocate_and_copy_from_int64_rank3
        module procedure allocate_and_copy_from_int64_rank4
        module procedure allocate_and_copy_from_int64_rank5
        module procedure allocate_and_copy_from_int32_rank0
        module procedure allocate_and_copy_from_int32_rank1
        module procedure allocate_and_copy_from_int32_rank2
        module procedure allocate_and_copy_from_int32_rank3
        module procedure allocate_and_copy_from_int32_rank4
        module procedure allocate_and_copy_from_int32_rank5
        module procedure allocate_and_copy_from_int16_rank0
        module procedure allocate_and_copy_from_int16_rank1
        module procedure allocate_and_copy_from_int16_rank2
        module procedure allocate_and_copy_from_int16_rank3
        module procedure allocate_and_copy_from_int16_rank4
        module procedure allocate_and_copy_from_int16_rank5
        module procedure allocate_and_copy_from_int8_rank0
        module procedure allocate_and_copy_from_int8_rank1
        module procedure allocate_and_copy_from_int8_rank2
        module procedure allocate_and_copy_from_int8_rank3
        module procedure allocate_and_copy_from_int8_rank4
        module procedure allocate_and_copy_from_int8_rank5
    end interface allocate_and_copy_storage

    interface copy_storage
        module procedure copy_from_storage
        module procedure copy_from_complex128_rank0
        module procedure copy_from_complex128_rank1
        module procedure copy_from_complex128_rank2
        module procedure copy_from_complex128_rank3
        module procedure copy_from_complex128_rank4
        module procedure copy_from_complex128_rank5
        module procedure copy_from_complex64_rank0
        module procedure copy_from_complex64_rank1
        module procedure copy_from_complex64_rank2
        module procedure copy_from_complex64_rank3
        module procedure copy_from_complex64_rank4
        module procedure copy_from_complex64_rank5
        module procedure copy_from_real64_rank0
        module procedure copy_from_real64_rank1
        module procedure copy_from_real64_rank2
        module procedure copy_from_real64_rank3
        module procedure copy_from_real64_rank4
        module procedure copy_from_real64_rank5
        module procedure copy_from_real32_rank0
        module procedure copy_from_real32_rank1
        module procedure copy_from_real32_rank2
        module procedure copy_from_real32_rank3
        module procedure copy_from_real32_rank4
        module procedure copy_from_real32_rank5
        module procedure copy_from_int64_rank0
        module procedure copy_from_int64_rank1
        module procedure copy_from_int64_rank2
        module procedure copy_from_int64_rank3
        module procedure copy_from_int64_rank4
        module procedure copy_from_int64_rank5
        module procedure copy_from_int32_rank0
        module procedure copy_from_int32_rank1
        module procedure copy_from_int32_rank2
        module procedure copy_from_int32_rank3
        module procedure copy_from_int32_rank4
        module procedure copy_from_int32_rank5
        module procedure copy_from_int16_rank0
        module procedure copy_from_int16_rank1
        module procedure copy_from_int16_rank2
        module procedure copy_from_int16_rank3
        module procedure copy_from_int16_rank4
        module procedure copy_from_int16_rank5
        module procedure copy_from_int8_rank0
        module procedure copy_from_int8_rank1
        module procedure copy_from_int8_rank2
        module procedure copy_from_int8_rank3
        module procedure copy_from_int8_rank4
        module procedure copy_from_int8_rank5
    end interface copy_storage

    interface allocate_and_copy_storage_to_scratch
        module procedure allocate_and_copy_to_scratch_from_storage
        module procedure allocate_and_copy_to_scratch_from_complex128_rank0
        module procedure allocate_and_copy_to_scratch_from_complex128_rank1
        module procedure allocate_and_copy_to_scratch_from_complex128_rank2
        module procedure allocate_and_copy_to_scratch_from_complex128_rank3
        module procedure allocate_and_copy_to_scratch_from_complex128_rank4
        module procedure allocate_and_copy_to_scratch_from_complex128_rank5
        module procedure allocate_and_copy_to_scratch_from_complex64_rank0
        module procedure allocate_and_copy_to_scratch_from_complex64_rank1
        module procedure allocate_and_copy_to_scratch_from_complex64_rank2
        module procedure allocate_and_copy_to_scratch_from_complex64_rank3
        module procedure allocate_and_copy_to_scratch_from_complex64_rank4
        module procedure allocate_and_copy_to_scratch_from_complex64_rank5
        module procedure allocate_and_copy_to_scratch_from_real64_rank0
        module procedure allocate_and_copy_to_scratch_from_real64_rank1
        module procedure allocate_and_copy_to_scratch_from_real64_rank2
        module procedure allocate_and_copy_to_scratch_from_real64_rank3
        module procedure allocate_and_copy_to_scratch_from_real64_rank4
        module procedure allocate_and_copy_to_scratch_from_real64_rank5
        module procedure allocate_and_copy_to_scratch_from_real32_rank0
        module procedure allocate_and_copy_to_scratch_from_real32_rank1
        module procedure allocate_and_copy_to_scratch_from_real32_rank2
        module procedure allocate_and_copy_to_scratch_from_real32_rank3
        module procedure allocate_and_copy_to_scratch_from_real32_rank4
        module procedure allocate_and_copy_to_scratch_from_real32_rank5
        module procedure allocate_and_copy_to_scratch_from_int64_rank0
        module procedure allocate_and_copy_to_scratch_from_int64_rank1
        module procedure allocate_and_copy_to_scratch_from_int64_rank2
        module procedure allocate_and_copy_to_scratch_from_int64_rank3
        module procedure allocate_and_copy_to_scratch_from_int64_rank4
        module procedure allocate_and_copy_to_scratch_from_int64_rank5
        module procedure allocate_and_copy_to_scratch_from_int32_rank0
        module procedure allocate_and_copy_to_scratch_from_int32_rank1
        module procedure allocate_and_copy_to_scratch_from_int32_rank2
        module procedure allocate_and_copy_to_scratch_from_int32_rank3
        module procedure allocate_and_copy_to_scratch_from_int32_rank4
        module procedure allocate_and_copy_to_scratch_from_int32_rank5
        module procedure allocate_and_copy_to_scratch_from_int16_rank0
        module procedure allocate_and_copy_to_scratch_from_int16_rank1
        module procedure allocate_and_copy_to_scratch_from_int16_rank2
        module procedure allocate_and_copy_to_scratch_from_int16_rank3
        module procedure allocate_and_copy_to_scratch_from_int16_rank4
        module procedure allocate_and_copy_to_scratch_from_int16_rank5
        module procedure allocate_and_copy_to_scratch_from_int8_rank0
        module procedure allocate_and_copy_to_scratch_from_int8_rank1
        module procedure allocate_and_copy_to_scratch_from_int8_rank2
        module procedure allocate_and_copy_to_scratch_from_int8_rank3
        module procedure allocate_and_copy_to_scratch_from_int8_rank4
        module procedure allocate_and_copy_to_scratch_from_int8_rank5
    end interface allocate_and_copy_storage_to_scratch

    interface copy_storage_to_scratch
        module procedure copy_to_scratch_from_storage
        module procedure copy_to_scratch_from_complex128_rank0
        module procedure copy_to_scratch_from_complex128_rank1
        module procedure copy_to_scratch_from_complex128_rank2
        module procedure copy_to_scratch_from_complex128_rank3
        module procedure copy_to_scratch_from_complex128_rank4
        module procedure copy_to_scratch_from_complex128_rank5
        module procedure copy_to_scratch_from_complex64_rank0
        module procedure copy_to_scratch_from_complex64_rank1
        module procedure copy_to_scratch_from_complex64_rank2
        module procedure copy_to_scratch_from_complex64_rank3
        module procedure copy_to_scratch_from_complex64_rank4
        module procedure copy_to_scratch_from_complex64_rank5
        module procedure copy_to_scratch_from_real64_rank0
        module procedure copy_to_scratch_from_real64_rank1
        module procedure copy_to_scratch_from_real64_rank2
        module procedure copy_to_scratch_from_real64_rank3
        module procedure copy_to_scratch_from_real64_rank4
        module procedure copy_to_scratch_from_real64_rank5
        module procedure copy_to_scratch_from_real32_rank0
        module procedure copy_to_scratch_from_real32_rank1
        module procedure copy_to_scratch_from_real32_rank2
        module procedure copy_to_scratch_from_real32_rank3
        module procedure copy_to_scratch_from_real32_rank4
        module procedure copy_to_scratch_from_real32_rank5
        module procedure copy_to_scratch_from_int64_rank0
        module procedure copy_to_scratch_from_int64_rank1
        module procedure copy_to_scratch_from_int64_rank2
        module procedure copy_to_scratch_from_int64_rank3
        module procedure copy_to_scratch_from_int64_rank4
        module procedure copy_to_scratch_from_int64_rank5
        module procedure copy_to_scratch_from_int32_rank0
        module procedure copy_to_scratch_from_int32_rank1
        module procedure copy_to_scratch_from_int32_rank2
        module procedure copy_to_scratch_from_int32_rank3
        module procedure copy_to_scratch_from_int32_rank4
        module procedure copy_to_scratch_from_int32_rank5
        module procedure copy_to_scratch_from_int16_rank0
        module procedure copy_to_scratch_from_int16_rank1
        module procedure copy_to_scratch_from_int16_rank2
        module procedure copy_to_scratch_from_int16_rank3
        module procedure copy_to_scratch_from_int16_rank4
        module procedure copy_to_scratch_from_int16_rank5
        module procedure copy_to_scratch_from_int8_rank0
        module procedure copy_to_scratch_from_int8_rank1
        module procedure copy_to_scratch_from_int8_rank2
        module procedure copy_to_scratch_from_int8_rank3
        module procedure copy_to_scratch_from_int8_rank4
        module procedure copy_to_scratch_from_int8_rank5
    end interface copy_storage_to_scratch

    interface allocate_and_point_to_storage
        module procedure allocate_and_point_to_from_storage
        module procedure allocate_and_point_to_from_complex128_rank0
        module procedure allocate_and_point_to_from_complex128_rank1
        module procedure allocate_and_point_to_from_complex128_rank2
        module procedure allocate_and_point_to_from_complex128_rank3
        module procedure allocate_and_point_to_from_complex128_rank4
        module procedure allocate_and_point_to_from_complex128_rank5
        module procedure allocate_and_point_to_from_complex64_rank0
        module procedure allocate_and_point_to_from_complex64_rank1
        module procedure allocate_and_point_to_from_complex64_rank2
        module procedure allocate_and_point_to_from_complex64_rank3
        module procedure allocate_and_point_to_from_complex64_rank4
        module procedure allocate_and_point_to_from_complex64_rank5
        module procedure allocate_and_point_to_from_real64_rank0
        module procedure allocate_and_point_to_from_real64_rank1
        module procedure allocate_and_point_to_from_real64_rank2
        module procedure allocate_and_point_to_from_real64_rank3
        module procedure allocate_and_point_to_from_real64_rank4
        module procedure allocate_and_point_to_from_real64_rank5
        module procedure allocate_and_point_to_from_real32_rank0
        module procedure allocate_and_point_to_from_real32_rank1
        module procedure allocate_and_point_to_from_real32_rank2
        module procedure allocate_and_point_to_from_real32_rank3
        module procedure allocate_and_point_to_from_real32_rank4
        module procedure allocate_and_point_to_from_real32_rank5
        module procedure allocate_and_point_to_from_int64_rank0
        module procedure allocate_and_point_to_from_int64_rank1
        module procedure allocate_and_point_to_from_int64_rank2
        module procedure allocate_and_point_to_from_int64_rank3
        module procedure allocate_and_point_to_from_int64_rank4
        module procedure allocate_and_point_to_from_int64_rank5
        module procedure allocate_and_point_to_from_int32_rank0
        module procedure allocate_and_point_to_from_int32_rank1
        module procedure allocate_and_point_to_from_int32_rank2
        module procedure allocate_and_point_to_from_int32_rank3
        module procedure allocate_and_point_to_from_int32_rank4
        module procedure allocate_and_point_to_from_int32_rank5
        module procedure allocate_and_point_to_from_int16_rank0
        module procedure allocate_and_point_to_from_int16_rank1
        module procedure allocate_and_point_to_from_int16_rank2
        module procedure allocate_and_point_to_from_int16_rank3
        module procedure allocate_and_point_to_from_int16_rank4
        module procedure allocate_and_point_to_from_int16_rank5
        module procedure allocate_and_point_to_from_int8_rank0
        module procedure allocate_and_point_to_from_int8_rank1
        module procedure allocate_and_point_to_from_int8_rank2
        module procedure allocate_and_point_to_from_int8_rank3
        module procedure allocate_and_point_to_from_int8_rank4
        module procedure allocate_and_point_to_from_int8_rank5
    end interface allocate_and_point_to_storage

    interface point_to_storage
        module procedure point_to_from_storage
        module procedure point_to_from_complex128_rank0
        module procedure point_to_from_complex128_rank1
        module procedure point_to_from_complex128_rank2
        module procedure point_to_from_complex128_rank3
        module procedure point_to_from_complex128_rank4
        module procedure point_to_from_complex128_rank5
        module procedure point_to_from_complex64_rank0
        module procedure point_to_from_complex64_rank1
        module procedure point_to_from_complex64_rank2
        module procedure point_to_from_complex64_rank3
        module procedure point_to_from_complex64_rank4
        module procedure point_to_from_complex64_rank5
        module procedure point_to_from_real64_rank0
        module procedure point_to_from_real64_rank1
        module procedure point_to_from_real64_rank2
        module procedure point_to_from_real64_rank3
        module procedure point_to_from_real64_rank4
        module procedure point_to_from_real64_rank5
        module procedure point_to_from_real32_rank0
        module procedure point_to_from_real32_rank1
        module procedure point_to_from_real32_rank2
        module procedure point_to_from_real32_rank3
        module procedure point_to_from_real32_rank4
        module procedure point_to_from_real32_rank5
        module procedure point_to_from_int64_rank0
        module procedure point_to_from_int64_rank1
        module procedure point_to_from_int64_rank2
        module procedure point_to_from_int64_rank3
        module procedure point_to_from_int64_rank4
        module procedure point_to_from_int64_rank5
        module procedure point_to_from_int32_rank0
        module procedure point_to_from_int32_rank1
        module procedure point_to_from_int32_rank2
        module procedure point_to_from_int32_rank3
        module procedure point_to_from_int32_rank4
        module procedure point_to_from_int32_rank5
        module procedure point_to_from_int16_rank0
        module procedure point_to_from_int16_rank1
        module procedure point_to_from_int16_rank2
        module procedure point_to_from_int16_rank3
        module procedure point_to_from_int16_rank4
        module procedure point_to_from_int16_rank5
        module procedure point_to_from_int8_rank0
        module procedure point_to_from_int8_rank1
        module procedure point_to_from_int8_rank2
        module procedure point_to_from_int8_rank3
        module procedure point_to_from_int8_rank4
        module procedure point_to_from_int8_rank5
    end interface point_to_storage
contains
    subroutine allocate_and_create_from_size(storage, number_of_bytes, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: storage
        integer(int64), intent(in) :: number_of_bytes
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder
        type(dictionary_converter) :: converter

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_create(storage, number_of_bytes, &
                converter%to_logical("initialize", options, priorities, .true.))

        call builder%cleanup()
    end subroutine allocate_and_create_from_size

    subroutine create_from_size(storage, number_of_bytes, memory_type, options, priorities)
        class(data_storage), intent(inout) :: storage
        integer(int64), intent(in) :: number_of_bytes
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder
        type(dictionary_converter) :: converter

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%create(storage, number_of_bytes, &
                converter%to_logical("initialize", options, priorities, .true.))

        call builder%cleanup()
    end subroutine create_from_size

    subroutine allocate_and_create_in_scratch_from_size(storage, scratch, number_of_bytes, initialize)
        class(data_storage), allocatable, intent(inout) :: storage
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), intent(in) :: number_of_bytes
        logical, intent(in), optional :: initialize

        type(storage_builder) :: builder
        call builder%allocate_and_create_in_scratch(storage, scratch, number_of_bytes, initialize)
        call builder%cleanup()
    end subroutine allocate_and_create_in_scratch_from_size

    subroutine create_in_scratch_from_size(storage, scratch, number_of_bytes, initialize)
        class(data_storage), intent(inout) :: storage
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), intent(in) :: number_of_bytes
        logical, intent(in), optional :: initialize

        type(storage_builder) :: builder
        call builder%create_in_scratch(storage, scratch, number_of_bytes, initialize)
        call builder%cleanup()
    end subroutine create_in_scratch_from_size

    subroutine allocate_and_copy_from_storage(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        class(data_storage), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_storage

    subroutine copy_from_storage(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        class(data_storage), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_storage

    subroutine allocate_and_copy_from_complex128_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_complex128_rank0

    subroutine copy_from_complex128_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_complex128_rank0

    subroutine allocate_and_copy_from_complex128_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_complex128_rank1

    subroutine copy_from_complex128_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_complex128_rank1

    subroutine allocate_and_copy_from_complex128_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_complex128_rank2

    subroutine copy_from_complex128_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_complex128_rank2

    subroutine allocate_and_copy_from_complex128_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_complex128_rank3

    subroutine copy_from_complex128_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_complex128_rank3

    subroutine allocate_and_copy_from_complex128_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_complex128_rank4

    subroutine copy_from_complex128_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_complex128_rank4

    subroutine allocate_and_copy_from_complex128_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_complex128_rank5

    subroutine copy_from_complex128_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_complex128_rank5

    subroutine allocate_and_copy_from_complex64_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_complex64_rank0

    subroutine copy_from_complex64_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_complex64_rank0

    subroutine allocate_and_copy_from_complex64_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_complex64_rank1

    subroutine copy_from_complex64_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_complex64_rank1

    subroutine allocate_and_copy_from_complex64_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_complex64_rank2

    subroutine copy_from_complex64_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_complex64_rank2

    subroutine allocate_and_copy_from_complex64_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_complex64_rank3

    subroutine copy_from_complex64_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_complex64_rank3

    subroutine allocate_and_copy_from_complex64_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_complex64_rank4

    subroutine copy_from_complex64_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_complex64_rank4

    subroutine allocate_and_copy_from_complex64_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_complex64_rank5

    subroutine copy_from_complex64_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_complex64_rank5

    subroutine allocate_and_copy_from_real64_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_real64_rank0

    subroutine copy_from_real64_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_real64_rank0

    subroutine allocate_and_copy_from_real64_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_real64_rank1

    subroutine copy_from_real64_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_real64_rank1

    subroutine allocate_and_copy_from_real64_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_real64_rank2

    subroutine copy_from_real64_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_real64_rank2

    subroutine allocate_and_copy_from_real64_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_real64_rank3

    subroutine copy_from_real64_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_real64_rank3

    subroutine allocate_and_copy_from_real64_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_real64_rank4

    subroutine copy_from_real64_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_real64_rank4

    subroutine allocate_and_copy_from_real64_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_real64_rank5

    subroutine copy_from_real64_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_real64_rank5

    subroutine allocate_and_copy_from_real32_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_real32_rank0

    subroutine copy_from_real32_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_real32_rank0

    subroutine allocate_and_copy_from_real32_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_real32_rank1

    subroutine copy_from_real32_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_real32_rank1

    subroutine allocate_and_copy_from_real32_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_real32_rank2

    subroutine copy_from_real32_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_real32_rank2

    subroutine allocate_and_copy_from_real32_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_real32_rank3

    subroutine copy_from_real32_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_real32_rank3

    subroutine allocate_and_copy_from_real32_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_real32_rank4

    subroutine copy_from_real32_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_real32_rank4

    subroutine allocate_and_copy_from_real32_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_real32_rank5

    subroutine copy_from_real32_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_real32_rank5

    subroutine allocate_and_copy_from_int64_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int64_rank0

    subroutine copy_from_int64_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int64_rank0

    subroutine allocate_and_copy_from_int64_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int64_rank1

    subroutine copy_from_int64_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int64_rank1

    subroutine allocate_and_copy_from_int64_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int64_rank2

    subroutine copy_from_int64_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int64_rank2

    subroutine allocate_and_copy_from_int64_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int64_rank3

    subroutine copy_from_int64_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int64_rank3

    subroutine allocate_and_copy_from_int64_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int64_rank4

    subroutine copy_from_int64_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int64_rank4

    subroutine allocate_and_copy_from_int64_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int64_rank5

    subroutine copy_from_int64_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int64_rank5

    subroutine allocate_and_copy_from_int32_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int32_rank0

    subroutine copy_from_int32_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int32_rank0

    subroutine allocate_and_copy_from_int32_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int32_rank1

    subroutine copy_from_int32_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int32_rank1

    subroutine allocate_and_copy_from_int32_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int32_rank2

    subroutine copy_from_int32_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int32_rank2

    subroutine allocate_and_copy_from_int32_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int32_rank3

    subroutine copy_from_int32_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int32_rank3

    subroutine allocate_and_copy_from_int32_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int32_rank4

    subroutine copy_from_int32_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int32_rank4

    subroutine allocate_and_copy_from_int32_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int32_rank5

    subroutine copy_from_int32_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int32_rank5

    subroutine allocate_and_copy_from_int16_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int16_rank0

    subroutine copy_from_int16_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int16), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int16_rank0

    subroutine allocate_and_copy_from_int16_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int16_rank1

    subroutine copy_from_int16_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int16_rank1

    subroutine allocate_and_copy_from_int16_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int16_rank2

    subroutine copy_from_int16_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int16_rank2

    subroutine allocate_and_copy_from_int16_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int16_rank3

    subroutine copy_from_int16_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int16_rank3

    subroutine allocate_and_copy_from_int16_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int16_rank4

    subroutine copy_from_int16_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int16_rank4

    subroutine allocate_and_copy_from_int16_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int16_rank5

    subroutine copy_from_int16_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int16_rank5

    subroutine allocate_and_copy_from_int8_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int8_rank0

    subroutine copy_from_int8_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int8), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int8_rank0

    subroutine allocate_and_copy_from_int8_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int8_rank1

    subroutine copy_from_int8_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int8_rank1

    subroutine allocate_and_copy_from_int8_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int8_rank2

    subroutine copy_from_int8_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int8_rank2

    subroutine allocate_and_copy_from_int8_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int8_rank3

    subroutine copy_from_int8_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int8_rank3

    subroutine allocate_and_copy_from_int8_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int8_rank4

    subroutine copy_from_int8_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int8_rank4

    subroutine allocate_and_copy_from_int8_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_from_int8_rank5

    subroutine copy_from_int8_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy(dst, src)

        call builder%cleanup()
    end subroutine copy_from_int8_rank5

    subroutine allocate_and_copy_to_scratch_from_storage(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        class(data_storage), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_storage

    subroutine copy_to_scratch_from_storage(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        class(data_storage), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_storage

    subroutine allocate_and_copy_to_scratch_from_complex128_rank0(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_complex128_rank0

    subroutine copy_to_scratch_from_complex128_rank0(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_complex128_rank0

    subroutine allocate_and_copy_to_scratch_from_complex128_rank1(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_complex128_rank1

    subroutine copy_to_scratch_from_complex128_rank1(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_complex128_rank1

    subroutine allocate_and_copy_to_scratch_from_complex128_rank2(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_complex128_rank2

    subroutine copy_to_scratch_from_complex128_rank2(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_complex128_rank2

    subroutine allocate_and_copy_to_scratch_from_complex128_rank3(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_complex128_rank3

    subroutine copy_to_scratch_from_complex128_rank3(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_complex128_rank3

    subroutine allocate_and_copy_to_scratch_from_complex128_rank4(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_complex128_rank4

    subroutine copy_to_scratch_from_complex128_rank4(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_complex128_rank4

    subroutine allocate_and_copy_to_scratch_from_complex128_rank5(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_complex128_rank5

    subroutine copy_to_scratch_from_complex128_rank5(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_complex128_rank5

    subroutine allocate_and_copy_to_scratch_from_complex64_rank0(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_complex64_rank0

    subroutine copy_to_scratch_from_complex64_rank0(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_complex64_rank0

    subroutine allocate_and_copy_to_scratch_from_complex64_rank1(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_complex64_rank1

    subroutine copy_to_scratch_from_complex64_rank1(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_complex64_rank1

    subroutine allocate_and_copy_to_scratch_from_complex64_rank2(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_complex64_rank2

    subroutine copy_to_scratch_from_complex64_rank2(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_complex64_rank2

    subroutine allocate_and_copy_to_scratch_from_complex64_rank3(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_complex64_rank3

    subroutine copy_to_scratch_from_complex64_rank3(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_complex64_rank3

    subroutine allocate_and_copy_to_scratch_from_complex64_rank4(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_complex64_rank4

    subroutine copy_to_scratch_from_complex64_rank4(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_complex64_rank4

    subroutine allocate_and_copy_to_scratch_from_complex64_rank5(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_complex64_rank5

    subroutine copy_to_scratch_from_complex64_rank5(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_complex64_rank5

    subroutine allocate_and_copy_to_scratch_from_real64_rank0(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_real64_rank0

    subroutine copy_to_scratch_from_real64_rank0(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_real64_rank0

    subroutine allocate_and_copy_to_scratch_from_real64_rank1(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_real64_rank1

    subroutine copy_to_scratch_from_real64_rank1(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_real64_rank1

    subroutine allocate_and_copy_to_scratch_from_real64_rank2(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_real64_rank2

    subroutine copy_to_scratch_from_real64_rank2(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_real64_rank2

    subroutine allocate_and_copy_to_scratch_from_real64_rank3(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_real64_rank3

    subroutine copy_to_scratch_from_real64_rank3(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_real64_rank3

    subroutine allocate_and_copy_to_scratch_from_real64_rank4(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_real64_rank4

    subroutine copy_to_scratch_from_real64_rank4(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_real64_rank4

    subroutine allocate_and_copy_to_scratch_from_real64_rank5(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_real64_rank5

    subroutine copy_to_scratch_from_real64_rank5(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_real64_rank5

    subroutine allocate_and_copy_to_scratch_from_real32_rank0(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_real32_rank0

    subroutine copy_to_scratch_from_real32_rank0(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_real32_rank0

    subroutine allocate_and_copy_to_scratch_from_real32_rank1(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_real32_rank1

    subroutine copy_to_scratch_from_real32_rank1(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_real32_rank1

    subroutine allocate_and_copy_to_scratch_from_real32_rank2(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_real32_rank2

    subroutine copy_to_scratch_from_real32_rank2(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_real32_rank2

    subroutine allocate_and_copy_to_scratch_from_real32_rank3(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_real32_rank3

    subroutine copy_to_scratch_from_real32_rank3(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_real32_rank3

    subroutine allocate_and_copy_to_scratch_from_real32_rank4(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_real32_rank4

    subroutine copy_to_scratch_from_real32_rank4(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_real32_rank4

    subroutine allocate_and_copy_to_scratch_from_real32_rank5(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_real32_rank5

    subroutine copy_to_scratch_from_real32_rank5(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_real32_rank5

    subroutine allocate_and_copy_to_scratch_from_int64_rank0(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int64_rank0

    subroutine copy_to_scratch_from_int64_rank0(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int64_rank0

    subroutine allocate_and_copy_to_scratch_from_int64_rank1(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int64_rank1

    subroutine copy_to_scratch_from_int64_rank1(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int64_rank1

    subroutine allocate_and_copy_to_scratch_from_int64_rank2(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int64_rank2

    subroutine copy_to_scratch_from_int64_rank2(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int64_rank2

    subroutine allocate_and_copy_to_scratch_from_int64_rank3(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int64_rank3

    subroutine copy_to_scratch_from_int64_rank3(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int64_rank3

    subroutine allocate_and_copy_to_scratch_from_int64_rank4(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int64_rank4

    subroutine copy_to_scratch_from_int64_rank4(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int64_rank4

    subroutine allocate_and_copy_to_scratch_from_int64_rank5(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int64_rank5

    subroutine copy_to_scratch_from_int64_rank5(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int64_rank5

    subroutine allocate_and_copy_to_scratch_from_int32_rank0(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int32_rank0

    subroutine copy_to_scratch_from_int32_rank0(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int32_rank0

    subroutine allocate_and_copy_to_scratch_from_int32_rank1(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int32_rank1

    subroutine copy_to_scratch_from_int32_rank1(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int32_rank1

    subroutine allocate_and_copy_to_scratch_from_int32_rank2(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int32_rank2

    subroutine copy_to_scratch_from_int32_rank2(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int32_rank2

    subroutine allocate_and_copy_to_scratch_from_int32_rank3(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int32_rank3

    subroutine copy_to_scratch_from_int32_rank3(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int32_rank3

    subroutine allocate_and_copy_to_scratch_from_int32_rank4(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int32_rank4

    subroutine copy_to_scratch_from_int32_rank4(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int32_rank4

    subroutine allocate_and_copy_to_scratch_from_int32_rank5(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int32_rank5

    subroutine copy_to_scratch_from_int32_rank5(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int32_rank5

    subroutine allocate_and_copy_to_scratch_from_int16_rank0(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int16_rank0

    subroutine copy_to_scratch_from_int16_rank0(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int16_rank0

    subroutine allocate_and_copy_to_scratch_from_int16_rank1(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int16_rank1

    subroutine copy_to_scratch_from_int16_rank1(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int16_rank1

    subroutine allocate_and_copy_to_scratch_from_int16_rank2(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int16_rank2

    subroutine copy_to_scratch_from_int16_rank2(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int16_rank2

    subroutine allocate_and_copy_to_scratch_from_int16_rank3(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int16_rank3

    subroutine copy_to_scratch_from_int16_rank3(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int16_rank3

    subroutine allocate_and_copy_to_scratch_from_int16_rank4(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int16_rank4

    subroutine copy_to_scratch_from_int16_rank4(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int16_rank4

    subroutine allocate_and_copy_to_scratch_from_int16_rank5(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int16_rank5

    subroutine copy_to_scratch_from_int16_rank5(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int16_rank5

    subroutine allocate_and_copy_to_scratch_from_int8_rank0(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int8_rank0

    subroutine copy_to_scratch_from_int8_rank0(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int8_rank0

    subroutine allocate_and_copy_to_scratch_from_int8_rank1(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int8_rank1

    subroutine copy_to_scratch_from_int8_rank1(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int8_rank1

    subroutine allocate_and_copy_to_scratch_from_int8_rank2(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int8_rank2

    subroutine copy_to_scratch_from_int8_rank2(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int8_rank2

    subroutine allocate_and_copy_to_scratch_from_int8_rank3(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int8_rank3

    subroutine copy_to_scratch_from_int8_rank3(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int8_rank3

    subroutine allocate_and_copy_to_scratch_from_int8_rank4(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int8_rank4

    subroutine copy_to_scratch_from_int8_rank4(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int8_rank4

    subroutine allocate_and_copy_to_scratch_from_int8_rank5(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine allocate_and_copy_to_scratch_from_int8_rank5

    subroutine copy_to_scratch_from_int8_rank5(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_to_scratch_from_int8_rank5

    subroutine allocate_and_point_to_from_storage(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        class(data_storage), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_storage

    subroutine point_to_from_storage(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        class(data_storage), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_storage

    subroutine allocate_and_point_to_from_complex128_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_complex128_rank0

    subroutine point_to_from_complex128_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_complex128_rank0

    subroutine allocate_and_point_to_from_complex128_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_complex128_rank1

    subroutine point_to_from_complex128_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_complex128_rank1

    subroutine allocate_and_point_to_from_complex128_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_complex128_rank2

    subroutine point_to_from_complex128_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_complex128_rank2

    subroutine allocate_and_point_to_from_complex128_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_complex128_rank3

    subroutine point_to_from_complex128_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_complex128_rank3

    subroutine allocate_and_point_to_from_complex128_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_complex128_rank4

    subroutine point_to_from_complex128_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_complex128_rank4

    subroutine allocate_and_point_to_from_complex128_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_complex128_rank5

    subroutine point_to_from_complex128_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_complex128_rank5

    subroutine allocate_and_point_to_from_complex64_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_complex64_rank0

    subroutine point_to_from_complex64_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_complex64_rank0

    subroutine allocate_and_point_to_from_complex64_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_complex64_rank1

    subroutine point_to_from_complex64_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_complex64_rank1

    subroutine allocate_and_point_to_from_complex64_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_complex64_rank2

    subroutine point_to_from_complex64_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_complex64_rank2

    subroutine allocate_and_point_to_from_complex64_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_complex64_rank3

    subroutine point_to_from_complex64_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_complex64_rank3

    subroutine allocate_and_point_to_from_complex64_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_complex64_rank4

    subroutine point_to_from_complex64_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_complex64_rank4

    subroutine allocate_and_point_to_from_complex64_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_complex64_rank5

    subroutine point_to_from_complex64_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_complex64_rank5

    subroutine allocate_and_point_to_from_real64_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_real64_rank0

    subroutine point_to_from_real64_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_real64_rank0

    subroutine allocate_and_point_to_from_real64_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_real64_rank1

    subroutine point_to_from_real64_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_real64_rank1

    subroutine allocate_and_point_to_from_real64_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_real64_rank2

    subroutine point_to_from_real64_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_real64_rank2

    subroutine allocate_and_point_to_from_real64_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_real64_rank3

    subroutine point_to_from_real64_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_real64_rank3

    subroutine allocate_and_point_to_from_real64_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_real64_rank4

    subroutine point_to_from_real64_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_real64_rank4

    subroutine allocate_and_point_to_from_real64_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_real64_rank5

    subroutine point_to_from_real64_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_real64_rank5

    subroutine allocate_and_point_to_from_real32_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_real32_rank0

    subroutine point_to_from_real32_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_real32_rank0

    subroutine allocate_and_point_to_from_real32_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_real32_rank1

    subroutine point_to_from_real32_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_real32_rank1

    subroutine allocate_and_point_to_from_real32_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_real32_rank2

    subroutine point_to_from_real32_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_real32_rank2

    subroutine allocate_and_point_to_from_real32_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_real32_rank3

    subroutine point_to_from_real32_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_real32_rank3

    subroutine allocate_and_point_to_from_real32_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_real32_rank4

    subroutine point_to_from_real32_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_real32_rank4

    subroutine allocate_and_point_to_from_real32_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_real32_rank5

    subroutine point_to_from_real32_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_real32_rank5

    subroutine allocate_and_point_to_from_int64_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int64_rank0

    subroutine point_to_from_int64_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int64), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int64_rank0

    subroutine allocate_and_point_to_from_int64_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int64_rank1

    subroutine point_to_from_int64_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int64_rank1

    subroutine allocate_and_point_to_from_int64_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int64_rank2

    subroutine point_to_from_int64_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int64_rank2

    subroutine allocate_and_point_to_from_int64_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int64_rank3

    subroutine point_to_from_int64_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int64_rank3

    subroutine allocate_and_point_to_from_int64_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int64_rank4

    subroutine point_to_from_int64_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int64_rank4

    subroutine allocate_and_point_to_from_int64_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int64_rank5

    subroutine point_to_from_int64_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int64_rank5

    subroutine allocate_and_point_to_from_int32_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int32_rank0

    subroutine point_to_from_int32_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int32), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int32_rank0

    subroutine allocate_and_point_to_from_int32_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int32_rank1

    subroutine point_to_from_int32_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int32_rank1

    subroutine allocate_and_point_to_from_int32_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int32_rank2

    subroutine point_to_from_int32_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int32_rank2

    subroutine allocate_and_point_to_from_int32_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int32_rank3

    subroutine point_to_from_int32_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int32_rank3

    subroutine allocate_and_point_to_from_int32_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int32_rank4

    subroutine point_to_from_int32_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int32_rank4

    subroutine allocate_and_point_to_from_int32_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int32_rank5

    subroutine point_to_from_int32_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int32_rank5

    subroutine allocate_and_point_to_from_int16_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int16_rank0

    subroutine point_to_from_int16_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int16), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int16_rank0

    subroutine allocate_and_point_to_from_int16_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int16_rank1

    subroutine point_to_from_int16_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int16_rank1

    subroutine allocate_and_point_to_from_int16_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int16_rank2

    subroutine point_to_from_int16_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int16_rank2

    subroutine allocate_and_point_to_from_int16_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int16_rank3

    subroutine point_to_from_int16_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int16_rank3

    subroutine allocate_and_point_to_from_int16_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int16_rank4

    subroutine point_to_from_int16_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int16_rank4

    subroutine allocate_and_point_to_from_int16_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int16_rank5

    subroutine point_to_from_int16_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int16_rank5

    subroutine allocate_and_point_to_from_int8_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int8_rank0

    subroutine point_to_from_int8_rank0(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int8), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int8_rank0

    subroutine allocate_and_point_to_from_int8_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int8_rank1

    subroutine point_to_from_int8_rank1(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int8_rank1

    subroutine allocate_and_point_to_from_int8_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int8_rank2

    subroutine point_to_from_int8_rank2(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int8_rank2

    subroutine allocate_and_point_to_from_int8_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int8_rank3

    subroutine point_to_from_int8_rank3(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int8_rank3

    subroutine allocate_and_point_to_from_int8_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int8_rank4

    subroutine point_to_from_int8_rank4(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int8_rank4

    subroutine allocate_and_point_to_from_int8_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%allocate_and_point_to(dst, src)

        call builder%cleanup()
    end subroutine allocate_and_point_to_from_int8_rank5

    subroutine point_to_from_int8_rank5(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:,:,:,:,:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%point_to(dst, src)

        call builder%cleanup()
    end subroutine point_to_from_int8_rank5

    subroutine copy_storage_from_c_ptr(dst, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(c_ptr), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_c_ptr(dst, src)

        call builder%cleanup()
    end subroutine copy_storage_from_c_ptr

    subroutine copy_storage_to_scratch_from_c_ptr(dst, scratch, src, memory_type, options, priorities)
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        type(c_ptr), dimension(:), intent(in) :: src
        character(len=*), intent(in), optional :: memory_type
        type(dictionary), intent(in), optional :: options
        type(string), dimension(:), intent(in), optional :: priorities

        type(storage_builder) :: builder

        call create_storage_builder(builder, memory_type, options, priorities)
        call builder%copy_c_ptr_to_scratch(dst, scratch, src)

        call builder%cleanup()
    end subroutine copy_storage_to_scratch_from_c_ptr
end module storage_builder_interface
