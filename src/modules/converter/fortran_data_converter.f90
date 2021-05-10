! Auto-generated. DO NOT MODIFY!
module fortran_data_converter_module
    use, intrinsic :: iso_fortran_env, only : &
            int64, &
            real64, &
            real32, &
            int32, &
            int16, &
            int8
    use, intrinsic :: iso_c_binding, only : &
            c_ptr
    use :: memory_api, only : &
            memory_manager, &
            data_storage
    use :: concurrency_api, only : &
            stream
    use :: host_memory_plugin, only : &
            host_storage
    use :: fortran_host_converter_module, only : &
            fortran_host_converter, &
            secure_c_ptr_array_from_host, &
            create_host_storage_from_c_ptr_array

    implicit none
    private

    public :: fortran_data_converter
    public :: secure_fortran_pointer_from_remote_storage
    public :: update_remote_storage_from_pointer
    public :: release_pointer_from_remote_storage
    public :: update_remote_storage_and_release_pointer

    type :: fortran_data_converter
        type(fortran_host_converter) :: converter
    contains
        generic :: secure_fortran_pointer => &
                secure_fortran_pointer_complex128_rank0, &
                secure_fortran_pointer_complex64_rank0, &
                secure_fortran_pointer_real64_rank0, &
                secure_fortran_pointer_real32_rank0, &
                secure_fortran_pointer_int64_rank0, &
                secure_fortran_pointer_int32_rank0, &
                secure_fortran_pointer_int16_rank0, &
                secure_fortran_pointer_int8_rank0, &
                secure_fortran_pointer_complex128_rank1_from_integer, &
                secure_fortran_pointer_complex128_rank1_from_int64, &
                secure_fortran_pointer_complex128_rank2_from_integer, &
                secure_fortran_pointer_complex128_rank2_from_int64, &
                secure_fortran_pointer_complex128_rank3_from_integer, &
                secure_fortran_pointer_complex128_rank3_from_int64, &
                secure_fortran_pointer_complex128_rank4_from_integer, &
                secure_fortran_pointer_complex128_rank4_from_int64, &
                secure_fortran_pointer_complex128_rank5_from_integer, &
                secure_fortran_pointer_complex128_rank5_from_int64, &
                secure_fortran_pointer_complex64_rank1_from_integer, &
                secure_fortran_pointer_complex64_rank1_from_int64, &
                secure_fortran_pointer_complex64_rank2_from_integer, &
                secure_fortran_pointer_complex64_rank2_from_int64, &
                secure_fortran_pointer_complex64_rank3_from_integer, &
                secure_fortran_pointer_complex64_rank3_from_int64, &
                secure_fortran_pointer_complex64_rank4_from_integer, &
                secure_fortran_pointer_complex64_rank4_from_int64, &
                secure_fortran_pointer_complex64_rank5_from_integer, &
                secure_fortran_pointer_complex64_rank5_from_int64, &
                secure_fortran_pointer_real64_rank1_from_integer, &
                secure_fortran_pointer_real64_rank1_from_int64, &
                secure_fortran_pointer_real64_rank2_from_integer, &
                secure_fortran_pointer_real64_rank2_from_int64, &
                secure_fortran_pointer_real64_rank3_from_integer, &
                secure_fortran_pointer_real64_rank3_from_int64, &
                secure_fortran_pointer_real64_rank4_from_integer, &
                secure_fortran_pointer_real64_rank4_from_int64, &
                secure_fortran_pointer_real64_rank5_from_integer, &
                secure_fortran_pointer_real64_rank5_from_int64, &
                secure_fortran_pointer_real32_rank1_from_integer, &
                secure_fortran_pointer_real32_rank1_from_int64, &
                secure_fortran_pointer_real32_rank2_from_integer, &
                secure_fortran_pointer_real32_rank2_from_int64, &
                secure_fortran_pointer_real32_rank3_from_integer, &
                secure_fortran_pointer_real32_rank3_from_int64, &
                secure_fortran_pointer_real32_rank4_from_integer, &
                secure_fortran_pointer_real32_rank4_from_int64, &
                secure_fortran_pointer_real32_rank5_from_integer, &
                secure_fortran_pointer_real32_rank5_from_int64, &
                secure_fortran_pointer_int64_rank1_from_integer, &
                secure_fortran_pointer_int64_rank1_from_int64, &
                secure_fortran_pointer_int64_rank2_from_integer, &
                secure_fortran_pointer_int64_rank2_from_int64, &
                secure_fortran_pointer_int64_rank3_from_integer, &
                secure_fortran_pointer_int64_rank3_from_int64, &
                secure_fortran_pointer_int64_rank4_from_integer, &
                secure_fortran_pointer_int64_rank4_from_int64, &
                secure_fortran_pointer_int64_rank5_from_integer, &
                secure_fortran_pointer_int64_rank5_from_int64, &
                secure_fortran_pointer_int32_rank1_from_integer, &
                secure_fortran_pointer_int32_rank1_from_int64, &
                secure_fortran_pointer_int32_rank2_from_integer, &
                secure_fortran_pointer_int32_rank2_from_int64, &
                secure_fortran_pointer_int32_rank3_from_integer, &
                secure_fortran_pointer_int32_rank3_from_int64, &
                secure_fortran_pointer_int32_rank4_from_integer, &
                secure_fortran_pointer_int32_rank4_from_int64, &
                secure_fortran_pointer_int32_rank5_from_integer, &
                secure_fortran_pointer_int32_rank5_from_int64, &
                secure_fortran_pointer_int16_rank1_from_integer, &
                secure_fortran_pointer_int16_rank1_from_int64, &
                secure_fortran_pointer_int16_rank2_from_integer, &
                secure_fortran_pointer_int16_rank2_from_int64, &
                secure_fortran_pointer_int16_rank3_from_integer, &
                secure_fortran_pointer_int16_rank3_from_int64, &
                secure_fortran_pointer_int16_rank4_from_integer, &
                secure_fortran_pointer_int16_rank4_from_int64, &
                secure_fortran_pointer_int16_rank5_from_integer, &
                secure_fortran_pointer_int16_rank5_from_int64, &
                secure_fortran_pointer_int8_rank1_from_integer, &
                secure_fortran_pointer_int8_rank1_from_int64, &
                secure_fortran_pointer_int8_rank2_from_integer, &
                secure_fortran_pointer_int8_rank2_from_int64, &
                secure_fortran_pointer_int8_rank3_from_integer, &
                secure_fortran_pointer_int8_rank3_from_int64, &
                secure_fortran_pointer_int8_rank4_from_integer, &
                secure_fortran_pointer_int8_rank4_from_int64, &
                secure_fortran_pointer_int8_rank5_from_integer, &
                secure_fortran_pointer_int8_rank5_from_int64
        generic :: update_remote => &
                update_remote_complex128_rank0, &
                update_remote_complex128_rank1, &
                update_remote_complex128_rank2, &
                update_remote_complex128_rank3, &
                update_remote_complex128_rank4, &
                update_remote_complex128_rank5, &
                update_remote_complex64_rank0, &
                update_remote_complex64_rank1, &
                update_remote_complex64_rank2, &
                update_remote_complex64_rank3, &
                update_remote_complex64_rank4, &
                update_remote_complex64_rank5, &
                update_remote_real64_rank0, &
                update_remote_real64_rank1, &
                update_remote_real64_rank2, &
                update_remote_real64_rank3, &
                update_remote_real64_rank4, &
                update_remote_real64_rank5, &
                update_remote_real32_rank0, &
                update_remote_real32_rank1, &
                update_remote_real32_rank2, &
                update_remote_real32_rank3, &
                update_remote_real32_rank4, &
                update_remote_real32_rank5, &
                update_remote_int64_rank0, &
                update_remote_int64_rank1, &
                update_remote_int64_rank2, &
                update_remote_int64_rank3, &
                update_remote_int64_rank4, &
                update_remote_int64_rank5, &
                update_remote_int32_rank0, &
                update_remote_int32_rank1, &
                update_remote_int32_rank2, &
                update_remote_int32_rank3, &
                update_remote_int32_rank4, &
                update_remote_int32_rank5, &
                update_remote_int16_rank0, &
                update_remote_int16_rank1, &
                update_remote_int16_rank2, &
                update_remote_int16_rank3, &
                update_remote_int16_rank4, &
                update_remote_int16_rank5, &
                update_remote_int8_rank0, &
                update_remote_int8_rank1, &
                update_remote_int8_rank2, &
                update_remote_int8_rank3, &
                update_remote_int8_rank4, &
                update_remote_int8_rank5
        generic :: release_pointer => &
                release_pointer_complex128_rank0, &
                release_pointer_complex128_rank1, &
                release_pointer_complex128_rank2, &
                release_pointer_complex128_rank3, &
                release_pointer_complex128_rank4, &
                release_pointer_complex128_rank5, &
                release_pointer_complex64_rank0, &
                release_pointer_complex64_rank1, &
                release_pointer_complex64_rank2, &
                release_pointer_complex64_rank3, &
                release_pointer_complex64_rank4, &
                release_pointer_complex64_rank5, &
                release_pointer_real64_rank0, &
                release_pointer_real64_rank1, &
                release_pointer_real64_rank2, &
                release_pointer_real64_rank3, &
                release_pointer_real64_rank4, &
                release_pointer_real64_rank5, &
                release_pointer_real32_rank0, &
                release_pointer_real32_rank1, &
                release_pointer_real32_rank2, &
                release_pointer_real32_rank3, &
                release_pointer_real32_rank4, &
                release_pointer_real32_rank5, &
                release_pointer_int64_rank0, &
                release_pointer_int64_rank1, &
                release_pointer_int64_rank2, &
                release_pointer_int64_rank3, &
                release_pointer_int64_rank4, &
                release_pointer_int64_rank5, &
                release_pointer_int32_rank0, &
                release_pointer_int32_rank1, &
                release_pointer_int32_rank2, &
                release_pointer_int32_rank3, &
                release_pointer_int32_rank4, &
                release_pointer_int32_rank5, &
                release_pointer_int16_rank0, &
                release_pointer_int16_rank1, &
                release_pointer_int16_rank2, &
                release_pointer_int16_rank3, &
                release_pointer_int16_rank4, &
                release_pointer_int16_rank5, &
                release_pointer_int8_rank0, &
                release_pointer_int8_rank1, &
                release_pointer_int8_rank2, &
                release_pointer_int8_rank3, &
                release_pointer_int8_rank4, &
                release_pointer_int8_rank5
        generic :: update_remote_and_release_pointer => &
                update_remote_and_release_pointer_complex128_rank0, &
                update_remote_and_release_pointer_complex128_rank1, &
                update_remote_and_release_pointer_complex128_rank2, &
                update_remote_and_release_pointer_complex128_rank3, &
                update_remote_and_release_pointer_complex128_rank4, &
                update_remote_and_release_pointer_complex128_rank5, &
                update_remote_and_release_pointer_complex64_rank0, &
                update_remote_and_release_pointer_complex64_rank1, &
                update_remote_and_release_pointer_complex64_rank2, &
                update_remote_and_release_pointer_complex64_rank3, &
                update_remote_and_release_pointer_complex64_rank4, &
                update_remote_and_release_pointer_complex64_rank5, &
                update_remote_and_release_pointer_real64_rank0, &
                update_remote_and_release_pointer_real64_rank1, &
                update_remote_and_release_pointer_real64_rank2, &
                update_remote_and_release_pointer_real64_rank3, &
                update_remote_and_release_pointer_real64_rank4, &
                update_remote_and_release_pointer_real64_rank5, &
                update_remote_and_release_pointer_real32_rank0, &
                update_remote_and_release_pointer_real32_rank1, &
                update_remote_and_release_pointer_real32_rank2, &
                update_remote_and_release_pointer_real32_rank3, &
                update_remote_and_release_pointer_real32_rank4, &
                update_remote_and_release_pointer_real32_rank5, &
                update_remote_and_release_pointer_int64_rank0, &
                update_remote_and_release_pointer_int64_rank1, &
                update_remote_and_release_pointer_int64_rank2, &
                update_remote_and_release_pointer_int64_rank3, &
                update_remote_and_release_pointer_int64_rank4, &
                update_remote_and_release_pointer_int64_rank5, &
                update_remote_and_release_pointer_int32_rank0, &
                update_remote_and_release_pointer_int32_rank1, &
                update_remote_and_release_pointer_int32_rank2, &
                update_remote_and_release_pointer_int32_rank3, &
                update_remote_and_release_pointer_int32_rank4, &
                update_remote_and_release_pointer_int32_rank5, &
                update_remote_and_release_pointer_int16_rank0, &
                update_remote_and_release_pointer_int16_rank1, &
                update_remote_and_release_pointer_int16_rank2, &
                update_remote_and_release_pointer_int16_rank3, &
                update_remote_and_release_pointer_int16_rank4, &
                update_remote_and_release_pointer_int16_rank5, &
                update_remote_and_release_pointer_int8_rank0, &
                update_remote_and_release_pointer_int8_rank1, &
                update_remote_and_release_pointer_int8_rank2, &
                update_remote_and_release_pointer_int8_rank3, &
                update_remote_and_release_pointer_int8_rank4, &
                update_remote_and_release_pointer_int8_rank5
        procedure :: secure_fortran_pointer_complex128_rank0 => secure_fortran_pointer_complex128_rank0
        procedure :: secure_fortran_pointer_complex64_rank0 => secure_fortran_pointer_complex64_rank0
        procedure :: secure_fortran_pointer_real64_rank0 => secure_fortran_pointer_real64_rank0
        procedure :: secure_fortran_pointer_real32_rank0 => secure_fortran_pointer_real32_rank0
        procedure :: secure_fortran_pointer_int64_rank0 => secure_fortran_pointer_int64_rank0
        procedure :: secure_fortran_pointer_int32_rank0 => secure_fortran_pointer_int32_rank0
        procedure :: secure_fortran_pointer_int16_rank0 => secure_fortran_pointer_int16_rank0
        procedure :: secure_fortran_pointer_int8_rank0 => secure_fortran_pointer_int8_rank0
        procedure :: secure_fortran_pointer_complex128_rank1_from_integer => &
                secure_fortran_pointer_complex128_rank1_from_integer
        procedure :: secure_fortran_pointer_complex128_rank1_from_int64 => &
                secure_fortran_pointer_complex128_rank1_from_int64
        procedure :: secure_fortran_pointer_complex128_rank2_from_integer => &
                secure_fortran_pointer_complex128_rank2_from_integer
        procedure :: secure_fortran_pointer_complex128_rank2_from_int64 => &
                secure_fortran_pointer_complex128_rank2_from_int64
        procedure :: secure_fortran_pointer_complex128_rank3_from_integer => &
                secure_fortran_pointer_complex128_rank3_from_integer
        procedure :: secure_fortran_pointer_complex128_rank3_from_int64 => &
                secure_fortran_pointer_complex128_rank3_from_int64
        procedure :: secure_fortran_pointer_complex128_rank4_from_integer => &
                secure_fortran_pointer_complex128_rank4_from_integer
        procedure :: secure_fortran_pointer_complex128_rank4_from_int64 => &
                secure_fortran_pointer_complex128_rank4_from_int64
        procedure :: secure_fortran_pointer_complex128_rank5_from_integer => &
                secure_fortran_pointer_complex128_rank5_from_integer
        procedure :: secure_fortran_pointer_complex128_rank5_from_int64 => &
                secure_fortran_pointer_complex128_rank5_from_int64
        procedure :: secure_fortran_pointer_complex64_rank1_from_integer => &
                secure_fortran_pointer_complex64_rank1_from_integer
        procedure :: secure_fortran_pointer_complex64_rank1_from_int64 => &
                secure_fortran_pointer_complex64_rank1_from_int64
        procedure :: secure_fortran_pointer_complex64_rank2_from_integer => &
                secure_fortran_pointer_complex64_rank2_from_integer
        procedure :: secure_fortran_pointer_complex64_rank2_from_int64 => &
                secure_fortran_pointer_complex64_rank2_from_int64
        procedure :: secure_fortran_pointer_complex64_rank3_from_integer => &
                secure_fortran_pointer_complex64_rank3_from_integer
        procedure :: secure_fortran_pointer_complex64_rank3_from_int64 => &
                secure_fortran_pointer_complex64_rank3_from_int64
        procedure :: secure_fortran_pointer_complex64_rank4_from_integer => &
                secure_fortran_pointer_complex64_rank4_from_integer
        procedure :: secure_fortran_pointer_complex64_rank4_from_int64 => &
                secure_fortran_pointer_complex64_rank4_from_int64
        procedure :: secure_fortran_pointer_complex64_rank5_from_integer => &
                secure_fortran_pointer_complex64_rank5_from_integer
        procedure :: secure_fortran_pointer_complex64_rank5_from_int64 => &
                secure_fortran_pointer_complex64_rank5_from_int64
        procedure :: secure_fortran_pointer_real64_rank1_from_integer => &
                secure_fortran_pointer_real64_rank1_from_integer
        procedure :: secure_fortran_pointer_real64_rank1_from_int64 => secure_fortran_pointer_real64_rank1_from_int64
        procedure :: secure_fortran_pointer_real64_rank2_from_integer => &
                secure_fortran_pointer_real64_rank2_from_integer
        procedure :: secure_fortran_pointer_real64_rank2_from_int64 => secure_fortran_pointer_real64_rank2_from_int64
        procedure :: secure_fortran_pointer_real64_rank3_from_integer => &
                secure_fortran_pointer_real64_rank3_from_integer
        procedure :: secure_fortran_pointer_real64_rank3_from_int64 => secure_fortran_pointer_real64_rank3_from_int64
        procedure :: secure_fortran_pointer_real64_rank4_from_integer => &
                secure_fortran_pointer_real64_rank4_from_integer
        procedure :: secure_fortran_pointer_real64_rank4_from_int64 => secure_fortran_pointer_real64_rank4_from_int64
        procedure :: secure_fortran_pointer_real64_rank5_from_integer => &
                secure_fortran_pointer_real64_rank5_from_integer
        procedure :: secure_fortran_pointer_real64_rank5_from_int64 => secure_fortran_pointer_real64_rank5_from_int64
        procedure :: secure_fortran_pointer_real32_rank1_from_integer => &
                secure_fortran_pointer_real32_rank1_from_integer
        procedure :: secure_fortran_pointer_real32_rank1_from_int64 => secure_fortran_pointer_real32_rank1_from_int64
        procedure :: secure_fortran_pointer_real32_rank2_from_integer => &
                secure_fortran_pointer_real32_rank2_from_integer
        procedure :: secure_fortran_pointer_real32_rank2_from_int64 => secure_fortran_pointer_real32_rank2_from_int64
        procedure :: secure_fortran_pointer_real32_rank3_from_integer => &
                secure_fortran_pointer_real32_rank3_from_integer
        procedure :: secure_fortran_pointer_real32_rank3_from_int64 => secure_fortran_pointer_real32_rank3_from_int64
        procedure :: secure_fortran_pointer_real32_rank4_from_integer => &
                secure_fortran_pointer_real32_rank4_from_integer
        procedure :: secure_fortran_pointer_real32_rank4_from_int64 => secure_fortran_pointer_real32_rank4_from_int64
        procedure :: secure_fortran_pointer_real32_rank5_from_integer => &
                secure_fortran_pointer_real32_rank5_from_integer
        procedure :: secure_fortran_pointer_real32_rank5_from_int64 => secure_fortran_pointer_real32_rank5_from_int64
        procedure :: secure_fortran_pointer_int64_rank1_from_integer => &
                secure_fortran_pointer_int64_rank1_from_integer
        procedure :: secure_fortran_pointer_int64_rank1_from_int64 => secure_fortran_pointer_int64_rank1_from_int64
        procedure :: secure_fortran_pointer_int64_rank2_from_integer => &
                secure_fortran_pointer_int64_rank2_from_integer
        procedure :: secure_fortran_pointer_int64_rank2_from_int64 => secure_fortran_pointer_int64_rank2_from_int64
        procedure :: secure_fortran_pointer_int64_rank3_from_integer => &
                secure_fortran_pointer_int64_rank3_from_integer
        procedure :: secure_fortran_pointer_int64_rank3_from_int64 => secure_fortran_pointer_int64_rank3_from_int64
        procedure :: secure_fortran_pointer_int64_rank4_from_integer => &
                secure_fortran_pointer_int64_rank4_from_integer
        procedure :: secure_fortran_pointer_int64_rank4_from_int64 => secure_fortran_pointer_int64_rank4_from_int64
        procedure :: secure_fortran_pointer_int64_rank5_from_integer => &
                secure_fortran_pointer_int64_rank5_from_integer
        procedure :: secure_fortran_pointer_int64_rank5_from_int64 => secure_fortran_pointer_int64_rank5_from_int64
        procedure :: secure_fortran_pointer_int32_rank1_from_integer => &
                secure_fortran_pointer_int32_rank1_from_integer
        procedure :: secure_fortran_pointer_int32_rank1_from_int64 => secure_fortran_pointer_int32_rank1_from_int64
        procedure :: secure_fortran_pointer_int32_rank2_from_integer => &
                secure_fortran_pointer_int32_rank2_from_integer
        procedure :: secure_fortran_pointer_int32_rank2_from_int64 => secure_fortran_pointer_int32_rank2_from_int64
        procedure :: secure_fortran_pointer_int32_rank3_from_integer => &
                secure_fortran_pointer_int32_rank3_from_integer
        procedure :: secure_fortran_pointer_int32_rank3_from_int64 => secure_fortran_pointer_int32_rank3_from_int64
        procedure :: secure_fortran_pointer_int32_rank4_from_integer => &
                secure_fortran_pointer_int32_rank4_from_integer
        procedure :: secure_fortran_pointer_int32_rank4_from_int64 => secure_fortran_pointer_int32_rank4_from_int64
        procedure :: secure_fortran_pointer_int32_rank5_from_integer => &
                secure_fortran_pointer_int32_rank5_from_integer
        procedure :: secure_fortran_pointer_int32_rank5_from_int64 => secure_fortran_pointer_int32_rank5_from_int64
        procedure :: secure_fortran_pointer_int16_rank1_from_integer => &
                secure_fortran_pointer_int16_rank1_from_integer
        procedure :: secure_fortran_pointer_int16_rank1_from_int64 => secure_fortran_pointer_int16_rank1_from_int64
        procedure :: secure_fortran_pointer_int16_rank2_from_integer => &
                secure_fortran_pointer_int16_rank2_from_integer
        procedure :: secure_fortran_pointer_int16_rank2_from_int64 => secure_fortran_pointer_int16_rank2_from_int64
        procedure :: secure_fortran_pointer_int16_rank3_from_integer => &
                secure_fortran_pointer_int16_rank3_from_integer
        procedure :: secure_fortran_pointer_int16_rank3_from_int64 => secure_fortran_pointer_int16_rank3_from_int64
        procedure :: secure_fortran_pointer_int16_rank4_from_integer => &
                secure_fortran_pointer_int16_rank4_from_integer
        procedure :: secure_fortran_pointer_int16_rank4_from_int64 => secure_fortran_pointer_int16_rank4_from_int64
        procedure :: secure_fortran_pointer_int16_rank5_from_integer => &
                secure_fortran_pointer_int16_rank5_from_integer
        procedure :: secure_fortran_pointer_int16_rank5_from_int64 => secure_fortran_pointer_int16_rank5_from_int64
        procedure :: secure_fortran_pointer_int8_rank1_from_integer => secure_fortran_pointer_int8_rank1_from_integer
        procedure :: secure_fortran_pointer_int8_rank1_from_int64 => secure_fortran_pointer_int8_rank1_from_int64
        procedure :: secure_fortran_pointer_int8_rank2_from_integer => secure_fortran_pointer_int8_rank2_from_integer
        procedure :: secure_fortran_pointer_int8_rank2_from_int64 => secure_fortran_pointer_int8_rank2_from_int64
        procedure :: secure_fortran_pointer_int8_rank3_from_integer => secure_fortran_pointer_int8_rank3_from_integer
        procedure :: secure_fortran_pointer_int8_rank3_from_int64 => secure_fortran_pointer_int8_rank3_from_int64
        procedure :: secure_fortran_pointer_int8_rank4_from_integer => secure_fortran_pointer_int8_rank4_from_integer
        procedure :: secure_fortran_pointer_int8_rank4_from_int64 => secure_fortran_pointer_int8_rank4_from_int64
        procedure :: secure_fortran_pointer_int8_rank5_from_integer => secure_fortran_pointer_int8_rank5_from_integer
        procedure :: secure_fortran_pointer_int8_rank5_from_int64 => secure_fortran_pointer_int8_rank5_from_int64
        procedure :: update_remote_complex128_rank0 => update_remote_complex128_rank0
        procedure :: update_remote_complex128_rank1 => update_remote_complex128_rank1
        procedure :: update_remote_complex128_rank2 => update_remote_complex128_rank2
        procedure :: update_remote_complex128_rank3 => update_remote_complex128_rank3
        procedure :: update_remote_complex128_rank4 => update_remote_complex128_rank4
        procedure :: update_remote_complex128_rank5 => update_remote_complex128_rank5
        procedure :: update_remote_complex64_rank0 => update_remote_complex64_rank0
        procedure :: update_remote_complex64_rank1 => update_remote_complex64_rank1
        procedure :: update_remote_complex64_rank2 => update_remote_complex64_rank2
        procedure :: update_remote_complex64_rank3 => update_remote_complex64_rank3
        procedure :: update_remote_complex64_rank4 => update_remote_complex64_rank4
        procedure :: update_remote_complex64_rank5 => update_remote_complex64_rank5
        procedure :: update_remote_real64_rank0 => update_remote_real64_rank0
        procedure :: update_remote_real64_rank1 => update_remote_real64_rank1
        procedure :: update_remote_real64_rank2 => update_remote_real64_rank2
        procedure :: update_remote_real64_rank3 => update_remote_real64_rank3
        procedure :: update_remote_real64_rank4 => update_remote_real64_rank4
        procedure :: update_remote_real64_rank5 => update_remote_real64_rank5
        procedure :: update_remote_real32_rank0 => update_remote_real32_rank0
        procedure :: update_remote_real32_rank1 => update_remote_real32_rank1
        procedure :: update_remote_real32_rank2 => update_remote_real32_rank2
        procedure :: update_remote_real32_rank3 => update_remote_real32_rank3
        procedure :: update_remote_real32_rank4 => update_remote_real32_rank4
        procedure :: update_remote_real32_rank5 => update_remote_real32_rank5
        procedure :: update_remote_int64_rank0 => update_remote_int64_rank0
        procedure :: update_remote_int64_rank1 => update_remote_int64_rank1
        procedure :: update_remote_int64_rank2 => update_remote_int64_rank2
        procedure :: update_remote_int64_rank3 => update_remote_int64_rank3
        procedure :: update_remote_int64_rank4 => update_remote_int64_rank4
        procedure :: update_remote_int64_rank5 => update_remote_int64_rank5
        procedure :: update_remote_int32_rank0 => update_remote_int32_rank0
        procedure :: update_remote_int32_rank1 => update_remote_int32_rank1
        procedure :: update_remote_int32_rank2 => update_remote_int32_rank2
        procedure :: update_remote_int32_rank3 => update_remote_int32_rank3
        procedure :: update_remote_int32_rank4 => update_remote_int32_rank4
        procedure :: update_remote_int32_rank5 => update_remote_int32_rank5
        procedure :: update_remote_int16_rank0 => update_remote_int16_rank0
        procedure :: update_remote_int16_rank1 => update_remote_int16_rank1
        procedure :: update_remote_int16_rank2 => update_remote_int16_rank2
        procedure :: update_remote_int16_rank3 => update_remote_int16_rank3
        procedure :: update_remote_int16_rank4 => update_remote_int16_rank4
        procedure :: update_remote_int16_rank5 => update_remote_int16_rank5
        procedure :: update_remote_int8_rank0 => update_remote_int8_rank0
        procedure :: update_remote_int8_rank1 => update_remote_int8_rank1
        procedure :: update_remote_int8_rank2 => update_remote_int8_rank2
        procedure :: update_remote_int8_rank3 => update_remote_int8_rank3
        procedure :: update_remote_int8_rank4 => update_remote_int8_rank4
        procedure :: update_remote_int8_rank5 => update_remote_int8_rank5
        procedure :: release_pointer_complex128_rank0 => release_pointer_complex128_rank0
        procedure :: release_pointer_complex128_rank1 => release_pointer_complex128_rank1
        procedure :: release_pointer_complex128_rank2 => release_pointer_complex128_rank2
        procedure :: release_pointer_complex128_rank3 => release_pointer_complex128_rank3
        procedure :: release_pointer_complex128_rank4 => release_pointer_complex128_rank4
        procedure :: release_pointer_complex128_rank5 => release_pointer_complex128_rank5
        procedure :: release_pointer_complex64_rank0 => release_pointer_complex64_rank0
        procedure :: release_pointer_complex64_rank1 => release_pointer_complex64_rank1
        procedure :: release_pointer_complex64_rank2 => release_pointer_complex64_rank2
        procedure :: release_pointer_complex64_rank3 => release_pointer_complex64_rank3
        procedure :: release_pointer_complex64_rank4 => release_pointer_complex64_rank4
        procedure :: release_pointer_complex64_rank5 => release_pointer_complex64_rank5
        procedure :: release_pointer_real64_rank0 => release_pointer_real64_rank0
        procedure :: release_pointer_real64_rank1 => release_pointer_real64_rank1
        procedure :: release_pointer_real64_rank2 => release_pointer_real64_rank2
        procedure :: release_pointer_real64_rank3 => release_pointer_real64_rank3
        procedure :: release_pointer_real64_rank4 => release_pointer_real64_rank4
        procedure :: release_pointer_real64_rank5 => release_pointer_real64_rank5
        procedure :: release_pointer_real32_rank0 => release_pointer_real32_rank0
        procedure :: release_pointer_real32_rank1 => release_pointer_real32_rank1
        procedure :: release_pointer_real32_rank2 => release_pointer_real32_rank2
        procedure :: release_pointer_real32_rank3 => release_pointer_real32_rank3
        procedure :: release_pointer_real32_rank4 => release_pointer_real32_rank4
        procedure :: release_pointer_real32_rank5 => release_pointer_real32_rank5
        procedure :: release_pointer_int64_rank0 => release_pointer_int64_rank0
        procedure :: release_pointer_int64_rank1 => release_pointer_int64_rank1
        procedure :: release_pointer_int64_rank2 => release_pointer_int64_rank2
        procedure :: release_pointer_int64_rank3 => release_pointer_int64_rank3
        procedure :: release_pointer_int64_rank4 => release_pointer_int64_rank4
        procedure :: release_pointer_int64_rank5 => release_pointer_int64_rank5
        procedure :: release_pointer_int32_rank0 => release_pointer_int32_rank0
        procedure :: release_pointer_int32_rank1 => release_pointer_int32_rank1
        procedure :: release_pointer_int32_rank2 => release_pointer_int32_rank2
        procedure :: release_pointer_int32_rank3 => release_pointer_int32_rank3
        procedure :: release_pointer_int32_rank4 => release_pointer_int32_rank4
        procedure :: release_pointer_int32_rank5 => release_pointer_int32_rank5
        procedure :: release_pointer_int16_rank0 => release_pointer_int16_rank0
        procedure :: release_pointer_int16_rank1 => release_pointer_int16_rank1
        procedure :: release_pointer_int16_rank2 => release_pointer_int16_rank2
        procedure :: release_pointer_int16_rank3 => release_pointer_int16_rank3
        procedure :: release_pointer_int16_rank4 => release_pointer_int16_rank4
        procedure :: release_pointer_int16_rank5 => release_pointer_int16_rank5
        procedure :: release_pointer_int8_rank0 => release_pointer_int8_rank0
        procedure :: release_pointer_int8_rank1 => release_pointer_int8_rank1
        procedure :: release_pointer_int8_rank2 => release_pointer_int8_rank2
        procedure :: release_pointer_int8_rank3 => release_pointer_int8_rank3
        procedure :: release_pointer_int8_rank4 => release_pointer_int8_rank4
        procedure :: release_pointer_int8_rank5 => release_pointer_int8_rank5
        procedure :: update_remote_and_release_pointer_complex128_rank0 => &
                update_remote_and_release_pointer_complex128_rank0
        procedure :: update_remote_and_release_pointer_complex128_rank1 => &
                update_remote_and_release_pointer_complex128_rank1
        procedure :: update_remote_and_release_pointer_complex128_rank2 => &
                update_remote_and_release_pointer_complex128_rank2
        procedure :: update_remote_and_release_pointer_complex128_rank3 => &
                update_remote_and_release_pointer_complex128_rank3
        procedure :: update_remote_and_release_pointer_complex128_rank4 => &
                update_remote_and_release_pointer_complex128_rank4
        procedure :: update_remote_and_release_pointer_complex128_rank5 => &
                update_remote_and_release_pointer_complex128_rank5
        procedure :: update_remote_and_release_pointer_complex64_rank0 => &
                update_remote_and_release_pointer_complex64_rank0
        procedure :: update_remote_and_release_pointer_complex64_rank1 => &
                update_remote_and_release_pointer_complex64_rank1
        procedure :: update_remote_and_release_pointer_complex64_rank2 => &
                update_remote_and_release_pointer_complex64_rank2
        procedure :: update_remote_and_release_pointer_complex64_rank3 => &
                update_remote_and_release_pointer_complex64_rank3
        procedure :: update_remote_and_release_pointer_complex64_rank4 => &
                update_remote_and_release_pointer_complex64_rank4
        procedure :: update_remote_and_release_pointer_complex64_rank5 => &
                update_remote_and_release_pointer_complex64_rank5
        procedure :: update_remote_and_release_pointer_real64_rank0 => update_remote_and_release_pointer_real64_rank0
        procedure :: update_remote_and_release_pointer_real64_rank1 => update_remote_and_release_pointer_real64_rank1
        procedure :: update_remote_and_release_pointer_real64_rank2 => update_remote_and_release_pointer_real64_rank2
        procedure :: update_remote_and_release_pointer_real64_rank3 => update_remote_and_release_pointer_real64_rank3
        procedure :: update_remote_and_release_pointer_real64_rank4 => update_remote_and_release_pointer_real64_rank4
        procedure :: update_remote_and_release_pointer_real64_rank5 => update_remote_and_release_pointer_real64_rank5
        procedure :: update_remote_and_release_pointer_real32_rank0 => update_remote_and_release_pointer_real32_rank0
        procedure :: update_remote_and_release_pointer_real32_rank1 => update_remote_and_release_pointer_real32_rank1
        procedure :: update_remote_and_release_pointer_real32_rank2 => update_remote_and_release_pointer_real32_rank2
        procedure :: update_remote_and_release_pointer_real32_rank3 => update_remote_and_release_pointer_real32_rank3
        procedure :: update_remote_and_release_pointer_real32_rank4 => update_remote_and_release_pointer_real32_rank4
        procedure :: update_remote_and_release_pointer_real32_rank5 => update_remote_and_release_pointer_real32_rank5
        procedure :: update_remote_and_release_pointer_int64_rank0 => update_remote_and_release_pointer_int64_rank0
        procedure :: update_remote_and_release_pointer_int64_rank1 => update_remote_and_release_pointer_int64_rank1
        procedure :: update_remote_and_release_pointer_int64_rank2 => update_remote_and_release_pointer_int64_rank2
        procedure :: update_remote_and_release_pointer_int64_rank3 => update_remote_and_release_pointer_int64_rank3
        procedure :: update_remote_and_release_pointer_int64_rank4 => update_remote_and_release_pointer_int64_rank4
        procedure :: update_remote_and_release_pointer_int64_rank5 => update_remote_and_release_pointer_int64_rank5
        procedure :: update_remote_and_release_pointer_int32_rank0 => update_remote_and_release_pointer_int32_rank0
        procedure :: update_remote_and_release_pointer_int32_rank1 => update_remote_and_release_pointer_int32_rank1
        procedure :: update_remote_and_release_pointer_int32_rank2 => update_remote_and_release_pointer_int32_rank2
        procedure :: update_remote_and_release_pointer_int32_rank3 => update_remote_and_release_pointer_int32_rank3
        procedure :: update_remote_and_release_pointer_int32_rank4 => update_remote_and_release_pointer_int32_rank4
        procedure :: update_remote_and_release_pointer_int32_rank5 => update_remote_and_release_pointer_int32_rank5
        procedure :: update_remote_and_release_pointer_int16_rank0 => update_remote_and_release_pointer_int16_rank0
        procedure :: update_remote_and_release_pointer_int16_rank1 => update_remote_and_release_pointer_int16_rank1
        procedure :: update_remote_and_release_pointer_int16_rank2 => update_remote_and_release_pointer_int16_rank2
        procedure :: update_remote_and_release_pointer_int16_rank3 => update_remote_and_release_pointer_int16_rank3
        procedure :: update_remote_and_release_pointer_int16_rank4 => update_remote_and_release_pointer_int16_rank4
        procedure :: update_remote_and_release_pointer_int16_rank5 => update_remote_and_release_pointer_int16_rank5
        procedure :: update_remote_and_release_pointer_int8_rank0 => update_remote_and_release_pointer_int8_rank0
        procedure :: update_remote_and_release_pointer_int8_rank1 => update_remote_and_release_pointer_int8_rank1
        procedure :: update_remote_and_release_pointer_int8_rank2 => update_remote_and_release_pointer_int8_rank2
        procedure :: update_remote_and_release_pointer_int8_rank3 => update_remote_and_release_pointer_int8_rank3
        procedure :: update_remote_and_release_pointer_int8_rank4 => update_remote_and_release_pointer_int8_rank4
        procedure :: update_remote_and_release_pointer_int8_rank5 => update_remote_and_release_pointer_int8_rank5
        procedure :: secure_c_pointers => secure_c_pointers
        procedure :: release_c_pointers => release_c_pointers
        procedure :: cleanup => cleanup
    end type fortran_data_converter

    interface secure_fortran_pointer_from_remote_storage
        module procedure secure_complex128_rank0
        module procedure secure_complex64_rank0
        module procedure secure_real64_rank0
        module procedure secure_real32_rank0
        module procedure secure_int64_rank0
        module procedure secure_int32_rank0
        module procedure secure_int16_rank0
        module procedure secure_int8_rank0
        module procedure secure_complex128_rank1_from_integer
        module procedure secure_complex128_rank1_from_int64
        module procedure secure_complex128_rank2_from_integer
        module procedure secure_complex128_rank2_from_int64
        module procedure secure_complex128_rank3_from_integer
        module procedure secure_complex128_rank3_from_int64
        module procedure secure_complex128_rank4_from_integer
        module procedure secure_complex128_rank4_from_int64
        module procedure secure_complex128_rank5_from_integer
        module procedure secure_complex128_rank5_from_int64
        module procedure secure_complex64_rank1_from_integer
        module procedure secure_complex64_rank1_from_int64
        module procedure secure_complex64_rank2_from_integer
        module procedure secure_complex64_rank2_from_int64
        module procedure secure_complex64_rank3_from_integer
        module procedure secure_complex64_rank3_from_int64
        module procedure secure_complex64_rank4_from_integer
        module procedure secure_complex64_rank4_from_int64
        module procedure secure_complex64_rank5_from_integer
        module procedure secure_complex64_rank5_from_int64
        module procedure secure_real64_rank1_from_integer
        module procedure secure_real64_rank1_from_int64
        module procedure secure_real64_rank2_from_integer
        module procedure secure_real64_rank2_from_int64
        module procedure secure_real64_rank3_from_integer
        module procedure secure_real64_rank3_from_int64
        module procedure secure_real64_rank4_from_integer
        module procedure secure_real64_rank4_from_int64
        module procedure secure_real64_rank5_from_integer
        module procedure secure_real64_rank5_from_int64
        module procedure secure_real32_rank1_from_integer
        module procedure secure_real32_rank1_from_int64
        module procedure secure_real32_rank2_from_integer
        module procedure secure_real32_rank2_from_int64
        module procedure secure_real32_rank3_from_integer
        module procedure secure_real32_rank3_from_int64
        module procedure secure_real32_rank4_from_integer
        module procedure secure_real32_rank4_from_int64
        module procedure secure_real32_rank5_from_integer
        module procedure secure_real32_rank5_from_int64
        module procedure secure_int64_rank1_from_integer
        module procedure secure_int64_rank1_from_int64
        module procedure secure_int64_rank2_from_integer
        module procedure secure_int64_rank2_from_int64
        module procedure secure_int64_rank3_from_integer
        module procedure secure_int64_rank3_from_int64
        module procedure secure_int64_rank4_from_integer
        module procedure secure_int64_rank4_from_int64
        module procedure secure_int64_rank5_from_integer
        module procedure secure_int64_rank5_from_int64
        module procedure secure_int32_rank1_from_integer
        module procedure secure_int32_rank1_from_int64
        module procedure secure_int32_rank2_from_integer
        module procedure secure_int32_rank2_from_int64
        module procedure secure_int32_rank3_from_integer
        module procedure secure_int32_rank3_from_int64
        module procedure secure_int32_rank4_from_integer
        module procedure secure_int32_rank4_from_int64
        module procedure secure_int32_rank5_from_integer
        module procedure secure_int32_rank5_from_int64
        module procedure secure_int16_rank1_from_integer
        module procedure secure_int16_rank1_from_int64
        module procedure secure_int16_rank2_from_integer
        module procedure secure_int16_rank2_from_int64
        module procedure secure_int16_rank3_from_integer
        module procedure secure_int16_rank3_from_int64
        module procedure secure_int16_rank4_from_integer
        module procedure secure_int16_rank4_from_int64
        module procedure secure_int16_rank5_from_integer
        module procedure secure_int16_rank5_from_int64
        module procedure secure_int8_rank1_from_integer
        module procedure secure_int8_rank1_from_int64
        module procedure secure_int8_rank2_from_integer
        module procedure secure_int8_rank2_from_int64
        module procedure secure_int8_rank3_from_integer
        module procedure secure_int8_rank3_from_int64
        module procedure secure_int8_rank4_from_integer
        module procedure secure_int8_rank4_from_int64
        module procedure secure_int8_rank5_from_integer
        module procedure secure_int8_rank5_from_int64
    end interface secure_fortran_pointer_from_remote_storage

    interface update_remote_storage_from_pointer
        module procedure update_complex128_rank0
        module procedure update_complex128_rank1
        module procedure update_complex128_rank2
        module procedure update_complex128_rank3
        module procedure update_complex128_rank4
        module procedure update_complex128_rank5
        module procedure update_complex64_rank0
        module procedure update_complex64_rank1
        module procedure update_complex64_rank2
        module procedure update_complex64_rank3
        module procedure update_complex64_rank4
        module procedure update_complex64_rank5
        module procedure update_real64_rank0
        module procedure update_real64_rank1
        module procedure update_real64_rank2
        module procedure update_real64_rank3
        module procedure update_real64_rank4
        module procedure update_real64_rank5
        module procedure update_real32_rank0
        module procedure update_real32_rank1
        module procedure update_real32_rank2
        module procedure update_real32_rank3
        module procedure update_real32_rank4
        module procedure update_real32_rank5
        module procedure update_int64_rank0
        module procedure update_int64_rank1
        module procedure update_int64_rank2
        module procedure update_int64_rank3
        module procedure update_int64_rank4
        module procedure update_int64_rank5
        module procedure update_int32_rank0
        module procedure update_int32_rank1
        module procedure update_int32_rank2
        module procedure update_int32_rank3
        module procedure update_int32_rank4
        module procedure update_int32_rank5
        module procedure update_int16_rank0
        module procedure update_int16_rank1
        module procedure update_int16_rank2
        module procedure update_int16_rank3
        module procedure update_int16_rank4
        module procedure update_int16_rank5
        module procedure update_int8_rank0
        module procedure update_int8_rank1
        module procedure update_int8_rank2
        module procedure update_int8_rank3
        module procedure update_int8_rank4
        module procedure update_int8_rank5
    end interface update_remote_storage_from_pointer

    interface release_pointer_from_remote_storage
        module procedure release_complex128_rank0
        module procedure release_complex128_rank1
        module procedure release_complex128_rank2
        module procedure release_complex128_rank3
        module procedure release_complex128_rank4
        module procedure release_complex128_rank5
        module procedure release_complex64_rank0
        module procedure release_complex64_rank1
        module procedure release_complex64_rank2
        module procedure release_complex64_rank3
        module procedure release_complex64_rank4
        module procedure release_complex64_rank5
        module procedure release_real64_rank0
        module procedure release_real64_rank1
        module procedure release_real64_rank2
        module procedure release_real64_rank3
        module procedure release_real64_rank4
        module procedure release_real64_rank5
        module procedure release_real32_rank0
        module procedure release_real32_rank1
        module procedure release_real32_rank2
        module procedure release_real32_rank3
        module procedure release_real32_rank4
        module procedure release_real32_rank5
        module procedure release_int64_rank0
        module procedure release_int64_rank1
        module procedure release_int64_rank2
        module procedure release_int64_rank3
        module procedure release_int64_rank4
        module procedure release_int64_rank5
        module procedure release_int32_rank0
        module procedure release_int32_rank1
        module procedure release_int32_rank2
        module procedure release_int32_rank3
        module procedure release_int32_rank4
        module procedure release_int32_rank5
        module procedure release_int16_rank0
        module procedure release_int16_rank1
        module procedure release_int16_rank2
        module procedure release_int16_rank3
        module procedure release_int16_rank4
        module procedure release_int16_rank5
        module procedure release_int8_rank0
        module procedure release_int8_rank1
        module procedure release_int8_rank2
        module procedure release_int8_rank3
        module procedure release_int8_rank4
        module procedure release_int8_rank5
    end interface release_pointer_from_remote_storage

    interface update_remote_storage_and_release_pointer
        module procedure update_and_release_complex128_rank0
        module procedure update_and_release_complex128_rank1
        module procedure update_and_release_complex128_rank2
        module procedure update_and_release_complex128_rank3
        module procedure update_and_release_complex128_rank4
        module procedure update_and_release_complex128_rank5
        module procedure update_and_release_complex64_rank0
        module procedure update_and_release_complex64_rank1
        module procedure update_and_release_complex64_rank2
        module procedure update_and_release_complex64_rank3
        module procedure update_and_release_complex64_rank4
        module procedure update_and_release_complex64_rank5
        module procedure update_and_release_real64_rank0
        module procedure update_and_release_real64_rank1
        module procedure update_and_release_real64_rank2
        module procedure update_and_release_real64_rank3
        module procedure update_and_release_real64_rank4
        module procedure update_and_release_real64_rank5
        module procedure update_and_release_real32_rank0
        module procedure update_and_release_real32_rank1
        module procedure update_and_release_real32_rank2
        module procedure update_and_release_real32_rank3
        module procedure update_and_release_real32_rank4
        module procedure update_and_release_real32_rank5
        module procedure update_and_release_int64_rank0
        module procedure update_and_release_int64_rank1
        module procedure update_and_release_int64_rank2
        module procedure update_and_release_int64_rank3
        module procedure update_and_release_int64_rank4
        module procedure update_and_release_int64_rank5
        module procedure update_and_release_int32_rank0
        module procedure update_and_release_int32_rank1
        module procedure update_and_release_int32_rank2
        module procedure update_and_release_int32_rank3
        module procedure update_and_release_int32_rank4
        module procedure update_and_release_int32_rank5
        module procedure update_and_release_int16_rank0
        module procedure update_and_release_int16_rank1
        module procedure update_and_release_int16_rank2
        module procedure update_and_release_int16_rank3
        module procedure update_and_release_int16_rank4
        module procedure update_and_release_int16_rank5
        module procedure update_and_release_int8_rank0
        module procedure update_and_release_int8_rank1
        module procedure update_and_release_int8_rank2
        module procedure update_and_release_int8_rank3
        module procedure update_and_release_int8_rank4
        module procedure update_and_release_int8_rank5
    end interface update_remote_storage_and_release_pointer

    interface fortran_data_converter
        module procedure constructor_empty
        module procedure constructor
    end interface fortran_data_converter
