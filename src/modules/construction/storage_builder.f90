! Auto-generated. DO NOT MODIFY!
module storage_builder_module
    use, intrinsic :: iso_fortran_env, only : &
            int64, &
            real64, &
            real32, &
            int32, &
            int16, &
            int8
    use, intrinsic :: iso_c_binding, only : &
            c_ptr, &
            c_intptr_t
    use :: memory_api, only : &
            data_builder, &
            data_storage, &
            memory_manager
    use :: concurrency_api, only : &
            stream
    use :: fortran_host_converter_module, only : &
            fortran_host_converter
    use :: scratch_buffer_module, only : &
            scratch_buffer

    implicit none
    private

    public :: storage_builder

    type :: storage_builder
        class(data_builder), allocatable :: builder
        type(fortran_host_converter) :: converter
    contains
        generic :: allocate_and_create => &
                allocate_and_create_from_size
        generic :: create => &
                create_from_size
        generic :: allocate_and_create_in_scratch => &
                allocate_and_create_in_scratch_from_size
        generic :: create_in_scratch => &
                create_in_scratch_from_size
        generic :: allocate_and_copy => &
                allocate_and_copy_from_storage, &
                allocate_and_copy_complex128_rank0, &
                allocate_and_copy_complex128_rank1, &
                allocate_and_copy_complex128_rank2, &
                allocate_and_copy_complex128_rank3, &
                allocate_and_copy_complex128_rank4, &
                allocate_and_copy_complex128_rank5, &
                allocate_and_copy_complex64_rank0, &
                allocate_and_copy_complex64_rank1, &
                allocate_and_copy_complex64_rank2, &
                allocate_and_copy_complex64_rank3, &
                allocate_and_copy_complex64_rank4, &
                allocate_and_copy_complex64_rank5, &
                allocate_and_copy_real64_rank0, &
                allocate_and_copy_real64_rank1, &
                allocate_and_copy_real64_rank2, &
                allocate_and_copy_real64_rank3, &
                allocate_and_copy_real64_rank4, &
                allocate_and_copy_real64_rank5, &
                allocate_and_copy_real32_rank0, &
                allocate_and_copy_real32_rank1, &
                allocate_and_copy_real32_rank2, &
                allocate_and_copy_real32_rank3, &
                allocate_and_copy_real32_rank4, &
                allocate_and_copy_real32_rank5, &
                allocate_and_copy_int64_rank0, &
                allocate_and_copy_int64_rank1, &
                allocate_and_copy_int64_rank2, &
                allocate_and_copy_int64_rank3, &
                allocate_and_copy_int64_rank4, &
                allocate_and_copy_int64_rank5, &
                allocate_and_copy_int32_rank0, &
                allocate_and_copy_int32_rank1, &
                allocate_and_copy_int32_rank2, &
                allocate_and_copy_int32_rank3, &
                allocate_and_copy_int32_rank4, &
                allocate_and_copy_int32_rank5, &
                allocate_and_copy_int16_rank0, &
                allocate_and_copy_int16_rank1, &
                allocate_and_copy_int16_rank2, &
                allocate_and_copy_int16_rank3, &
                allocate_and_copy_int16_rank4, &
                allocate_and_copy_int16_rank5, &
                allocate_and_copy_int8_rank0, &
                allocate_and_copy_int8_rank1, &
                allocate_and_copy_int8_rank2, &
                allocate_and_copy_int8_rank3, &
                allocate_and_copy_int8_rank4, &
                allocate_and_copy_int8_rank5
        generic :: copy => &
                copy_from_storage, &
                copy_complex128_rank0, &
                copy_complex128_rank1, &
                copy_complex128_rank2, &
                copy_complex128_rank3, &
                copy_complex128_rank4, &
                copy_complex128_rank5, &
                copy_complex64_rank0, &
                copy_complex64_rank1, &
                copy_complex64_rank2, &
                copy_complex64_rank3, &
                copy_complex64_rank4, &
                copy_complex64_rank5, &
                copy_real64_rank0, &
                copy_real64_rank1, &
                copy_real64_rank2, &
                copy_real64_rank3, &
                copy_real64_rank4, &
                copy_real64_rank5, &
                copy_real32_rank0, &
                copy_real32_rank1, &
                copy_real32_rank2, &
                copy_real32_rank3, &
                copy_real32_rank4, &
                copy_real32_rank5, &
                copy_int64_rank0, &
                copy_int64_rank1, &
                copy_int64_rank2, &
                copy_int64_rank3, &
                copy_int64_rank4, &
                copy_int64_rank5, &
                copy_int32_rank0, &
                copy_int32_rank1, &
                copy_int32_rank2, &
                copy_int32_rank3, &
                copy_int32_rank4, &
                copy_int32_rank5, &
                copy_int16_rank0, &
                copy_int16_rank1, &
                copy_int16_rank2, &
                copy_int16_rank3, &
                copy_int16_rank4, &
                copy_int16_rank5, &
                copy_int8_rank0, &
                copy_int8_rank1, &
                copy_int8_rank2, &
                copy_int8_rank3, &
                copy_int8_rank4, &
                copy_int8_rank5
        generic :: allocate_and_copy_to_scratch => &
                allocate_and_copy_to_scratch_from_storage, &
                allocate_and_copy_to_scratch_complex128_rank0, &
                allocate_and_copy_to_scratch_complex128_rank1, &
                allocate_and_copy_to_scratch_complex128_rank2, &
                allocate_and_copy_to_scratch_complex128_rank3, &
                allocate_and_copy_to_scratch_complex128_rank4, &
                allocate_and_copy_to_scratch_complex128_rank5, &
                allocate_and_copy_to_scratch_complex64_rank0, &
                allocate_and_copy_to_scratch_complex64_rank1, &
                allocate_and_copy_to_scratch_complex64_rank2, &
                allocate_and_copy_to_scratch_complex64_rank3, &
                allocate_and_copy_to_scratch_complex64_rank4, &
                allocate_and_copy_to_scratch_complex64_rank5, &
                allocate_and_copy_to_scratch_real64_rank0, &
                allocate_and_copy_to_scratch_real64_rank1, &
                allocate_and_copy_to_scratch_real64_rank2, &
                allocate_and_copy_to_scratch_real64_rank3, &
                allocate_and_copy_to_scratch_real64_rank4, &
                allocate_and_copy_to_scratch_real64_rank5, &
                allocate_and_copy_to_scratch_real32_rank0, &
                allocate_and_copy_to_scratch_real32_rank1, &
                allocate_and_copy_to_scratch_real32_rank2, &
                allocate_and_copy_to_scratch_real32_rank3, &
                allocate_and_copy_to_scratch_real32_rank4, &
                allocate_and_copy_to_scratch_real32_rank5, &
                allocate_and_copy_to_scratch_int64_rank0, &
                allocate_and_copy_to_scratch_int64_rank1, &
                allocate_and_copy_to_scratch_int64_rank2, &
                allocate_and_copy_to_scratch_int64_rank3, &
                allocate_and_copy_to_scratch_int64_rank4, &
                allocate_and_copy_to_scratch_int64_rank5, &
                allocate_and_copy_to_scratch_int32_rank0, &
                allocate_and_copy_to_scratch_int32_rank1, &
                allocate_and_copy_to_scratch_int32_rank2, &
                allocate_and_copy_to_scratch_int32_rank3, &
                allocate_and_copy_to_scratch_int32_rank4, &
                allocate_and_copy_to_scratch_int32_rank5, &
                allocate_and_copy_to_scratch_int16_rank0, &
                allocate_and_copy_to_scratch_int16_rank1, &
                allocate_and_copy_to_scratch_int16_rank2, &
                allocate_and_copy_to_scratch_int16_rank3, &
                allocate_and_copy_to_scratch_int16_rank4, &
                allocate_and_copy_to_scratch_int16_rank5, &
                allocate_and_copy_to_scratch_int8_rank0, &
                allocate_and_copy_to_scratch_int8_rank1, &
                allocate_and_copy_to_scratch_int8_rank2, &
                allocate_and_copy_to_scratch_int8_rank3, &
                allocate_and_copy_to_scratch_int8_rank4, &
                allocate_and_copy_to_scratch_int8_rank5
        generic :: copy_to_scratch => &
                copy_to_scratch_from_storage, &
                copy_to_scratch_complex128_rank0, &
                copy_to_scratch_complex128_rank1, &
                copy_to_scratch_complex128_rank2, &
                copy_to_scratch_complex128_rank3, &
                copy_to_scratch_complex128_rank4, &
                copy_to_scratch_complex128_rank5, &
                copy_to_scratch_complex64_rank0, &
                copy_to_scratch_complex64_rank1, &
                copy_to_scratch_complex64_rank2, &
                copy_to_scratch_complex64_rank3, &
                copy_to_scratch_complex64_rank4, &
                copy_to_scratch_complex64_rank5, &
                copy_to_scratch_real64_rank0, &
                copy_to_scratch_real64_rank1, &
                copy_to_scratch_real64_rank2, &
                copy_to_scratch_real64_rank3, &
                copy_to_scratch_real64_rank4, &
                copy_to_scratch_real64_rank5, &
                copy_to_scratch_real32_rank0, &
                copy_to_scratch_real32_rank1, &
                copy_to_scratch_real32_rank2, &
                copy_to_scratch_real32_rank3, &
                copy_to_scratch_real32_rank4, &
                copy_to_scratch_real32_rank5, &
                copy_to_scratch_int64_rank0, &
                copy_to_scratch_int64_rank1, &
                copy_to_scratch_int64_rank2, &
                copy_to_scratch_int64_rank3, &
                copy_to_scratch_int64_rank4, &
                copy_to_scratch_int64_rank5, &
                copy_to_scratch_int32_rank0, &
                copy_to_scratch_int32_rank1, &
                copy_to_scratch_int32_rank2, &
                copy_to_scratch_int32_rank3, &
                copy_to_scratch_int32_rank4, &
                copy_to_scratch_int32_rank5, &
                copy_to_scratch_int16_rank0, &
                copy_to_scratch_int16_rank1, &
                copy_to_scratch_int16_rank2, &
                copy_to_scratch_int16_rank3, &
                copy_to_scratch_int16_rank4, &
                copy_to_scratch_int16_rank5, &
                copy_to_scratch_int8_rank0, &
                copy_to_scratch_int8_rank1, &
                copy_to_scratch_int8_rank2, &
                copy_to_scratch_int8_rank3, &
                copy_to_scratch_int8_rank4, &
                copy_to_scratch_int8_rank5
        generic :: allocate_and_point_to => &
                allocate_and_point_to_from_storage, &
                allocate_and_point_to_complex128_rank0, &
                allocate_and_point_to_complex128_rank1, &
                allocate_and_point_to_complex128_rank2, &
                allocate_and_point_to_complex128_rank3, &
                allocate_and_point_to_complex128_rank4, &
                allocate_and_point_to_complex128_rank5, &
                allocate_and_point_to_complex64_rank0, &
                allocate_and_point_to_complex64_rank1, &
                allocate_and_point_to_complex64_rank2, &
                allocate_and_point_to_complex64_rank3, &
                allocate_and_point_to_complex64_rank4, &
                allocate_and_point_to_complex64_rank5, &
                allocate_and_point_to_real64_rank0, &
                allocate_and_point_to_real64_rank1, &
                allocate_and_point_to_real64_rank2, &
                allocate_and_point_to_real64_rank3, &
                allocate_and_point_to_real64_rank4, &
                allocate_and_point_to_real64_rank5, &
                allocate_and_point_to_real32_rank0, &
                allocate_and_point_to_real32_rank1, &
                allocate_and_point_to_real32_rank2, &
                allocate_and_point_to_real32_rank3, &
                allocate_and_point_to_real32_rank4, &
                allocate_and_point_to_real32_rank5, &
                allocate_and_point_to_int64_rank0, &
                allocate_and_point_to_int64_rank1, &
                allocate_and_point_to_int64_rank2, &
                allocate_and_point_to_int64_rank3, &
                allocate_and_point_to_int64_rank4, &
                allocate_and_point_to_int64_rank5, &
                allocate_and_point_to_int32_rank0, &
                allocate_and_point_to_int32_rank1, &
                allocate_and_point_to_int32_rank2, &
                allocate_and_point_to_int32_rank3, &
                allocate_and_point_to_int32_rank4, &
                allocate_and_point_to_int32_rank5, &
                allocate_and_point_to_int16_rank0, &
                allocate_and_point_to_int16_rank1, &
                allocate_and_point_to_int16_rank2, &
                allocate_and_point_to_int16_rank3, &
                allocate_and_point_to_int16_rank4, &
                allocate_and_point_to_int16_rank5, &
                allocate_and_point_to_int8_rank0, &
                allocate_and_point_to_int8_rank1, &
                allocate_and_point_to_int8_rank2, &
                allocate_and_point_to_int8_rank3, &
                allocate_and_point_to_int8_rank4, &
                allocate_and_point_to_int8_rank5
        generic :: point_to => &
                point_to_from_storage, &
                point_to_complex128_rank0, &
                point_to_complex128_rank1, &
                point_to_complex128_rank2, &
                point_to_complex128_rank3, &
                point_to_complex128_rank4, &
                point_to_complex128_rank5, &
                point_to_complex64_rank0, &
                point_to_complex64_rank1, &
                point_to_complex64_rank2, &
                point_to_complex64_rank3, &
                point_to_complex64_rank4, &
                point_to_complex64_rank5, &
                point_to_real64_rank0, &
                point_to_real64_rank1, &
                point_to_real64_rank2, &
                point_to_real64_rank3, &
                point_to_real64_rank4, &
                point_to_real64_rank5, &
                point_to_real32_rank0, &
                point_to_real32_rank1, &
                point_to_real32_rank2, &
                point_to_real32_rank3, &
                point_to_real32_rank4, &
                point_to_real32_rank5, &
                point_to_int64_rank0, &
                point_to_int64_rank1, &
                point_to_int64_rank2, &
                point_to_int64_rank3, &
                point_to_int64_rank4, &
                point_to_int64_rank5, &
                point_to_int32_rank0, &
                point_to_int32_rank1, &
                point_to_int32_rank2, &
                point_to_int32_rank3, &
                point_to_int32_rank4, &
                point_to_int32_rank5, &
                point_to_int16_rank0, &
                point_to_int16_rank1, &
                point_to_int16_rank2, &
                point_to_int16_rank3, &
                point_to_int16_rank4, &
                point_to_int16_rank5, &
                point_to_int8_rank0, &
                point_to_int8_rank1, &
                point_to_int8_rank2, &
                point_to_int8_rank3, &
                point_to_int8_rank4, &
                point_to_int8_rank5
        procedure :: allocate_and_create_from_size => allocate_and_create_from_size
        procedure :: create_from_size => create_from_size
        procedure :: allocate_and_create_in_scratch_from_size => allocate_and_create_in_scratch_from_size
        procedure :: create_in_scratch_from_size => create_in_scratch_from_size
        procedure :: allocate_and_copy_from_storage => allocate_and_copy_from_storage
        procedure :: allocate_and_copy_complex128_rank0 => allocate_and_copy_complex128_rank0
        procedure :: allocate_and_copy_complex128_rank1 => allocate_and_copy_complex128_rank1
        procedure :: allocate_and_copy_complex128_rank2 => allocate_and_copy_complex128_rank2
        procedure :: allocate_and_copy_complex128_rank3 => allocate_and_copy_complex128_rank3
        procedure :: allocate_and_copy_complex128_rank4 => allocate_and_copy_complex128_rank4
        procedure :: allocate_and_copy_complex128_rank5 => allocate_and_copy_complex128_rank5
        procedure :: allocate_and_copy_complex64_rank0 => allocate_and_copy_complex64_rank0
        procedure :: allocate_and_copy_complex64_rank1 => allocate_and_copy_complex64_rank1
        procedure :: allocate_and_copy_complex64_rank2 => allocate_and_copy_complex64_rank2
        procedure :: allocate_and_copy_complex64_rank3 => allocate_and_copy_complex64_rank3
        procedure :: allocate_and_copy_complex64_rank4 => allocate_and_copy_complex64_rank4
        procedure :: allocate_and_copy_complex64_rank5 => allocate_and_copy_complex64_rank5
        procedure :: allocate_and_copy_real64_rank0 => allocate_and_copy_real64_rank0
        procedure :: allocate_and_copy_real64_rank1 => allocate_and_copy_real64_rank1
        procedure :: allocate_and_copy_real64_rank2 => allocate_and_copy_real64_rank2
        procedure :: allocate_and_copy_real64_rank3 => allocate_and_copy_real64_rank3
        procedure :: allocate_and_copy_real64_rank4 => allocate_and_copy_real64_rank4
        procedure :: allocate_and_copy_real64_rank5 => allocate_and_copy_real64_rank5
        procedure :: allocate_and_copy_real32_rank0 => allocate_and_copy_real32_rank0
        procedure :: allocate_and_copy_real32_rank1 => allocate_and_copy_real32_rank1
        procedure :: allocate_and_copy_real32_rank2 => allocate_and_copy_real32_rank2
        procedure :: allocate_and_copy_real32_rank3 => allocate_and_copy_real32_rank3
        procedure :: allocate_and_copy_real32_rank4 => allocate_and_copy_real32_rank4
        procedure :: allocate_and_copy_real32_rank5 => allocate_and_copy_real32_rank5
        procedure :: allocate_and_copy_int64_rank0 => allocate_and_copy_int64_rank0
        procedure :: allocate_and_copy_int64_rank1 => allocate_and_copy_int64_rank1
        procedure :: allocate_and_copy_int64_rank2 => allocate_and_copy_int64_rank2
        procedure :: allocate_and_copy_int64_rank3 => allocate_and_copy_int64_rank3
        procedure :: allocate_and_copy_int64_rank4 => allocate_and_copy_int64_rank4
        procedure :: allocate_and_copy_int64_rank5 => allocate_and_copy_int64_rank5
        procedure :: allocate_and_copy_int32_rank0 => allocate_and_copy_int32_rank0
        procedure :: allocate_and_copy_int32_rank1 => allocate_and_copy_int32_rank1
        procedure :: allocate_and_copy_int32_rank2 => allocate_and_copy_int32_rank2
        procedure :: allocate_and_copy_int32_rank3 => allocate_and_copy_int32_rank3
        procedure :: allocate_and_copy_int32_rank4 => allocate_and_copy_int32_rank4
        procedure :: allocate_and_copy_int32_rank5 => allocate_and_copy_int32_rank5
        procedure :: allocate_and_copy_int16_rank0 => allocate_and_copy_int16_rank0
        procedure :: allocate_and_copy_int16_rank1 => allocate_and_copy_int16_rank1
        procedure :: allocate_and_copy_int16_rank2 => allocate_and_copy_int16_rank2
        procedure :: allocate_and_copy_int16_rank3 => allocate_and_copy_int16_rank3
        procedure :: allocate_and_copy_int16_rank4 => allocate_and_copy_int16_rank4
        procedure :: allocate_and_copy_int16_rank5 => allocate_and_copy_int16_rank5
        procedure :: allocate_and_copy_int8_rank0 => allocate_and_copy_int8_rank0
        procedure :: allocate_and_copy_int8_rank1 => allocate_and_copy_int8_rank1
        procedure :: allocate_and_copy_int8_rank2 => allocate_and_copy_int8_rank2
        procedure :: allocate_and_copy_int8_rank3 => allocate_and_copy_int8_rank3
        procedure :: allocate_and_copy_int8_rank4 => allocate_and_copy_int8_rank4
        procedure :: allocate_and_copy_int8_rank5 => allocate_and_copy_int8_rank5
        procedure :: copy_from_storage => copy_from_storage
        procedure :: copy_complex128_rank0 => copy_complex128_rank0
        procedure :: copy_complex128_rank1 => copy_complex128_rank1
        procedure :: copy_complex128_rank2 => copy_complex128_rank2
        procedure :: copy_complex128_rank3 => copy_complex128_rank3
        procedure :: copy_complex128_rank4 => copy_complex128_rank4
        procedure :: copy_complex128_rank5 => copy_complex128_rank5
        procedure :: copy_complex64_rank0 => copy_complex64_rank0
        procedure :: copy_complex64_rank1 => copy_complex64_rank1
        procedure :: copy_complex64_rank2 => copy_complex64_rank2
        procedure :: copy_complex64_rank3 => copy_complex64_rank3
        procedure :: copy_complex64_rank4 => copy_complex64_rank4
        procedure :: copy_complex64_rank5 => copy_complex64_rank5
        procedure :: copy_real64_rank0 => copy_real64_rank0
        procedure :: copy_real64_rank1 => copy_real64_rank1
        procedure :: copy_real64_rank2 => copy_real64_rank2
        procedure :: copy_real64_rank3 => copy_real64_rank3
        procedure :: copy_real64_rank4 => copy_real64_rank4
        procedure :: copy_real64_rank5 => copy_real64_rank5
        procedure :: copy_real32_rank0 => copy_real32_rank0
        procedure :: copy_real32_rank1 => copy_real32_rank1
        procedure :: copy_real32_rank2 => copy_real32_rank2
        procedure :: copy_real32_rank3 => copy_real32_rank3
        procedure :: copy_real32_rank4 => copy_real32_rank4
        procedure :: copy_real32_rank5 => copy_real32_rank5
        procedure :: copy_int64_rank0 => copy_int64_rank0
        procedure :: copy_int64_rank1 => copy_int64_rank1
        procedure :: copy_int64_rank2 => copy_int64_rank2
        procedure :: copy_int64_rank3 => copy_int64_rank3
        procedure :: copy_int64_rank4 => copy_int64_rank4
        procedure :: copy_int64_rank5 => copy_int64_rank5
        procedure :: copy_int32_rank0 => copy_int32_rank0
        procedure :: copy_int32_rank1 => copy_int32_rank1
        procedure :: copy_int32_rank2 => copy_int32_rank2
        procedure :: copy_int32_rank3 => copy_int32_rank3
        procedure :: copy_int32_rank4 => copy_int32_rank4
        procedure :: copy_int32_rank5 => copy_int32_rank5
        procedure :: copy_int16_rank0 => copy_int16_rank0
        procedure :: copy_int16_rank1 => copy_int16_rank1
        procedure :: copy_int16_rank2 => copy_int16_rank2
        procedure :: copy_int16_rank3 => copy_int16_rank3
        procedure :: copy_int16_rank4 => copy_int16_rank4
        procedure :: copy_int16_rank5 => copy_int16_rank5
        procedure :: copy_int8_rank0 => copy_int8_rank0
        procedure :: copy_int8_rank1 => copy_int8_rank1
        procedure :: copy_int8_rank2 => copy_int8_rank2
        procedure :: copy_int8_rank3 => copy_int8_rank3
        procedure :: copy_int8_rank4 => copy_int8_rank4
        procedure :: copy_int8_rank5 => copy_int8_rank5
        procedure :: allocate_and_copy_to_scratch_from_storage => allocate_and_copy_to_scratch_from_storage
        procedure :: allocate_and_copy_to_scratch_complex128_rank0 => allocate_and_copy_to_scratch_complex128_rank0
        procedure :: allocate_and_copy_to_scratch_complex128_rank1 => allocate_and_copy_to_scratch_complex128_rank1
        procedure :: allocate_and_copy_to_scratch_complex128_rank2 => allocate_and_copy_to_scratch_complex128_rank2
        procedure :: allocate_and_copy_to_scratch_complex128_rank3 => allocate_and_copy_to_scratch_complex128_rank3
        procedure :: allocate_and_copy_to_scratch_complex128_rank4 => allocate_and_copy_to_scratch_complex128_rank4
        procedure :: allocate_and_copy_to_scratch_complex128_rank5 => allocate_and_copy_to_scratch_complex128_rank5
        procedure :: allocate_and_copy_to_scratch_complex64_rank0 => allocate_and_copy_to_scratch_complex64_rank0
        procedure :: allocate_and_copy_to_scratch_complex64_rank1 => allocate_and_copy_to_scratch_complex64_rank1
        procedure :: allocate_and_copy_to_scratch_complex64_rank2 => allocate_and_copy_to_scratch_complex64_rank2
        procedure :: allocate_and_copy_to_scratch_complex64_rank3 => allocate_and_copy_to_scratch_complex64_rank3
        procedure :: allocate_and_copy_to_scratch_complex64_rank4 => allocate_and_copy_to_scratch_complex64_rank4
        procedure :: allocate_and_copy_to_scratch_complex64_rank5 => allocate_and_copy_to_scratch_complex64_rank5
        procedure :: allocate_and_copy_to_scratch_real64_rank0 => allocate_and_copy_to_scratch_real64_rank0
        procedure :: allocate_and_copy_to_scratch_real64_rank1 => allocate_and_copy_to_scratch_real64_rank1
        procedure :: allocate_and_copy_to_scratch_real64_rank2 => allocate_and_copy_to_scratch_real64_rank2
        procedure :: allocate_and_copy_to_scratch_real64_rank3 => allocate_and_copy_to_scratch_real64_rank3
        procedure :: allocate_and_copy_to_scratch_real64_rank4 => allocate_and_copy_to_scratch_real64_rank4
        procedure :: allocate_and_copy_to_scratch_real64_rank5 => allocate_and_copy_to_scratch_real64_rank5
        procedure :: allocate_and_copy_to_scratch_real32_rank0 => allocate_and_copy_to_scratch_real32_rank0
        procedure :: allocate_and_copy_to_scratch_real32_rank1 => allocate_and_copy_to_scratch_real32_rank1
        procedure :: allocate_and_copy_to_scratch_real32_rank2 => allocate_and_copy_to_scratch_real32_rank2
        procedure :: allocate_and_copy_to_scratch_real32_rank3 => allocate_and_copy_to_scratch_real32_rank3
        procedure :: allocate_and_copy_to_scratch_real32_rank4 => allocate_and_copy_to_scratch_real32_rank4
        procedure :: allocate_and_copy_to_scratch_real32_rank5 => allocate_and_copy_to_scratch_real32_rank5
        procedure :: allocate_and_copy_to_scratch_int64_rank0 => allocate_and_copy_to_scratch_int64_rank0
        procedure :: allocate_and_copy_to_scratch_int64_rank1 => allocate_and_copy_to_scratch_int64_rank1
        procedure :: allocate_and_copy_to_scratch_int64_rank2 => allocate_and_copy_to_scratch_int64_rank2
        procedure :: allocate_and_copy_to_scratch_int64_rank3 => allocate_and_copy_to_scratch_int64_rank3
        procedure :: allocate_and_copy_to_scratch_int64_rank4 => allocate_and_copy_to_scratch_int64_rank4
        procedure :: allocate_and_copy_to_scratch_int64_rank5 => allocate_and_copy_to_scratch_int64_rank5
        procedure :: allocate_and_copy_to_scratch_int32_rank0 => allocate_and_copy_to_scratch_int32_rank0
        procedure :: allocate_and_copy_to_scratch_int32_rank1 => allocate_and_copy_to_scratch_int32_rank1
        procedure :: allocate_and_copy_to_scratch_int32_rank2 => allocate_and_copy_to_scratch_int32_rank2
        procedure :: allocate_and_copy_to_scratch_int32_rank3 => allocate_and_copy_to_scratch_int32_rank3
        procedure :: allocate_and_copy_to_scratch_int32_rank4 => allocate_and_copy_to_scratch_int32_rank4
        procedure :: allocate_and_copy_to_scratch_int32_rank5 => allocate_and_copy_to_scratch_int32_rank5
        procedure :: allocate_and_copy_to_scratch_int16_rank0 => allocate_and_copy_to_scratch_int16_rank0
        procedure :: allocate_and_copy_to_scratch_int16_rank1 => allocate_and_copy_to_scratch_int16_rank1
        procedure :: allocate_and_copy_to_scratch_int16_rank2 => allocate_and_copy_to_scratch_int16_rank2
        procedure :: allocate_and_copy_to_scratch_int16_rank3 => allocate_and_copy_to_scratch_int16_rank3
        procedure :: allocate_and_copy_to_scratch_int16_rank4 => allocate_and_copy_to_scratch_int16_rank4
        procedure :: allocate_and_copy_to_scratch_int16_rank5 => allocate_and_copy_to_scratch_int16_rank5
        procedure :: allocate_and_copy_to_scratch_int8_rank0 => allocate_and_copy_to_scratch_int8_rank0
        procedure :: allocate_and_copy_to_scratch_int8_rank1 => allocate_and_copy_to_scratch_int8_rank1
        procedure :: allocate_and_copy_to_scratch_int8_rank2 => allocate_and_copy_to_scratch_int8_rank2
        procedure :: allocate_and_copy_to_scratch_int8_rank3 => allocate_and_copy_to_scratch_int8_rank3
        procedure :: allocate_and_copy_to_scratch_int8_rank4 => allocate_and_copy_to_scratch_int8_rank4
        procedure :: allocate_and_copy_to_scratch_int8_rank5 => allocate_and_copy_to_scratch_int8_rank5
        procedure :: copy_to_scratch_from_storage => copy_to_scratch_from_storage
        procedure :: copy_to_scratch_complex128_rank0 => copy_to_scratch_complex128_rank0
        procedure :: copy_to_scratch_complex128_rank1 => copy_to_scratch_complex128_rank1
        procedure :: copy_to_scratch_complex128_rank2 => copy_to_scratch_complex128_rank2
        procedure :: copy_to_scratch_complex128_rank3 => copy_to_scratch_complex128_rank3
        procedure :: copy_to_scratch_complex128_rank4 => copy_to_scratch_complex128_rank4
        procedure :: copy_to_scratch_complex128_rank5 => copy_to_scratch_complex128_rank5
        procedure :: copy_to_scratch_complex64_rank0 => copy_to_scratch_complex64_rank0
        procedure :: copy_to_scratch_complex64_rank1 => copy_to_scratch_complex64_rank1
        procedure :: copy_to_scratch_complex64_rank2 => copy_to_scratch_complex64_rank2
        procedure :: copy_to_scratch_complex64_rank3 => copy_to_scratch_complex64_rank3
        procedure :: copy_to_scratch_complex64_rank4 => copy_to_scratch_complex64_rank4
        procedure :: copy_to_scratch_complex64_rank5 => copy_to_scratch_complex64_rank5
        procedure :: copy_to_scratch_real64_rank0 => copy_to_scratch_real64_rank0
        procedure :: copy_to_scratch_real64_rank1 => copy_to_scratch_real64_rank1
        procedure :: copy_to_scratch_real64_rank2 => copy_to_scratch_real64_rank2
        procedure :: copy_to_scratch_real64_rank3 => copy_to_scratch_real64_rank3
        procedure :: copy_to_scratch_real64_rank4 => copy_to_scratch_real64_rank4
        procedure :: copy_to_scratch_real64_rank5 => copy_to_scratch_real64_rank5
        procedure :: copy_to_scratch_real32_rank0 => copy_to_scratch_real32_rank0
        procedure :: copy_to_scratch_real32_rank1 => copy_to_scratch_real32_rank1
        procedure :: copy_to_scratch_real32_rank2 => copy_to_scratch_real32_rank2
        procedure :: copy_to_scratch_real32_rank3 => copy_to_scratch_real32_rank3
        procedure :: copy_to_scratch_real32_rank4 => copy_to_scratch_real32_rank4
        procedure :: copy_to_scratch_real32_rank5 => copy_to_scratch_real32_rank5
        procedure :: copy_to_scratch_int64_rank0 => copy_to_scratch_int64_rank0
        procedure :: copy_to_scratch_int64_rank1 => copy_to_scratch_int64_rank1
        procedure :: copy_to_scratch_int64_rank2 => copy_to_scratch_int64_rank2
        procedure :: copy_to_scratch_int64_rank3 => copy_to_scratch_int64_rank3
        procedure :: copy_to_scratch_int64_rank4 => copy_to_scratch_int64_rank4
        procedure :: copy_to_scratch_int64_rank5 => copy_to_scratch_int64_rank5
        procedure :: copy_to_scratch_int32_rank0 => copy_to_scratch_int32_rank0
        procedure :: copy_to_scratch_int32_rank1 => copy_to_scratch_int32_rank1
        procedure :: copy_to_scratch_int32_rank2 => copy_to_scratch_int32_rank2
        procedure :: copy_to_scratch_int32_rank3 => copy_to_scratch_int32_rank3
        procedure :: copy_to_scratch_int32_rank4 => copy_to_scratch_int32_rank4
        procedure :: copy_to_scratch_int32_rank5 => copy_to_scratch_int32_rank5
        procedure :: copy_to_scratch_int16_rank0 => copy_to_scratch_int16_rank0
        procedure :: copy_to_scratch_int16_rank1 => copy_to_scratch_int16_rank1
        procedure :: copy_to_scratch_int16_rank2 => copy_to_scratch_int16_rank2
        procedure :: copy_to_scratch_int16_rank3 => copy_to_scratch_int16_rank3
        procedure :: copy_to_scratch_int16_rank4 => copy_to_scratch_int16_rank4
        procedure :: copy_to_scratch_int16_rank5 => copy_to_scratch_int16_rank5
        procedure :: copy_to_scratch_int8_rank0 => copy_to_scratch_int8_rank0
        procedure :: copy_to_scratch_int8_rank1 => copy_to_scratch_int8_rank1
        procedure :: copy_to_scratch_int8_rank2 => copy_to_scratch_int8_rank2
        procedure :: copy_to_scratch_int8_rank3 => copy_to_scratch_int8_rank3
        procedure :: copy_to_scratch_int8_rank4 => copy_to_scratch_int8_rank4
        procedure :: copy_to_scratch_int8_rank5 => copy_to_scratch_int8_rank5
        procedure :: allocate_and_point_to_from_storage => allocate_and_point_to_from_storage
        procedure :: allocate_and_point_to_complex128_rank0 => allocate_and_point_to_complex128_rank0
        procedure :: allocate_and_point_to_complex128_rank1 => allocate_and_point_to_complex128_rank1
        procedure :: allocate_and_point_to_complex128_rank2 => allocate_and_point_to_complex128_rank2
        procedure :: allocate_and_point_to_complex128_rank3 => allocate_and_point_to_complex128_rank3
        procedure :: allocate_and_point_to_complex128_rank4 => allocate_and_point_to_complex128_rank4
        procedure :: allocate_and_point_to_complex128_rank5 => allocate_and_point_to_complex128_rank5
        procedure :: allocate_and_point_to_complex64_rank0 => allocate_and_point_to_complex64_rank0
        procedure :: allocate_and_point_to_complex64_rank1 => allocate_and_point_to_complex64_rank1
        procedure :: allocate_and_point_to_complex64_rank2 => allocate_and_point_to_complex64_rank2
        procedure :: allocate_and_point_to_complex64_rank3 => allocate_and_point_to_complex64_rank3
        procedure :: allocate_and_point_to_complex64_rank4 => allocate_and_point_to_complex64_rank4
        procedure :: allocate_and_point_to_complex64_rank5 => allocate_and_point_to_complex64_rank5
        procedure :: allocate_and_point_to_real64_rank0 => allocate_and_point_to_real64_rank0
        procedure :: allocate_and_point_to_real64_rank1 => allocate_and_point_to_real64_rank1
        procedure :: allocate_and_point_to_real64_rank2 => allocate_and_point_to_real64_rank2
        procedure :: allocate_and_point_to_real64_rank3 => allocate_and_point_to_real64_rank3
        procedure :: allocate_and_point_to_real64_rank4 => allocate_and_point_to_real64_rank4
        procedure :: allocate_and_point_to_real64_rank5 => allocate_and_point_to_real64_rank5
        procedure :: allocate_and_point_to_real32_rank0 => allocate_and_point_to_real32_rank0
        procedure :: allocate_and_point_to_real32_rank1 => allocate_and_point_to_real32_rank1
        procedure :: allocate_and_point_to_real32_rank2 => allocate_and_point_to_real32_rank2
        procedure :: allocate_and_point_to_real32_rank3 => allocate_and_point_to_real32_rank3
        procedure :: allocate_and_point_to_real32_rank4 => allocate_and_point_to_real32_rank4
        procedure :: allocate_and_point_to_real32_rank5 => allocate_and_point_to_real32_rank5
        procedure :: allocate_and_point_to_int64_rank0 => allocate_and_point_to_int64_rank0
        procedure :: allocate_and_point_to_int64_rank1 => allocate_and_point_to_int64_rank1
        procedure :: allocate_and_point_to_int64_rank2 => allocate_and_point_to_int64_rank2
        procedure :: allocate_and_point_to_int64_rank3 => allocate_and_point_to_int64_rank3
        procedure :: allocate_and_point_to_int64_rank4 => allocate_and_point_to_int64_rank4
        procedure :: allocate_and_point_to_int64_rank5 => allocate_and_point_to_int64_rank5
        procedure :: allocate_and_point_to_int32_rank0 => allocate_and_point_to_int32_rank0
        procedure :: allocate_and_point_to_int32_rank1 => allocate_and_point_to_int32_rank1
        procedure :: allocate_and_point_to_int32_rank2 => allocate_and_point_to_int32_rank2
        procedure :: allocate_and_point_to_int32_rank3 => allocate_and_point_to_int32_rank3
        procedure :: allocate_and_point_to_int32_rank4 => allocate_and_point_to_int32_rank4
        procedure :: allocate_and_point_to_int32_rank5 => allocate_and_point_to_int32_rank5
        procedure :: allocate_and_point_to_int16_rank0 => allocate_and_point_to_int16_rank0
        procedure :: allocate_and_point_to_int16_rank1 => allocate_and_point_to_int16_rank1
        procedure :: allocate_and_point_to_int16_rank2 => allocate_and_point_to_int16_rank2
        procedure :: allocate_and_point_to_int16_rank3 => allocate_and_point_to_int16_rank3
        procedure :: allocate_and_point_to_int16_rank4 => allocate_and_point_to_int16_rank4
        procedure :: allocate_and_point_to_int16_rank5 => allocate_and_point_to_int16_rank5
        procedure :: allocate_and_point_to_int8_rank0 => allocate_and_point_to_int8_rank0
        procedure :: allocate_and_point_to_int8_rank1 => allocate_and_point_to_int8_rank1
        procedure :: allocate_and_point_to_int8_rank2 => allocate_and_point_to_int8_rank2
        procedure :: allocate_and_point_to_int8_rank3 => allocate_and_point_to_int8_rank3
        procedure :: allocate_and_point_to_int8_rank4 => allocate_and_point_to_int8_rank4
        procedure :: allocate_and_point_to_int8_rank5 => allocate_and_point_to_int8_rank5
        procedure :: point_to_from_storage => point_to_from_storage
        procedure :: point_to_complex128_rank0 => point_to_complex128_rank0
        procedure :: point_to_complex128_rank1 => point_to_complex128_rank1
        procedure :: point_to_complex128_rank2 => point_to_complex128_rank2
        procedure :: point_to_complex128_rank3 => point_to_complex128_rank3
        procedure :: point_to_complex128_rank4 => point_to_complex128_rank4
        procedure :: point_to_complex128_rank5 => point_to_complex128_rank5
        procedure :: point_to_complex64_rank0 => point_to_complex64_rank0
        procedure :: point_to_complex64_rank1 => point_to_complex64_rank1
        procedure :: point_to_complex64_rank2 => point_to_complex64_rank2
        procedure :: point_to_complex64_rank3 => point_to_complex64_rank3
        procedure :: point_to_complex64_rank4 => point_to_complex64_rank4
        procedure :: point_to_complex64_rank5 => point_to_complex64_rank5
        procedure :: point_to_real64_rank0 => point_to_real64_rank0
        procedure :: point_to_real64_rank1 => point_to_real64_rank1
        procedure :: point_to_real64_rank2 => point_to_real64_rank2
        procedure :: point_to_real64_rank3 => point_to_real64_rank3
        procedure :: point_to_real64_rank4 => point_to_real64_rank4
        procedure :: point_to_real64_rank5 => point_to_real64_rank5
        procedure :: point_to_real32_rank0 => point_to_real32_rank0
        procedure :: point_to_real32_rank1 => point_to_real32_rank1
        procedure :: point_to_real32_rank2 => point_to_real32_rank2
        procedure :: point_to_real32_rank3 => point_to_real32_rank3
        procedure :: point_to_real32_rank4 => point_to_real32_rank4
        procedure :: point_to_real32_rank5 => point_to_real32_rank5
        procedure :: point_to_int64_rank0 => point_to_int64_rank0
        procedure :: point_to_int64_rank1 => point_to_int64_rank1
        procedure :: point_to_int64_rank2 => point_to_int64_rank2
        procedure :: point_to_int64_rank3 => point_to_int64_rank3
        procedure :: point_to_int64_rank4 => point_to_int64_rank4
        procedure :: point_to_int64_rank5 => point_to_int64_rank5
        procedure :: point_to_int32_rank0 => point_to_int32_rank0
        procedure :: point_to_int32_rank1 => point_to_int32_rank1
        procedure :: point_to_int32_rank2 => point_to_int32_rank2
        procedure :: point_to_int32_rank3 => point_to_int32_rank3
        procedure :: point_to_int32_rank4 => point_to_int32_rank4
        procedure :: point_to_int32_rank5 => point_to_int32_rank5
        procedure :: point_to_int16_rank0 => point_to_int16_rank0
        procedure :: point_to_int16_rank1 => point_to_int16_rank1
        procedure :: point_to_int16_rank2 => point_to_int16_rank2
        procedure :: point_to_int16_rank3 => point_to_int16_rank3
        procedure :: point_to_int16_rank4 => point_to_int16_rank4
        procedure :: point_to_int16_rank5 => point_to_int16_rank5
        procedure :: point_to_int8_rank0 => point_to_int8_rank0
        procedure :: point_to_int8_rank1 => point_to_int8_rank1
        procedure :: point_to_int8_rank2 => point_to_int8_rank2
        procedure :: point_to_int8_rank3 => point_to_int8_rank3
        procedure :: point_to_int8_rank4 => point_to_int8_rank4
        procedure :: point_to_int8_rank5 => point_to_int8_rank5
        procedure :: copy_c_ptr => copy_c_ptr
        procedure :: copy_c_ptr_to_scratch => copy_c_ptr_to_scratch
        procedure :: cleanup => cleanup
        procedure :: clear => clear
    end type storage_builder

    interface storage_builder
        module procedure constructor_empty
        module procedure constructor
    end interface storage_builder