contains
    function constructor_empty() result(this)
        type(fortran_data_converter) :: this

        this = fortran_data_converter(fortran_host_converter())
    end function constructor_empty

    function constructor(converter) result(this)
        type(fortran_host_converter), intent(in) :: converter
        type(fortran_data_converter) :: this

        this%converter = converter
    end function constructor

    subroutine secure_fortran_pointer_complex128_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local)
    end subroutine secure_fortran_pointer_complex128_rank0

    subroutine secure_complex128_rank0(ptr, remote, astream)
        complex(real64), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine secure_complex128_rank0

    subroutine secure_fortran_pointer_complex128_rank1_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex128_rank1_from_integer

    subroutine secure_complex128_rank1_from_integer(ptr, remote, dims, astream)
        complex(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex128_rank1_from_integer

    subroutine secure_fortran_pointer_complex128_rank1_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex128_rank1_from_int64

    subroutine secure_complex128_rank1_from_int64(ptr, remote, dims, astream)
        complex(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex128_rank1_from_int64

    subroutine secure_fortran_pointer_complex128_rank2_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex128_rank2_from_integer

    subroutine secure_complex128_rank2_from_integer(ptr, remote, dims, astream)
        complex(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex128_rank2_from_integer

    subroutine secure_fortran_pointer_complex128_rank2_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex128_rank2_from_int64

    subroutine secure_complex128_rank2_from_int64(ptr, remote, dims, astream)
        complex(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex128_rank2_from_int64

    subroutine secure_fortran_pointer_complex128_rank3_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex128_rank3_from_integer

    subroutine secure_complex128_rank3_from_integer(ptr, remote, dims, astream)
        complex(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex128_rank3_from_integer

    subroutine secure_fortran_pointer_complex128_rank3_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex128_rank3_from_int64

    subroutine secure_complex128_rank3_from_int64(ptr, remote, dims, astream)
        complex(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex128_rank3_from_int64

    subroutine secure_fortran_pointer_complex128_rank4_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex128_rank4_from_integer

    subroutine secure_complex128_rank4_from_integer(ptr, remote, dims, astream)
        complex(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex128_rank4_from_integer

    subroutine secure_fortran_pointer_complex128_rank4_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex128_rank4_from_int64

    subroutine secure_complex128_rank4_from_int64(ptr, remote, dims, astream)
        complex(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex128_rank4_from_int64

    subroutine secure_fortran_pointer_complex128_rank5_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex128_rank5_from_integer

    subroutine secure_complex128_rank5_from_integer(ptr, remote, dims, astream)
        complex(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex128_rank5_from_integer

    subroutine secure_fortran_pointer_complex128_rank5_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex128_rank5_from_int64

    subroutine secure_complex128_rank5_from_int64(ptr, remote, dims, astream)
        complex(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex128_rank5_from_int64

    subroutine secure_fortran_pointer_complex64_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local)
    end subroutine secure_fortran_pointer_complex64_rank0

    subroutine secure_complex64_rank0(ptr, remote, astream)
        complex(real32), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine secure_complex64_rank0

    subroutine secure_fortran_pointer_complex64_rank1_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex64_rank1_from_integer

    subroutine secure_complex64_rank1_from_integer(ptr, remote, dims, astream)
        complex(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex64_rank1_from_integer

    subroutine secure_fortran_pointer_complex64_rank1_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex64_rank1_from_int64

    subroutine secure_complex64_rank1_from_int64(ptr, remote, dims, astream)
        complex(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex64_rank1_from_int64

    subroutine secure_fortran_pointer_complex64_rank2_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex64_rank2_from_integer

    subroutine secure_complex64_rank2_from_integer(ptr, remote, dims, astream)
        complex(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex64_rank2_from_integer

    subroutine secure_fortran_pointer_complex64_rank2_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex64_rank2_from_int64

    subroutine secure_complex64_rank2_from_int64(ptr, remote, dims, astream)
        complex(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex64_rank2_from_int64

    subroutine secure_fortran_pointer_complex64_rank3_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex64_rank3_from_integer

    subroutine secure_complex64_rank3_from_integer(ptr, remote, dims, astream)
        complex(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex64_rank3_from_integer

    subroutine secure_fortran_pointer_complex64_rank3_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex64_rank3_from_int64

    subroutine secure_complex64_rank3_from_int64(ptr, remote, dims, astream)
        complex(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex64_rank3_from_int64

    subroutine secure_fortran_pointer_complex64_rank4_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex64_rank4_from_integer

    subroutine secure_complex64_rank4_from_integer(ptr, remote, dims, astream)
        complex(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex64_rank4_from_integer

    subroutine secure_fortran_pointer_complex64_rank4_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex64_rank4_from_int64

    subroutine secure_complex64_rank4_from_int64(ptr, remote, dims, astream)
        complex(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex64_rank4_from_int64

    subroutine secure_fortran_pointer_complex64_rank5_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex64_rank5_from_integer

    subroutine secure_complex64_rank5_from_integer(ptr, remote, dims, astream)
        complex(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex64_rank5_from_integer

    subroutine secure_fortran_pointer_complex64_rank5_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_complex64_rank5_from_int64

    subroutine secure_complex64_rank5_from_int64(ptr, remote, dims, astream)
        complex(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_complex64_rank5_from_int64

    subroutine secure_fortran_pointer_real64_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local)
    end subroutine secure_fortran_pointer_real64_rank0

    subroutine secure_real64_rank0(ptr, remote, astream)
        real(real64), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine secure_real64_rank0

    subroutine secure_fortran_pointer_real64_rank1_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real64_rank1_from_integer

    subroutine secure_real64_rank1_from_integer(ptr, remote, dims, astream)
        real(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real64_rank1_from_integer

    subroutine secure_fortran_pointer_real64_rank1_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real64_rank1_from_int64

    subroutine secure_real64_rank1_from_int64(ptr, remote, dims, astream)
        real(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real64_rank1_from_int64

    subroutine secure_fortran_pointer_real64_rank2_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real64_rank2_from_integer

    subroutine secure_real64_rank2_from_integer(ptr, remote, dims, astream)
        real(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real64_rank2_from_integer

    subroutine secure_fortran_pointer_real64_rank2_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real64_rank2_from_int64

    subroutine secure_real64_rank2_from_int64(ptr, remote, dims, astream)
        real(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real64_rank2_from_int64

    subroutine secure_fortran_pointer_real64_rank3_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real64_rank3_from_integer

    subroutine secure_real64_rank3_from_integer(ptr, remote, dims, astream)
        real(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real64_rank3_from_integer

    subroutine secure_fortran_pointer_real64_rank3_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real64_rank3_from_int64

    subroutine secure_real64_rank3_from_int64(ptr, remote, dims, astream)
        real(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real64_rank3_from_int64

    subroutine secure_fortran_pointer_real64_rank4_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real64_rank4_from_integer

    subroutine secure_real64_rank4_from_integer(ptr, remote, dims, astream)
        real(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real64_rank4_from_integer

    subroutine secure_fortran_pointer_real64_rank4_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real64_rank4_from_int64

    subroutine secure_real64_rank4_from_int64(ptr, remote, dims, astream)
        real(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real64_rank4_from_int64

    subroutine secure_fortran_pointer_real64_rank5_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real64_rank5_from_integer

    subroutine secure_real64_rank5_from_integer(ptr, remote, dims, astream)
        real(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real64_rank5_from_integer

    subroutine secure_fortran_pointer_real64_rank5_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real64_rank5_from_int64

    subroutine secure_real64_rank5_from_int64(ptr, remote, dims, astream)
        real(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real64_rank5_from_int64

    subroutine secure_fortran_pointer_real32_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local)
    end subroutine secure_fortran_pointer_real32_rank0

    subroutine secure_real32_rank0(ptr, remote, astream)
        real(real32), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine secure_real32_rank0

    subroutine secure_fortran_pointer_real32_rank1_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real32_rank1_from_integer

    subroutine secure_real32_rank1_from_integer(ptr, remote, dims, astream)
        real(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real32_rank1_from_integer

    subroutine secure_fortran_pointer_real32_rank1_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real32_rank1_from_int64

    subroutine secure_real32_rank1_from_int64(ptr, remote, dims, astream)
        real(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real32_rank1_from_int64

    subroutine secure_fortran_pointer_real32_rank2_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real32_rank2_from_integer

    subroutine secure_real32_rank2_from_integer(ptr, remote, dims, astream)
        real(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real32_rank2_from_integer

    subroutine secure_fortran_pointer_real32_rank2_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real32_rank2_from_int64

    subroutine secure_real32_rank2_from_int64(ptr, remote, dims, astream)
        real(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real32_rank2_from_int64

    subroutine secure_fortran_pointer_real32_rank3_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real32_rank3_from_integer

    subroutine secure_real32_rank3_from_integer(ptr, remote, dims, astream)
        real(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real32_rank3_from_integer

    subroutine secure_fortran_pointer_real32_rank3_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real32_rank3_from_int64

    subroutine secure_real32_rank3_from_int64(ptr, remote, dims, astream)
        real(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real32_rank3_from_int64

    subroutine secure_fortran_pointer_real32_rank4_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real32_rank4_from_integer

    subroutine secure_real32_rank4_from_integer(ptr, remote, dims, astream)
        real(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real32_rank4_from_integer

    subroutine secure_fortran_pointer_real32_rank4_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real32_rank4_from_int64

    subroutine secure_real32_rank4_from_int64(ptr, remote, dims, astream)
        real(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real32_rank4_from_int64

    subroutine secure_fortran_pointer_real32_rank5_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real32_rank5_from_integer

    subroutine secure_real32_rank5_from_integer(ptr, remote, dims, astream)
        real(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real32_rank5_from_integer

    subroutine secure_fortran_pointer_real32_rank5_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_real32_rank5_from_int64

    subroutine secure_real32_rank5_from_int64(ptr, remote, dims, astream)
        real(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_real32_rank5_from_int64

    subroutine secure_fortran_pointer_int64_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local)
    end subroutine secure_fortran_pointer_int64_rank0

    subroutine secure_int64_rank0(ptr, remote, astream)
        integer(int64), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine secure_int64_rank0

    subroutine secure_fortran_pointer_int64_rank1_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int64_rank1_from_integer

    subroutine secure_int64_rank1_from_integer(ptr, remote, dims, astream)
        integer(int64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int64_rank1_from_integer

    subroutine secure_fortran_pointer_int64_rank1_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int64_rank1_from_int64

    subroutine secure_int64_rank1_from_int64(ptr, remote, dims, astream)
        integer(int64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int64_rank1_from_int64

    subroutine secure_fortran_pointer_int64_rank2_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int64_rank2_from_integer

    subroutine secure_int64_rank2_from_integer(ptr, remote, dims, astream)
        integer(int64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int64_rank2_from_integer

    subroutine secure_fortran_pointer_int64_rank2_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int64_rank2_from_int64

    subroutine secure_int64_rank2_from_int64(ptr, remote, dims, astream)
        integer(int64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int64_rank2_from_int64

    subroutine secure_fortran_pointer_int64_rank3_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int64_rank3_from_integer

    subroutine secure_int64_rank3_from_integer(ptr, remote, dims, astream)
        integer(int64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int64_rank3_from_integer

    subroutine secure_fortran_pointer_int64_rank3_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int64_rank3_from_int64

    subroutine secure_int64_rank3_from_int64(ptr, remote, dims, astream)
        integer(int64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int64_rank3_from_int64

    subroutine secure_fortran_pointer_int64_rank4_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int64_rank4_from_integer

    subroutine secure_int64_rank4_from_integer(ptr, remote, dims, astream)
        integer(int64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int64_rank4_from_integer

    subroutine secure_fortran_pointer_int64_rank4_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int64_rank4_from_int64

    subroutine secure_int64_rank4_from_int64(ptr, remote, dims, astream)
        integer(int64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int64_rank4_from_int64

    subroutine secure_fortran_pointer_int64_rank5_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int64_rank5_from_integer

    subroutine secure_int64_rank5_from_integer(ptr, remote, dims, astream)
        integer(int64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int64_rank5_from_integer

    subroutine secure_fortran_pointer_int64_rank5_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int64_rank5_from_int64

    subroutine secure_int64_rank5_from_int64(ptr, remote, dims, astream)
        integer(int64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int64_rank5_from_int64

    subroutine secure_fortran_pointer_int32_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local)
    end subroutine secure_fortran_pointer_int32_rank0

    subroutine secure_int32_rank0(ptr, remote, astream)
        integer(int32), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine secure_int32_rank0

    subroutine secure_fortran_pointer_int32_rank1_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int32_rank1_from_integer

    subroutine secure_int32_rank1_from_integer(ptr, remote, dims, astream)
        integer(int32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int32_rank1_from_integer

    subroutine secure_fortran_pointer_int32_rank1_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int32_rank1_from_int64

    subroutine secure_int32_rank1_from_int64(ptr, remote, dims, astream)
        integer(int32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int32_rank1_from_int64

    subroutine secure_fortran_pointer_int32_rank2_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int32_rank2_from_integer

    subroutine secure_int32_rank2_from_integer(ptr, remote, dims, astream)
        integer(int32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int32_rank2_from_integer

    subroutine secure_fortran_pointer_int32_rank2_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int32_rank2_from_int64

    subroutine secure_int32_rank2_from_int64(ptr, remote, dims, astream)
        integer(int32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int32_rank2_from_int64

    subroutine secure_fortran_pointer_int32_rank3_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int32_rank3_from_integer

    subroutine secure_int32_rank3_from_integer(ptr, remote, dims, astream)
        integer(int32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int32_rank3_from_integer

    subroutine secure_fortran_pointer_int32_rank3_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int32_rank3_from_int64

    subroutine secure_int32_rank3_from_int64(ptr, remote, dims, astream)
        integer(int32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int32_rank3_from_int64

    subroutine secure_fortran_pointer_int32_rank4_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int32_rank4_from_integer

    subroutine secure_int32_rank4_from_integer(ptr, remote, dims, astream)
        integer(int32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int32_rank4_from_integer

    subroutine secure_fortran_pointer_int32_rank4_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int32_rank4_from_int64

    subroutine secure_int32_rank4_from_int64(ptr, remote, dims, astream)
        integer(int32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int32_rank4_from_int64

    subroutine secure_fortran_pointer_int32_rank5_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int32_rank5_from_integer

    subroutine secure_int32_rank5_from_integer(ptr, remote, dims, astream)
        integer(int32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int32_rank5_from_integer

    subroutine secure_fortran_pointer_int32_rank5_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int32_rank5_from_int64

    subroutine secure_int32_rank5_from_int64(ptr, remote, dims, astream)
        integer(int32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int32_rank5_from_int64

    subroutine secure_fortran_pointer_int16_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local)
    end subroutine secure_fortran_pointer_int16_rank0

    subroutine secure_int16_rank0(ptr, remote, astream)
        integer(int16), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine secure_int16_rank0

    subroutine secure_fortran_pointer_int16_rank1_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int16_rank1_from_integer

    subroutine secure_int16_rank1_from_integer(ptr, remote, dims, astream)
        integer(int16), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int16_rank1_from_integer

    subroutine secure_fortran_pointer_int16_rank1_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int16_rank1_from_int64

    subroutine secure_int16_rank1_from_int64(ptr, remote, dims, astream)
        integer(int16), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int16_rank1_from_int64

    subroutine secure_fortran_pointer_int16_rank2_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int16_rank2_from_integer

    subroutine secure_int16_rank2_from_integer(ptr, remote, dims, astream)
        integer(int16), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int16_rank2_from_integer

    subroutine secure_fortran_pointer_int16_rank2_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int16_rank2_from_int64

    subroutine secure_int16_rank2_from_int64(ptr, remote, dims, astream)
        integer(int16), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int16_rank2_from_int64

    subroutine secure_fortran_pointer_int16_rank3_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int16_rank3_from_integer

    subroutine secure_int16_rank3_from_integer(ptr, remote, dims, astream)
        integer(int16), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int16_rank3_from_integer

    subroutine secure_fortran_pointer_int16_rank3_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int16_rank3_from_int64

    subroutine secure_int16_rank3_from_int64(ptr, remote, dims, astream)
        integer(int16), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int16_rank3_from_int64

    subroutine secure_fortran_pointer_int16_rank4_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int16_rank4_from_integer

    subroutine secure_int16_rank4_from_integer(ptr, remote, dims, astream)
        integer(int16), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int16_rank4_from_integer

    subroutine secure_fortran_pointer_int16_rank4_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int16_rank4_from_int64

    subroutine secure_int16_rank4_from_int64(ptr, remote, dims, astream)
        integer(int16), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int16_rank4_from_int64

    subroutine secure_fortran_pointer_int16_rank5_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int16_rank5_from_integer

    subroutine secure_int16_rank5_from_integer(ptr, remote, dims, astream)
        integer(int16), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int16_rank5_from_integer

    subroutine secure_fortran_pointer_int16_rank5_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int16_rank5_from_int64

    subroutine secure_int16_rank5_from_int64(ptr, remote, dims, astream)
        integer(int16), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int16_rank5_from_int64

    subroutine secure_fortran_pointer_int8_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local)
    end subroutine secure_fortran_pointer_int8_rank0

    subroutine secure_int8_rank0(ptr, remote, astream)
        integer(int8), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine secure_int8_rank0

    subroutine secure_fortran_pointer_int8_rank1_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int8_rank1_from_integer

    subroutine secure_int8_rank1_from_integer(ptr, remote, dims, astream)
        integer(int8), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int8_rank1_from_integer

    subroutine secure_fortran_pointer_int8_rank1_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int8_rank1_from_int64

    subroutine secure_int8_rank1_from_int64(ptr, remote, dims, astream)
        integer(int8), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int8_rank1_from_int64

    subroutine secure_fortran_pointer_int8_rank2_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int8_rank2_from_integer

    subroutine secure_int8_rank2_from_integer(ptr, remote, dims, astream)
        integer(int8), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int8_rank2_from_integer

    subroutine secure_fortran_pointer_int8_rank2_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int8_rank2_from_int64

    subroutine secure_int8_rank2_from_int64(ptr, remote, dims, astream)
        integer(int8), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int8_rank2_from_int64

    subroutine secure_fortran_pointer_int8_rank3_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int8_rank3_from_integer

    subroutine secure_int8_rank3_from_integer(ptr, remote, dims, astream)
        integer(int8), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int8_rank3_from_integer

    subroutine secure_fortran_pointer_int8_rank3_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int8_rank3_from_int64

    subroutine secure_int8_rank3_from_int64(ptr, remote, dims, astream)
        integer(int8), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int8_rank3_from_int64

    subroutine secure_fortran_pointer_int8_rank4_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int8_rank4_from_integer

    subroutine secure_int8_rank4_from_integer(ptr, remote, dims, astream)
        integer(int8), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int8_rank4_from_integer

    subroutine secure_fortran_pointer_int8_rank4_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int8_rank4_from_int64

    subroutine secure_int8_rank4_from_int64(ptr, remote, dims, astream)
        integer(int8), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int8_rank4_from_int64

    subroutine secure_fortran_pointer_int8_rank5_from_integer(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int8_rank5_from_integer

    subroutine secure_int8_rank5_from_integer(ptr, remote, dims, astream)
        integer(int8), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer, dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int8_rank5_from_integer

    subroutine secure_fortran_pointer_int8_rank5_from_int64(this, ptr, remote, dims, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call this%converter%secure_fortran_pointer(ptr, local, dims)
    end subroutine secure_fortran_pointer_int8_rank5_from_int64

    subroutine secure_int8_rank5_from_int64(ptr, remote, dims, astream)
        integer(int8), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        integer(int64), dimension(:), intent(in) :: dims
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%secure_fortran_pointer(ptr, remote, dims, astream)
        call converter%cleanup()
    end subroutine secure_int8_rank5_from_int64

    subroutine update_remote_complex128_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), pointer, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_complex128_rank0

    subroutine update_complex128_rank0(ptr, remote, astream)
        complex(real64), pointer, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_complex128_rank0

    subroutine release_pointer_complex128_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_complex128_rank0

    subroutine release_complex128_rank0(ptr, remote, astream)
        complex(real64), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_complex128_rank0

    subroutine update_remote_and_release_pointer_complex128_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), pointer, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_complex128_rank0

    subroutine update_and_release_complex128_rank0(ptr, remote, astream)
        complex(real64), pointer, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_complex128_rank0

    subroutine update_remote_complex128_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_complex128_rank1

    subroutine update_complex128_rank1(ptr, remote, astream)
        complex(real64), dimension(:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_complex128_rank1

    subroutine release_pointer_complex128_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_complex128_rank1

    subroutine release_complex128_rank1(ptr, remote, astream)
        complex(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_complex128_rank1

    subroutine update_remote_and_release_pointer_complex128_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_complex128_rank1

    subroutine update_and_release_complex128_rank1(ptr, remote, astream)
        complex(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_complex128_rank1

    subroutine update_remote_complex128_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_complex128_rank2

    subroutine update_complex128_rank2(ptr, remote, astream)
        complex(real64), dimension(:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_complex128_rank2

    subroutine release_pointer_complex128_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_complex128_rank2

    subroutine release_complex128_rank2(ptr, remote, astream)
        complex(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_complex128_rank2

    subroutine update_remote_and_release_pointer_complex128_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_complex128_rank2

    subroutine update_and_release_complex128_rank2(ptr, remote, astream)
        complex(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_complex128_rank2

    subroutine update_remote_complex128_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_complex128_rank3

    subroutine update_complex128_rank3(ptr, remote, astream)
        complex(real64), dimension(:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_complex128_rank3

    subroutine release_pointer_complex128_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_complex128_rank3

    subroutine release_complex128_rank3(ptr, remote, astream)
        complex(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_complex128_rank3

    subroutine update_remote_and_release_pointer_complex128_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_complex128_rank3

    subroutine update_and_release_complex128_rank3(ptr, remote, astream)
        complex(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_complex128_rank3

    subroutine update_remote_complex128_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_complex128_rank4

    subroutine update_complex128_rank4(ptr, remote, astream)
        complex(real64), dimension(:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_complex128_rank4

    subroutine release_pointer_complex128_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_complex128_rank4

    subroutine release_complex128_rank4(ptr, remote, astream)
        complex(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_complex128_rank4

    subroutine update_remote_and_release_pointer_complex128_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_complex128_rank4

    subroutine update_and_release_complex128_rank4(ptr, remote, astream)
        complex(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_complex128_rank4

    subroutine update_remote_complex128_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_complex128_rank5

    subroutine update_complex128_rank5(ptr, remote, astream)
        complex(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_complex128_rank5

    subroutine release_pointer_complex128_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_complex128_rank5

    subroutine release_complex128_rank5(ptr, remote, astream)
        complex(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_complex128_rank5

    subroutine update_remote_and_release_pointer_complex128_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_complex128_rank5

    subroutine update_and_release_complex128_rank5(ptr, remote, astream)
        complex(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_complex128_rank5

    subroutine update_remote_complex64_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), pointer, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_complex64_rank0

    subroutine update_complex64_rank0(ptr, remote, astream)
        complex(real32), pointer, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_complex64_rank0

    subroutine release_pointer_complex64_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_complex64_rank0

    subroutine release_complex64_rank0(ptr, remote, astream)
        complex(real32), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_complex64_rank0

    subroutine update_remote_and_release_pointer_complex64_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), pointer, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_complex64_rank0

    subroutine update_and_release_complex64_rank0(ptr, remote, astream)
        complex(real32), pointer, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_complex64_rank0

    subroutine update_remote_complex64_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_complex64_rank1

    subroutine update_complex64_rank1(ptr, remote, astream)
        complex(real32), dimension(:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_complex64_rank1

    subroutine release_pointer_complex64_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_complex64_rank1

    subroutine release_complex64_rank1(ptr, remote, astream)
        complex(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_complex64_rank1

    subroutine update_remote_and_release_pointer_complex64_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_complex64_rank1

    subroutine update_and_release_complex64_rank1(ptr, remote, astream)
        complex(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_complex64_rank1

    subroutine update_remote_complex64_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_complex64_rank2

    subroutine update_complex64_rank2(ptr, remote, astream)
        complex(real32), dimension(:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_complex64_rank2

    subroutine release_pointer_complex64_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_complex64_rank2

    subroutine release_complex64_rank2(ptr, remote, astream)
        complex(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_complex64_rank2

    subroutine update_remote_and_release_pointer_complex64_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_complex64_rank2

    subroutine update_and_release_complex64_rank2(ptr, remote, astream)
        complex(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_complex64_rank2

    subroutine update_remote_complex64_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_complex64_rank3

    subroutine update_complex64_rank3(ptr, remote, astream)
        complex(real32), dimension(:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_complex64_rank3

    subroutine release_pointer_complex64_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_complex64_rank3

    subroutine release_complex64_rank3(ptr, remote, astream)
        complex(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_complex64_rank3

    subroutine update_remote_and_release_pointer_complex64_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_complex64_rank3

    subroutine update_and_release_complex64_rank3(ptr, remote, astream)
        complex(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_complex64_rank3

    subroutine update_remote_complex64_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_complex64_rank4

    subroutine update_complex64_rank4(ptr, remote, astream)
        complex(real32), dimension(:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_complex64_rank4

    subroutine release_pointer_complex64_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_complex64_rank4

    subroutine release_complex64_rank4(ptr, remote, astream)
        complex(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_complex64_rank4

    subroutine update_remote_and_release_pointer_complex64_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_complex64_rank4

    subroutine update_and_release_complex64_rank4(ptr, remote, astream)
        complex(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_complex64_rank4

    subroutine update_remote_complex64_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_complex64_rank5

    subroutine update_complex64_rank5(ptr, remote, astream)
        complex(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_complex64_rank5

    subroutine release_pointer_complex64_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_complex64_rank5

    subroutine release_complex64_rank5(ptr, remote, astream)
        complex(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_complex64_rank5

    subroutine update_remote_and_release_pointer_complex64_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        complex(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_complex64_rank5

    subroutine update_and_release_complex64_rank5(ptr, remote, astream)
        complex(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_complex64_rank5

    subroutine update_remote_real64_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), pointer, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_real64_rank0

    subroutine update_real64_rank0(ptr, remote, astream)
        real(real64), pointer, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_real64_rank0

    subroutine release_pointer_real64_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_real64_rank0

    subroutine release_real64_rank0(ptr, remote, astream)
        real(real64), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_real64_rank0

    subroutine update_remote_and_release_pointer_real64_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), pointer, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_real64_rank0

    subroutine update_and_release_real64_rank0(ptr, remote, astream)
        real(real64), pointer, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_real64_rank0

    subroutine update_remote_real64_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_real64_rank1

    subroutine update_real64_rank1(ptr, remote, astream)
        real(real64), dimension(:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_real64_rank1

    subroutine release_pointer_real64_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_real64_rank1

    subroutine release_real64_rank1(ptr, remote, astream)
        real(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_real64_rank1

    subroutine update_remote_and_release_pointer_real64_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_real64_rank1

    subroutine update_and_release_real64_rank1(ptr, remote, astream)
        real(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_real64_rank1

    subroutine update_remote_real64_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_real64_rank2

    subroutine update_real64_rank2(ptr, remote, astream)
        real(real64), dimension(:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_real64_rank2

    subroutine release_pointer_real64_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_real64_rank2

    subroutine release_real64_rank2(ptr, remote, astream)
        real(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_real64_rank2

    subroutine update_remote_and_release_pointer_real64_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_real64_rank2

    subroutine update_and_release_real64_rank2(ptr, remote, astream)
        real(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_real64_rank2

    subroutine update_remote_real64_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_real64_rank3

    subroutine update_real64_rank3(ptr, remote, astream)
        real(real64), dimension(:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_real64_rank3

    subroutine release_pointer_real64_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_real64_rank3

    subroutine release_real64_rank3(ptr, remote, astream)
        real(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_real64_rank3

    subroutine update_remote_and_release_pointer_real64_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_real64_rank3

    subroutine update_and_release_real64_rank3(ptr, remote, astream)
        real(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_real64_rank3

    subroutine update_remote_real64_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_real64_rank4

    subroutine update_real64_rank4(ptr, remote, astream)
        real(real64), dimension(:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_real64_rank4

    subroutine release_pointer_real64_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_real64_rank4

    subroutine release_real64_rank4(ptr, remote, astream)
        real(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_real64_rank4

    subroutine update_remote_and_release_pointer_real64_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_real64_rank4

    subroutine update_and_release_real64_rank4(ptr, remote, astream)
        real(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_real64_rank4

    subroutine update_remote_real64_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_real64_rank5

    subroutine update_real64_rank5(ptr, remote, astream)
        real(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_real64_rank5

    subroutine release_pointer_real64_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_real64_rank5

    subroutine release_real64_rank5(ptr, remote, astream)
        real(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_real64_rank5

    subroutine update_remote_and_release_pointer_real64_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_real64_rank5

    subroutine update_and_release_real64_rank5(ptr, remote, astream)
        real(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_real64_rank5

    subroutine update_remote_real32_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), pointer, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_real32_rank0

    subroutine update_real32_rank0(ptr, remote, astream)
        real(real32), pointer, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_real32_rank0

    subroutine release_pointer_real32_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_real32_rank0

    subroutine release_real32_rank0(ptr, remote, astream)
        real(real32), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_real32_rank0

    subroutine update_remote_and_release_pointer_real32_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), pointer, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_real32_rank0

    subroutine update_and_release_real32_rank0(ptr, remote, astream)
        real(real32), pointer, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_real32_rank0

    subroutine update_remote_real32_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_real32_rank1

    subroutine update_real32_rank1(ptr, remote, astream)
        real(real32), dimension(:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_real32_rank1

    subroutine release_pointer_real32_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_real32_rank1

    subroutine release_real32_rank1(ptr, remote, astream)
        real(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_real32_rank1

    subroutine update_remote_and_release_pointer_real32_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_real32_rank1

    subroutine update_and_release_real32_rank1(ptr, remote, astream)
        real(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_real32_rank1

    subroutine update_remote_real32_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_real32_rank2

    subroutine update_real32_rank2(ptr, remote, astream)
        real(real32), dimension(:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_real32_rank2

    subroutine release_pointer_real32_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_real32_rank2

    subroutine release_real32_rank2(ptr, remote, astream)
        real(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_real32_rank2

    subroutine update_remote_and_release_pointer_real32_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_real32_rank2

    subroutine update_and_release_real32_rank2(ptr, remote, astream)
        real(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_real32_rank2

    subroutine update_remote_real32_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_real32_rank3

    subroutine update_real32_rank3(ptr, remote, astream)
        real(real32), dimension(:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_real32_rank3

    subroutine release_pointer_real32_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_real32_rank3

    subroutine release_real32_rank3(ptr, remote, astream)
        real(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_real32_rank3

    subroutine update_remote_and_release_pointer_real32_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_real32_rank3

    subroutine update_and_release_real32_rank3(ptr, remote, astream)
        real(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_real32_rank3

    subroutine update_remote_real32_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_real32_rank4

    subroutine update_real32_rank4(ptr, remote, astream)
        real(real32), dimension(:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_real32_rank4

    subroutine release_pointer_real32_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_real32_rank4

    subroutine release_real32_rank4(ptr, remote, astream)
        real(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_real32_rank4

    subroutine update_remote_and_release_pointer_real32_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_real32_rank4

    subroutine update_and_release_real32_rank4(ptr, remote, astream)
        real(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_real32_rank4

    subroutine update_remote_real32_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_real32_rank5

    subroutine update_real32_rank5(ptr, remote, astream)
        real(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_real32_rank5

    subroutine release_pointer_real32_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_real32_rank5

    subroutine release_real32_rank5(ptr, remote, astream)
        real(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_real32_rank5

    subroutine update_remote_and_release_pointer_real32_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        real(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_real32_rank5

    subroutine update_and_release_real32_rank5(ptr, remote, astream)
        real(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_real32_rank5

    subroutine update_remote_int64_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), pointer, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int64_rank0

    subroutine update_int64_rank0(ptr, remote, astream)
        integer(int64), pointer, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int64_rank0

    subroutine release_pointer_int64_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int64_rank0

    subroutine release_int64_rank0(ptr, remote, astream)
        integer(int64), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int64_rank0

    subroutine update_remote_and_release_pointer_int64_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), pointer, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int64_rank0

    subroutine update_and_release_int64_rank0(ptr, remote, astream)
        integer(int64), pointer, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int64_rank0

    subroutine update_remote_int64_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int64_rank1

    subroutine update_int64_rank1(ptr, remote, astream)
        integer(int64), dimension(:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int64_rank1

    subroutine release_pointer_int64_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int64_rank1

    subroutine release_int64_rank1(ptr, remote, astream)
        integer(int64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int64_rank1

    subroutine update_remote_and_release_pointer_int64_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int64_rank1

    subroutine update_and_release_int64_rank1(ptr, remote, astream)
        integer(int64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int64_rank1

    subroutine update_remote_int64_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int64_rank2

    subroutine update_int64_rank2(ptr, remote, astream)
        integer(int64), dimension(:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int64_rank2

    subroutine release_pointer_int64_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int64_rank2

    subroutine release_int64_rank2(ptr, remote, astream)
        integer(int64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int64_rank2

    subroutine update_remote_and_release_pointer_int64_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int64_rank2

    subroutine update_and_release_int64_rank2(ptr, remote, astream)
        integer(int64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int64_rank2

    subroutine update_remote_int64_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int64_rank3

    subroutine update_int64_rank3(ptr, remote, astream)
        integer(int64), dimension(:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int64_rank3

    subroutine release_pointer_int64_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int64_rank3

    subroutine release_int64_rank3(ptr, remote, astream)
        integer(int64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int64_rank3

    subroutine update_remote_and_release_pointer_int64_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int64_rank3

    subroutine update_and_release_int64_rank3(ptr, remote, astream)
        integer(int64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int64_rank3

    subroutine update_remote_int64_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int64_rank4

    subroutine update_int64_rank4(ptr, remote, astream)
        integer(int64), dimension(:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int64_rank4

    subroutine release_pointer_int64_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int64_rank4

    subroutine release_int64_rank4(ptr, remote, astream)
        integer(int64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int64_rank4

    subroutine update_remote_and_release_pointer_int64_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int64_rank4

    subroutine update_and_release_int64_rank4(ptr, remote, astream)
        integer(int64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int64_rank4

    subroutine update_remote_int64_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int64_rank5

    subroutine update_int64_rank5(ptr, remote, astream)
        integer(int64), dimension(:,:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int64_rank5

    subroutine release_pointer_int64_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int64_rank5

    subroutine release_int64_rank5(ptr, remote, astream)
        integer(int64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int64_rank5

    subroutine update_remote_and_release_pointer_int64_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int64_rank5

    subroutine update_and_release_int64_rank5(ptr, remote, astream)
        integer(int64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int64_rank5

    subroutine update_remote_int32_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), pointer, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int32_rank0

    subroutine update_int32_rank0(ptr, remote, astream)
        integer(int32), pointer, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int32_rank0

    subroutine release_pointer_int32_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int32_rank0

    subroutine release_int32_rank0(ptr, remote, astream)
        integer(int32), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int32_rank0

    subroutine update_remote_and_release_pointer_int32_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), pointer, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int32_rank0

    subroutine update_and_release_int32_rank0(ptr, remote, astream)
        integer(int32), pointer, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int32_rank0

    subroutine update_remote_int32_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int32_rank1

    subroutine update_int32_rank1(ptr, remote, astream)
        integer(int32), dimension(:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int32_rank1

    subroutine release_pointer_int32_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int32_rank1

    subroutine release_int32_rank1(ptr, remote, astream)
        integer(int32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int32_rank1

    subroutine update_remote_and_release_pointer_int32_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int32_rank1

    subroutine update_and_release_int32_rank1(ptr, remote, astream)
        integer(int32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int32_rank1

    subroutine update_remote_int32_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int32_rank2

    subroutine update_int32_rank2(ptr, remote, astream)
        integer(int32), dimension(:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int32_rank2

    subroutine release_pointer_int32_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int32_rank2

    subroutine release_int32_rank2(ptr, remote, astream)
        integer(int32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int32_rank2

    subroutine update_remote_and_release_pointer_int32_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int32_rank2

    subroutine update_and_release_int32_rank2(ptr, remote, astream)
        integer(int32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int32_rank2

    subroutine update_remote_int32_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int32_rank3

    subroutine update_int32_rank3(ptr, remote, astream)
        integer(int32), dimension(:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int32_rank3

    subroutine release_pointer_int32_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int32_rank3

    subroutine release_int32_rank3(ptr, remote, astream)
        integer(int32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int32_rank3

    subroutine update_remote_and_release_pointer_int32_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int32_rank3

    subroutine update_and_release_int32_rank3(ptr, remote, astream)
        integer(int32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int32_rank3

    subroutine update_remote_int32_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int32_rank4

    subroutine update_int32_rank4(ptr, remote, astream)
        integer(int32), dimension(:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int32_rank4

    subroutine release_pointer_int32_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int32_rank4

    subroutine release_int32_rank4(ptr, remote, astream)
        integer(int32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int32_rank4

    subroutine update_remote_and_release_pointer_int32_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int32_rank4

    subroutine update_and_release_int32_rank4(ptr, remote, astream)
        integer(int32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int32_rank4

    subroutine update_remote_int32_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int32_rank5

    subroutine update_int32_rank5(ptr, remote, astream)
        integer(int32), dimension(:,:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int32_rank5

    subroutine release_pointer_int32_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int32_rank5

    subroutine release_int32_rank5(ptr, remote, astream)
        integer(int32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int32_rank5

    subroutine update_remote_and_release_pointer_int32_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int32_rank5

    subroutine update_and_release_int32_rank5(ptr, remote, astream)
        integer(int32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int32_rank5

    subroutine update_remote_int16_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), pointer, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int16_rank0

    subroutine update_int16_rank0(ptr, remote, astream)
        integer(int16), pointer, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int16_rank0

    subroutine release_pointer_int16_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int16_rank0

    subroutine release_int16_rank0(ptr, remote, astream)
        integer(int16), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int16_rank0

    subroutine update_remote_and_release_pointer_int16_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), pointer, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int16_rank0

    subroutine update_and_release_int16_rank0(ptr, remote, astream)
        integer(int16), pointer, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int16_rank0

    subroutine update_remote_int16_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int16_rank1

    subroutine update_int16_rank1(ptr, remote, astream)
        integer(int16), dimension(:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int16_rank1

    subroutine release_pointer_int16_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int16_rank1

    subroutine release_int16_rank1(ptr, remote, astream)
        integer(int16), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int16_rank1

    subroutine update_remote_and_release_pointer_int16_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int16_rank1

    subroutine update_and_release_int16_rank1(ptr, remote, astream)
        integer(int16), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int16_rank1

    subroutine update_remote_int16_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int16_rank2

    subroutine update_int16_rank2(ptr, remote, astream)
        integer(int16), dimension(:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int16_rank2

    subroutine release_pointer_int16_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int16_rank2

    subroutine release_int16_rank2(ptr, remote, astream)
        integer(int16), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int16_rank2

    subroutine update_remote_and_release_pointer_int16_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int16_rank2

    subroutine update_and_release_int16_rank2(ptr, remote, astream)
        integer(int16), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int16_rank2

    subroutine update_remote_int16_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int16_rank3

    subroutine update_int16_rank3(ptr, remote, astream)
        integer(int16), dimension(:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int16_rank3

    subroutine release_pointer_int16_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int16_rank3

    subroutine release_int16_rank3(ptr, remote, astream)
        integer(int16), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int16_rank3

    subroutine update_remote_and_release_pointer_int16_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int16_rank3

    subroutine update_and_release_int16_rank3(ptr, remote, astream)
        integer(int16), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int16_rank3

    subroutine update_remote_int16_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int16_rank4

    subroutine update_int16_rank4(ptr, remote, astream)
        integer(int16), dimension(:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int16_rank4

    subroutine release_pointer_int16_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int16_rank4

    subroutine release_int16_rank4(ptr, remote, astream)
        integer(int16), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int16_rank4

    subroutine update_remote_and_release_pointer_int16_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int16_rank4

    subroutine update_and_release_int16_rank4(ptr, remote, astream)
        integer(int16), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int16_rank4

    subroutine update_remote_int16_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int16_rank5

    subroutine update_int16_rank5(ptr, remote, astream)
        integer(int16), dimension(:,:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int16_rank5

    subroutine release_pointer_int16_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int16_rank5

    subroutine release_int16_rank5(ptr, remote, astream)
        integer(int16), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int16_rank5

    subroutine update_remote_and_release_pointer_int16_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int16), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int16_rank5

    subroutine update_and_release_int16_rank5(ptr, remote, astream)
        integer(int16), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int16_rank5

    subroutine update_remote_int8_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), pointer, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int8_rank0

    subroutine update_int8_rank0(ptr, remote, astream)
        integer(int8), pointer, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int8_rank0

    subroutine release_pointer_int8_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int8_rank0

    subroutine release_int8_rank0(ptr, remote, astream)
        integer(int8), pointer, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int8_rank0

    subroutine update_remote_and_release_pointer_int8_rank0(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), pointer, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int8_rank0

    subroutine update_and_release_int8_rank0(ptr, remote, astream)
        integer(int8), pointer, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int8_rank0

    subroutine update_remote_int8_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int8_rank1

    subroutine update_int8_rank1(ptr, remote, astream)
        integer(int8), dimension(:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int8_rank1

    subroutine release_pointer_int8_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int8_rank1

    subroutine release_int8_rank1(ptr, remote, astream)
        integer(int8), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int8_rank1

    subroutine update_remote_and_release_pointer_int8_rank1(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int8_rank1

    subroutine update_and_release_int8_rank1(ptr, remote, astream)
        integer(int8), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int8_rank1

    subroutine update_remote_int8_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int8_rank2

    subroutine update_int8_rank2(ptr, remote, astream)
        integer(int8), dimension(:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int8_rank2

    subroutine release_pointer_int8_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int8_rank2

    subroutine release_int8_rank2(ptr, remote, astream)
        integer(int8), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int8_rank2

    subroutine update_remote_and_release_pointer_int8_rank2(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int8_rank2

    subroutine update_and_release_int8_rank2(ptr, remote, astream)
        integer(int8), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int8_rank2

    subroutine update_remote_int8_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int8_rank3

    subroutine update_int8_rank3(ptr, remote, astream)
        integer(int8), dimension(:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int8_rank3

    subroutine release_pointer_int8_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int8_rank3

    subroutine release_int8_rank3(ptr, remote, astream)
        integer(int8), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int8_rank3

    subroutine update_remote_and_release_pointer_int8_rank3(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int8_rank3

    subroutine update_and_release_int8_rank3(ptr, remote, astream)
        integer(int8), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int8_rank3

    subroutine update_remote_int8_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int8_rank4

    subroutine update_int8_rank4(ptr, remote, astream)
        integer(int8), dimension(:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int8_rank4

    subroutine release_pointer_int8_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int8_rank4

    subroutine release_int8_rank4(ptr, remote, astream)
        integer(int8), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int8_rank4

    subroutine update_remote_and_release_pointer_int8_rank4(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int8_rank4

    subroutine update_and_release_int8_rank4(ptr, remote, astream)
        integer(int8), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int8_rank4

    subroutine update_remote_int8_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%update_remote_storage(local, remote, astream)
    end subroutine update_remote_int8_rank5

    subroutine update_int8_rank5(ptr, remote, astream)
        integer(int8), dimension(:,:,:,:,:), pointer, contiguous, intent(in) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_int8_rank5

    subroutine release_pointer_int8_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%create_host_storage(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_pointer_int8_rank5

    subroutine release_int8_rank5(ptr, remote, astream)
        integer(int8), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(in) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine release_int8_rank5

    subroutine update_remote_and_release_pointer_int8_rank5(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        integer(int8), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        call this%update_remote(ptr, remote, astream)
        call this%release_pointer(ptr, remote, astream)
    end subroutine update_remote_and_release_pointer_int8_rank5

    subroutine update_and_release_int8_rank5(ptr, remote, astream)
        integer(int8), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        type(fortran_data_converter) :: converter

        converter = fortran_data_converter()
        call converter%update_remote_and_release_pointer(ptr, remote, astream)
        call converter%cleanup()
    end subroutine update_and_release_int8_rank5

    subroutine secure_c_pointers(this, ptr, remote, array_size, astream)
        class(fortran_data_converter), intent(in) :: this
        type(c_ptr), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        integer(int64), intent(in) :: array_size
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call this%converter%allocate_host_storage(local)
        call memory_manager%secure_local_storage(remote, local, astream)
        call secure_c_ptr_array_from_host(ptr, local, array_size)
    end subroutine secure_c_pointers

    subroutine release_c_pointers(this, ptr, remote, astream)
        class(fortran_data_converter), intent(in) :: this
        type(c_ptr), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(data_storage), intent(inout) :: remote
        type(stream), intent(in), optional :: astream

        class(host_storage), allocatable :: local

        call create_host_storage_from_c_ptr_array(local, ptr)
        call memory_manager%release_local_storage(remote, local, astream)
        ptr => null()
    end subroutine release_c_pointers

    subroutine cleanup(this)
        class(fortran_data_converter), intent(inout) :: this

        call this%converter%cleanup()
    end subroutine cleanup
end module fortran_data_converter_module