contains
    function constructor_empty() result(this)
        type(storage_builder) :: this

        call this%clear()
    end function constructor_empty

    function constructor(builder) result(this)
        class(data_builder), intent(in) :: builder
        type(storage_builder) :: this

        this = storage_builder()
        this%builder = builder
        this%converter = fortran_host_converter()
    end function constructor

    subroutine allocate_and_create_from_size(this, storage, number_of_bytes, initialize)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: storage
        integer(int64), intent(in) :: number_of_bytes
        logical, intent(in) :: initialize

        call this%builder%allocate_class(storage)
        call this%create_from_size(storage, number_of_bytes, initialize)
    end subroutine allocate_and_create_from_size

    subroutine create_from_size(this, storage, number_of_bytes, initialize)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: storage
        integer(int64), intent(in) :: number_of_bytes
        logical, intent(in) :: initialize

        call storage%allocate_data(number_of_bytes)
        if ( initialize ) call this%builder%initialize(storage)
    end subroutine create_from_size

    subroutine allocate_and_create_in_scratch_from_size(this, storage, scratch, number_of_bytes, initialize)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: storage
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), intent(in) :: number_of_bytes
        logical, intent(in), optional :: initialize

        call scratch%allocate_storage_object(storage)
        call this%create_in_scratch(storage, scratch, number_of_bytes, initialize)
    end subroutine allocate_and_create_in_scratch_from_size

    subroutine create_in_scratch_from_size(this, storage, scratch, number_of_bytes, initialize)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: storage
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), intent(in) :: number_of_bytes
        logical, intent(in), optional :: initialize

        call scratch%create(storage, number_of_bytes, initialize)
    end subroutine create_in_scratch_from_size

    subroutine allocate_and_copy_from_storage(this, dst, src, astream)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        class(data_storage), intent(in) :: src
        type(stream), intent(in), optional :: astream

        call this%builder%allocate_class(dst)
        call this%copy(dst, src, astream)
    end subroutine allocate_and_copy_from_storage

    subroutine copy_from_storage(this, dst, src, astream)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        class(data_storage), intent(in) :: src
        type(stream), intent(in), optional :: astream

        call memory_manager%copy_storage(src, dst, astream)
    end subroutine copy_from_storage

    subroutine allocate_and_copy_complex128_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_complex128_rank0

    subroutine copy_complex128_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real64), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_complex128_rank0

    subroutine allocate_and_copy_complex128_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_complex128_rank1

    subroutine copy_complex128_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_complex128_rank1

    subroutine allocate_and_copy_complex128_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_complex128_rank2

    subroutine copy_complex128_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_complex128_rank2

    subroutine allocate_and_copy_complex128_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_complex128_rank3

    subroutine copy_complex128_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_complex128_rank3

    subroutine allocate_and_copy_complex128_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_complex128_rank4

    subroutine copy_complex128_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:,:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_complex128_rank4

    subroutine allocate_and_copy_complex128_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:,:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_complex128_rank5

    subroutine copy_complex128_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:,:,:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_complex128_rank5

    subroutine allocate_and_copy_complex64_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_complex64_rank0

    subroutine copy_complex64_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real32), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_complex64_rank0

    subroutine allocate_and_copy_complex64_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_complex64_rank1

    subroutine copy_complex64_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_complex64_rank1

    subroutine allocate_and_copy_complex64_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_complex64_rank2

    subroutine copy_complex64_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_complex64_rank2

    subroutine allocate_and_copy_complex64_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_complex64_rank3

    subroutine copy_complex64_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_complex64_rank3

    subroutine allocate_and_copy_complex64_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_complex64_rank4

    subroutine copy_complex64_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:,:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_complex64_rank4

    subroutine allocate_and_copy_complex64_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:,:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_complex64_rank5

    subroutine copy_complex64_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:,:,:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_complex64_rank5

    subroutine allocate_and_copy_real64_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_real64_rank0

    subroutine copy_real64_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real64), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_real64_rank0

    subroutine allocate_and_copy_real64_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_real64_rank1

    subroutine copy_real64_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_real64_rank1

    subroutine allocate_and_copy_real64_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_real64_rank2

    subroutine copy_real64_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_real64_rank2

    subroutine allocate_and_copy_real64_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_real64_rank3

    subroutine copy_real64_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_real64_rank3

    subroutine allocate_and_copy_real64_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_real64_rank4

    subroutine copy_real64_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:,:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_real64_rank4

    subroutine allocate_and_copy_real64_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:,:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_real64_rank5

    subroutine copy_real64_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:,:,:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_real64_rank5

    subroutine allocate_and_copy_real32_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_real32_rank0

    subroutine copy_real32_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real32), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_real32_rank0

    subroutine allocate_and_copy_real32_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_real32_rank1

    subroutine copy_real32_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_real32_rank1

    subroutine allocate_and_copy_real32_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_real32_rank2

    subroutine copy_real32_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_real32_rank2

    subroutine allocate_and_copy_real32_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_real32_rank3

    subroutine copy_real32_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_real32_rank3

    subroutine allocate_and_copy_real32_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_real32_rank4

    subroutine copy_real32_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:,:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_real32_rank4

    subroutine allocate_and_copy_real32_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:,:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_real32_rank5

    subroutine copy_real32_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:,:,:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_real32_rank5

    subroutine allocate_and_copy_int64_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int64_rank0

    subroutine copy_int64_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int64), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int64_rank0

    subroutine allocate_and_copy_int64_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int64_rank1

    subroutine copy_int64_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int64_rank1

    subroutine allocate_and_copy_int64_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int64_rank2

    subroutine copy_int64_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int64_rank2

    subroutine allocate_and_copy_int64_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int64_rank3

    subroutine copy_int64_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int64_rank3

    subroutine allocate_and_copy_int64_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int64_rank4

    subroutine copy_int64_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:,:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int64_rank4

    subroutine allocate_and_copy_int64_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:,:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int64_rank5

    subroutine copy_int64_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:,:,:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int64_rank5

    subroutine allocate_and_copy_int32_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int32_rank0

    subroutine copy_int32_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int32), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int32_rank0

    subroutine allocate_and_copy_int32_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int32_rank1

    subroutine copy_int32_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int32_rank1

    subroutine allocate_and_copy_int32_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int32_rank2

    subroutine copy_int32_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int32_rank2

    subroutine allocate_and_copy_int32_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int32_rank3

    subroutine copy_int32_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int32_rank3

    subroutine allocate_and_copy_int32_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int32_rank4

    subroutine copy_int32_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:,:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int32_rank4

    subroutine allocate_and_copy_int32_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:,:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int32_rank5

    subroutine copy_int32_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:,:,:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int32_rank5

    subroutine allocate_and_copy_int16_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int16_rank0

    subroutine copy_int16_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int16), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int16_rank0

    subroutine allocate_and_copy_int16_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int16_rank1

    subroutine copy_int16_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int16_rank1

    subroutine allocate_and_copy_int16_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int16_rank2

    subroutine copy_int16_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int16_rank2

    subroutine allocate_and_copy_int16_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int16_rank3

    subroutine copy_int16_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int16_rank3

    subroutine allocate_and_copy_int16_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int16_rank4

    subroutine copy_int16_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:,:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int16_rank4

    subroutine allocate_and_copy_int16_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:,:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int16_rank5

    subroutine copy_int16_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:,:,:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int16_rank5

    subroutine allocate_and_copy_int8_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int8_rank0

    subroutine copy_int8_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int8), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int8_rank0

    subroutine allocate_and_copy_int8_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int8_rank1

    subroutine copy_int8_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int8_rank1

    subroutine allocate_and_copy_int8_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int8_rank2

    subroutine copy_int8_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int8_rank2

    subroutine allocate_and_copy_int8_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int8_rank3

    subroutine copy_int8_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int8_rank3

    subroutine allocate_and_copy_int8_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int8_rank4

    subroutine copy_int8_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:,:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int8_rank4

    subroutine allocate_and_copy_int8_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:,:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%copy(dst, src)
    end subroutine allocate_and_copy_int8_rank5

    subroutine copy_int8_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:,:,:,:,:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_int8_rank5

    subroutine allocate_and_copy_to_scratch_from_storage(this, dst, scratch, src, astream)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        class(data_storage), intent(in) :: src
        type(stream), intent(in), optional :: astream

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src, astream)
    end subroutine allocate_and_copy_to_scratch_from_storage

    subroutine copy_to_scratch_from_storage(this, dst, scratch, src, astream)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        class(data_storage), intent(in) :: src
        type(stream), intent(in), optional :: astream

        call this%create_in_scratch(dst, scratch, src%number_of_bytes)
        call memory_manager%copy_storage(src, dst, astream)
    end subroutine copy_to_scratch_from_storage

    subroutine allocate_and_copy_to_scratch_complex128_rank0(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_complex128_rank0

    subroutine copy_to_scratch_complex128_rank0(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), intent(in) :: src

         call this%create_in_scratch(dst, scratch, int(storage_size((1.0_real64, 1.0_real64))/8, int64))
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_complex128_rank0

    subroutine allocate_and_copy_to_scratch_complex128_rank1(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_complex128_rank1

    subroutine copy_to_scratch_complex128_rank1(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size((1.0_real64, 1.0_real64))/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_complex128_rank1

    subroutine allocate_and_copy_to_scratch_complex128_rank2(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_complex128_rank2

    subroutine copy_to_scratch_complex128_rank2(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size((1.0_real64, 1.0_real64))/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_complex128_rank2

    subroutine allocate_and_copy_to_scratch_complex128_rank3(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_complex128_rank3

    subroutine copy_to_scratch_complex128_rank3(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size((1.0_real64, 1.0_real64))/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_complex128_rank3

    subroutine allocate_and_copy_to_scratch_complex128_rank4(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:,:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_complex128_rank4

    subroutine copy_to_scratch_complex128_rank4(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:,:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size((1.0_real64, 1.0_real64))/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_complex128_rank4

    subroutine allocate_and_copy_to_scratch_complex128_rank5(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:,:,:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_complex128_rank5

    subroutine copy_to_scratch_complex128_rank5(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real64), dimension(:,:,:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size((1.0_real64, 1.0_real64))/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_complex128_rank5

    subroutine allocate_and_copy_to_scratch_complex64_rank0(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_complex64_rank0

    subroutine copy_to_scratch_complex64_rank0(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), intent(in) :: src

         call this%create_in_scratch(dst, scratch, int(storage_size((1.0_real32, 1.0_real32))/8, int64))
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_complex64_rank0

    subroutine allocate_and_copy_to_scratch_complex64_rank1(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_complex64_rank1

    subroutine copy_to_scratch_complex64_rank1(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size((1.0_real32, 1.0_real32))/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_complex64_rank1

    subroutine allocate_and_copy_to_scratch_complex64_rank2(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_complex64_rank2

    subroutine copy_to_scratch_complex64_rank2(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size((1.0_real32, 1.0_real32))/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_complex64_rank2

    subroutine allocate_and_copy_to_scratch_complex64_rank3(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_complex64_rank3

    subroutine copy_to_scratch_complex64_rank3(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size((1.0_real32, 1.0_real32))/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_complex64_rank3

    subroutine allocate_and_copy_to_scratch_complex64_rank4(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:,:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_complex64_rank4

    subroutine copy_to_scratch_complex64_rank4(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:,:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size((1.0_real32, 1.0_real32))/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_complex64_rank4

    subroutine allocate_and_copy_to_scratch_complex64_rank5(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:,:,:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_complex64_rank5

    subroutine copy_to_scratch_complex64_rank5(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        complex(real32), dimension(:,:,:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size((1.0_real32, 1.0_real32))/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_complex64_rank5

    subroutine allocate_and_copy_to_scratch_real64_rank0(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_real64_rank0

    subroutine copy_to_scratch_real64_rank0(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), intent(in) :: src

         call this%create_in_scratch(dst, scratch, int(storage_size(1.0_real64)/8, int64))
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_real64_rank0

    subroutine allocate_and_copy_to_scratch_real64_rank1(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_real64_rank1

    subroutine copy_to_scratch_real64_rank1(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1.0_real64)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_real64_rank1

    subroutine allocate_and_copy_to_scratch_real64_rank2(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_real64_rank2

    subroutine copy_to_scratch_real64_rank2(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1.0_real64)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_real64_rank2

    subroutine allocate_and_copy_to_scratch_real64_rank3(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_real64_rank3

    subroutine copy_to_scratch_real64_rank3(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1.0_real64)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_real64_rank3

    subroutine allocate_and_copy_to_scratch_real64_rank4(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:,:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_real64_rank4

    subroutine copy_to_scratch_real64_rank4(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:,:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1.0_real64)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_real64_rank4

    subroutine allocate_and_copy_to_scratch_real64_rank5(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:,:,:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_real64_rank5

    subroutine copy_to_scratch_real64_rank5(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real64), dimension(:,:,:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1.0_real64)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_real64_rank5

    subroutine allocate_and_copy_to_scratch_real32_rank0(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_real32_rank0

    subroutine copy_to_scratch_real32_rank0(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), intent(in) :: src

         call this%create_in_scratch(dst, scratch, int(storage_size(1.0_real32)/8, int64))
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_real32_rank0

    subroutine allocate_and_copy_to_scratch_real32_rank1(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_real32_rank1

    subroutine copy_to_scratch_real32_rank1(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1.0_real32)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_real32_rank1

    subroutine allocate_and_copy_to_scratch_real32_rank2(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_real32_rank2

    subroutine copy_to_scratch_real32_rank2(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1.0_real32)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_real32_rank2

    subroutine allocate_and_copy_to_scratch_real32_rank3(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_real32_rank3

    subroutine copy_to_scratch_real32_rank3(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1.0_real32)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_real32_rank3

    subroutine allocate_and_copy_to_scratch_real32_rank4(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:,:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_real32_rank4

    subroutine copy_to_scratch_real32_rank4(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:,:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1.0_real32)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_real32_rank4

    subroutine allocate_and_copy_to_scratch_real32_rank5(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:,:,:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_real32_rank5

    subroutine copy_to_scratch_real32_rank5(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        real(real32), dimension(:,:,:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1.0_real32)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_real32_rank5

    subroutine allocate_and_copy_to_scratch_int64_rank0(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int64_rank0

    subroutine copy_to_scratch_int64_rank0(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), intent(in) :: src

         call this%create_in_scratch(dst, scratch, int(storage_size(1_int64)/8, int64))
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int64_rank0

    subroutine allocate_and_copy_to_scratch_int64_rank1(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int64_rank1

    subroutine copy_to_scratch_int64_rank1(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int64)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int64_rank1

    subroutine allocate_and_copy_to_scratch_int64_rank2(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int64_rank2

    subroutine copy_to_scratch_int64_rank2(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int64)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int64_rank2

    subroutine allocate_and_copy_to_scratch_int64_rank3(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int64_rank3

    subroutine copy_to_scratch_int64_rank3(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int64)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int64_rank3

    subroutine allocate_and_copy_to_scratch_int64_rank4(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:,:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int64_rank4

    subroutine copy_to_scratch_int64_rank4(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:,:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int64)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int64_rank4

    subroutine allocate_and_copy_to_scratch_int64_rank5(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:,:,:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int64_rank5

    subroutine copy_to_scratch_int64_rank5(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int64), dimension(:,:,:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int64)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int64_rank5

    subroutine allocate_and_copy_to_scratch_int32_rank0(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int32_rank0

    subroutine copy_to_scratch_int32_rank0(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), intent(in) :: src

         call this%create_in_scratch(dst, scratch, int(storage_size(1_int32)/8, int64))
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int32_rank0

    subroutine allocate_and_copy_to_scratch_int32_rank1(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int32_rank1

    subroutine copy_to_scratch_int32_rank1(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int32)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int32_rank1

    subroutine allocate_and_copy_to_scratch_int32_rank2(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int32_rank2

    subroutine copy_to_scratch_int32_rank2(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int32)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int32_rank2

    subroutine allocate_and_copy_to_scratch_int32_rank3(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int32_rank3

    subroutine copy_to_scratch_int32_rank3(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int32)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int32_rank3

    subroutine allocate_and_copy_to_scratch_int32_rank4(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:,:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int32_rank4

    subroutine copy_to_scratch_int32_rank4(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:,:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int32)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int32_rank4

    subroutine allocate_and_copy_to_scratch_int32_rank5(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:,:,:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int32_rank5

    subroutine copy_to_scratch_int32_rank5(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int32), dimension(:,:,:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int32)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int32_rank5

    subroutine allocate_and_copy_to_scratch_int16_rank0(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int16_rank0

    subroutine copy_to_scratch_int16_rank0(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), intent(in) :: src

         call this%create_in_scratch(dst, scratch, int(storage_size(1_int16)/8, int64))
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int16_rank0

    subroutine allocate_and_copy_to_scratch_int16_rank1(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int16_rank1

    subroutine copy_to_scratch_int16_rank1(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int16)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int16_rank1

    subroutine allocate_and_copy_to_scratch_int16_rank2(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int16_rank2

    subroutine copy_to_scratch_int16_rank2(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int16)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int16_rank2

    subroutine allocate_and_copy_to_scratch_int16_rank3(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int16_rank3

    subroutine copy_to_scratch_int16_rank3(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int16)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int16_rank3

    subroutine allocate_and_copy_to_scratch_int16_rank4(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:,:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int16_rank4

    subroutine copy_to_scratch_int16_rank4(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:,:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int16)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int16_rank4

    subroutine allocate_and_copy_to_scratch_int16_rank5(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:,:,:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int16_rank5

    subroutine copy_to_scratch_int16_rank5(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int16), dimension(:,:,:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int16)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int16_rank5

    subroutine allocate_and_copy_to_scratch_int8_rank0(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int8_rank0

    subroutine copy_to_scratch_int8_rank0(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), intent(in) :: src

         call this%create_in_scratch(dst, scratch, int(storage_size(1_int8)/8, int64))
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int8_rank0

    subroutine allocate_and_copy_to_scratch_int8_rank1(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int8_rank1

    subroutine copy_to_scratch_int8_rank1(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int8)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int8_rank1

    subroutine allocate_and_copy_to_scratch_int8_rank2(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int8_rank2

    subroutine copy_to_scratch_int8_rank2(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int8)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int8_rank2

    subroutine allocate_and_copy_to_scratch_int8_rank3(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int8_rank3

    subroutine copy_to_scratch_int8_rank3(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int8)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int8_rank3

    subroutine allocate_and_copy_to_scratch_int8_rank4(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:,:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int8_rank4

    subroutine copy_to_scratch_int8_rank4(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:,:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int8)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int8_rank4

    subroutine allocate_and_copy_to_scratch_int8_rank5(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:,:,:,:,:), intent(in) :: src

        call scratch%allocate_storage_object(dst)
        call this%copy_to_scratch(dst, scratch, src)

    end subroutine allocate_and_copy_to_scratch_int8_rank5

    subroutine copy_to_scratch_int8_rank5(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        integer(int8), dimension(:,:,:,:,:), intent(in) :: src

         call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_int8)/8)
         call memory_manager%copy_storage(this%converter%get_host_storage(src), dst)
    end subroutine copy_to_scratch_int8_rank5

    subroutine allocate_and_point_to_from_storage(this, dst, src, astream)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        class(data_storage), intent(in) :: src
        type(stream), intent(in), optional :: astream

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src, astream)
    end subroutine allocate_and_point_to_from_storage

    subroutine point_to_from_storage(this, dst, src, astream)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        class(data_storage), intent(in) :: src
        type(stream), intent(in), optional :: astream

        call memory_manager%secure_local_storage(src, dst, astream)
    end subroutine point_to_from_storage

    subroutine allocate_and_point_to_complex128_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_complex128_rank0

    subroutine point_to_complex128_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real64), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_complex128_rank0

    subroutine allocate_and_point_to_complex128_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_complex128_rank1

    subroutine point_to_complex128_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_complex128_rank1

    subroutine allocate_and_point_to_complex128_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_complex128_rank2

    subroutine point_to_complex128_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_complex128_rank2

    subroutine allocate_and_point_to_complex128_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_complex128_rank3

    subroutine point_to_complex128_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_complex128_rank3

    subroutine allocate_and_point_to_complex128_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_complex128_rank4

    subroutine point_to_complex128_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:,:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_complex128_rank4

    subroutine allocate_and_point_to_complex128_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real64), dimension(:,:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_complex128_rank5

    subroutine point_to_complex128_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real64), dimension(:,:,:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_complex128_rank5

    subroutine allocate_and_point_to_complex64_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_complex64_rank0

    subroutine point_to_complex64_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real32), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_complex64_rank0

    subroutine allocate_and_point_to_complex64_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_complex64_rank1

    subroutine point_to_complex64_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_complex64_rank1

    subroutine allocate_and_point_to_complex64_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_complex64_rank2

    subroutine point_to_complex64_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_complex64_rank2

    subroutine allocate_and_point_to_complex64_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_complex64_rank3

    subroutine point_to_complex64_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_complex64_rank3

    subroutine allocate_and_point_to_complex64_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_complex64_rank4

    subroutine point_to_complex64_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:,:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_complex64_rank4

    subroutine allocate_and_point_to_complex64_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        complex(real32), dimension(:,:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_complex64_rank5

    subroutine point_to_complex64_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        complex(real32), dimension(:,:,:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_complex64_rank5

    subroutine allocate_and_point_to_real64_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_real64_rank0

    subroutine point_to_real64_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real64), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_real64_rank0

    subroutine allocate_and_point_to_real64_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_real64_rank1

    subroutine point_to_real64_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_real64_rank1

    subroutine allocate_and_point_to_real64_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_real64_rank2

    subroutine point_to_real64_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_real64_rank2

    subroutine allocate_and_point_to_real64_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_real64_rank3

    subroutine point_to_real64_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_real64_rank3

    subroutine allocate_and_point_to_real64_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_real64_rank4

    subroutine point_to_real64_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:,:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_real64_rank4

    subroutine allocate_and_point_to_real64_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real64), dimension(:,:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_real64_rank5

    subroutine point_to_real64_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real64), dimension(:,:,:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_real64_rank5

    subroutine allocate_and_point_to_real32_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_real32_rank0

    subroutine point_to_real32_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real32), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_real32_rank0

    subroutine allocate_and_point_to_real32_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_real32_rank1

    subroutine point_to_real32_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_real32_rank1

    subroutine allocate_and_point_to_real32_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_real32_rank2

    subroutine point_to_real32_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_real32_rank2

    subroutine allocate_and_point_to_real32_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_real32_rank3

    subroutine point_to_real32_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_real32_rank3

    subroutine allocate_and_point_to_real32_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_real32_rank4

    subroutine point_to_real32_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:,:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_real32_rank4

    subroutine allocate_and_point_to_real32_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        real(real32), dimension(:,:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_real32_rank5

    subroutine point_to_real32_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        real(real32), dimension(:,:,:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_real32_rank5

    subroutine allocate_and_point_to_int64_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int64_rank0

    subroutine point_to_int64_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int64), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int64_rank0

    subroutine allocate_and_point_to_int64_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int64_rank1

    subroutine point_to_int64_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int64_rank1

    subroutine allocate_and_point_to_int64_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int64_rank2

    subroutine point_to_int64_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int64_rank2

    subroutine allocate_and_point_to_int64_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int64_rank3

    subroutine point_to_int64_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int64_rank3

    subroutine allocate_and_point_to_int64_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int64_rank4

    subroutine point_to_int64_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:,:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int64_rank4

    subroutine allocate_and_point_to_int64_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int64), dimension(:,:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int64_rank5

    subroutine point_to_int64_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int64), dimension(:,:,:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int64_rank5

    subroutine allocate_and_point_to_int32_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int32_rank0

    subroutine point_to_int32_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int32), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int32_rank0

    subroutine allocate_and_point_to_int32_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int32_rank1

    subroutine point_to_int32_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int32_rank1

    subroutine allocate_and_point_to_int32_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int32_rank2

    subroutine point_to_int32_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int32_rank2

    subroutine allocate_and_point_to_int32_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int32_rank3

    subroutine point_to_int32_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int32_rank3

    subroutine allocate_and_point_to_int32_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int32_rank4

    subroutine point_to_int32_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:,:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int32_rank4

    subroutine allocate_and_point_to_int32_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int32), dimension(:,:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int32_rank5

    subroutine point_to_int32_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int32), dimension(:,:,:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int32_rank5

    subroutine allocate_and_point_to_int16_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int16_rank0

    subroutine point_to_int16_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int16), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int16_rank0

    subroutine allocate_and_point_to_int16_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int16_rank1

    subroutine point_to_int16_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int16_rank1

    subroutine allocate_and_point_to_int16_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int16_rank2

    subroutine point_to_int16_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int16_rank2

    subroutine allocate_and_point_to_int16_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int16_rank3

    subroutine point_to_int16_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int16_rank3

    subroutine allocate_and_point_to_int16_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int16_rank4

    subroutine point_to_int16_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:,:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int16_rank4

    subroutine allocate_and_point_to_int16_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int16), dimension(:,:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int16_rank5

    subroutine point_to_int16_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int16), dimension(:,:,:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int16_rank5

    subroutine allocate_and_point_to_int8_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int8_rank0

    subroutine point_to_int8_rank0(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int8), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int8_rank0

    subroutine allocate_and_point_to_int8_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int8_rank1

    subroutine point_to_int8_rank1(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int8_rank1

    subroutine allocate_and_point_to_int8_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int8_rank2

    subroutine point_to_int8_rank2(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int8_rank2

    subroutine allocate_and_point_to_int8_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int8_rank3

    subroutine point_to_int8_rank3(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int8_rank3

    subroutine allocate_and_point_to_int8_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int8_rank4

    subroutine point_to_int8_rank4(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:,:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int8_rank4

    subroutine allocate_and_point_to_int8_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), allocatable, intent(inout) :: dst
        integer(int8), dimension(:,:,:,:,:), intent(in) :: src

        call this%builder%allocate_class(dst)
        call this%point_to(dst, src)
    end subroutine allocate_and_point_to_int8_rank5

    subroutine point_to_int8_rank5(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        integer(int8), dimension(:,:,:,:,:), intent(in) :: src

        call memory_manager%secure_local_storage(this%converter%get_host_storage(src), dst)
    end subroutine point_to_int8_rank5

    subroutine copy_c_ptr(this, dst, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(c_ptr), dimension(:), intent(in) :: src

        call memory_manager%copy_storage(this%converter%get_host_storage_from_c_ptr_array(src), dst)
    end subroutine copy_c_ptr

    subroutine copy_c_ptr_to_scratch(this, dst, scratch, src)
        class(storage_builder), intent(in) :: this
        class(data_storage), intent(inout) :: dst
        type(scratch_buffer), intent(inout) :: scratch
        type(c_ptr), dimension(:), intent(in) :: src

        call this%create_in_scratch(dst, scratch, size(src, kind=int64)*storage_size(1_c_intptr_t)/8)
        call memory_manager%copy_storage(this%converter%get_host_storage_from_c_ptr_array(src), dst)
    end subroutine copy_c_ptr_to_scratch

    subroutine cleanup(this)
        class(storage_builder), intent(inout) :: this

        call this%converter%cleanup()
        if ( allocated(this%builder) ) deallocate(this%builder)
        call this%clear()
    end subroutine cleanup

    subroutine clear(this)
        class(storage_builder), intent(inout) :: this
    end subroutine clear
end module storage_builder_module
