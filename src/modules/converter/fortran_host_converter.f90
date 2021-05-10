! Auto-generated. DO NOT MODIFY!
module fortran_host_converter_module
    use, intrinsic :: iso_fortran_env, only : &
            int64, &
            real64, &
            real32, &
            int32, &
            int16, &
            int8
    use, intrinsic :: iso_c_binding, only : &
            c_intptr_t, &
            c_f_pointer, &
            c_loc, &
            c_ptr
    use :: host_storage_module, only : &
            host_storage
    use :: host_builder_module, only : &
            host_builder

    implicit none
    private

    public :: fortran_host_converter
    public :: secure_fortran_pointer_from_host
    public :: create_host_storage
    public :: get_host_storage_from_array
    public :: get_host_storage_from_c_ptr_array
    public :: secure_c_ptr_array_from_host
    public :: create_host_storage_from_c_ptr_array

    type :: fortran_host_converter
        class(host_builder), allocatable :: builder
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
        generic :: create_host_storage => &
                create_host_storage_complex128_rank0, &
                create_host_storage_complex128_rank1, &
                create_host_storage_complex128_rank2, &
                create_host_storage_complex128_rank3, &
                create_host_storage_complex128_rank4, &
                create_host_storage_complex128_rank5, &
                create_host_storage_complex64_rank0, &
                create_host_storage_complex64_rank1, &
                create_host_storage_complex64_rank2, &
                create_host_storage_complex64_rank3, &
                create_host_storage_complex64_rank4, &
                create_host_storage_complex64_rank5, &
                create_host_storage_real64_rank0, &
                create_host_storage_real64_rank1, &
                create_host_storage_real64_rank2, &
                create_host_storage_real64_rank3, &
                create_host_storage_real64_rank4, &
                create_host_storage_real64_rank5, &
                create_host_storage_real32_rank0, &
                create_host_storage_real32_rank1, &
                create_host_storage_real32_rank2, &
                create_host_storage_real32_rank3, &
                create_host_storage_real32_rank4, &
                create_host_storage_real32_rank5, &
                create_host_storage_int64_rank0, &
                create_host_storage_int64_rank1, &
                create_host_storage_int64_rank2, &
                create_host_storage_int64_rank3, &
                create_host_storage_int64_rank4, &
                create_host_storage_int64_rank5, &
                create_host_storage_int32_rank0, &
                create_host_storage_int32_rank1, &
                create_host_storage_int32_rank2, &
                create_host_storage_int32_rank3, &
                create_host_storage_int32_rank4, &
                create_host_storage_int32_rank5, &
                create_host_storage_int16_rank0, &
                create_host_storage_int16_rank1, &
                create_host_storage_int16_rank2, &
                create_host_storage_int16_rank3, &
                create_host_storage_int16_rank4, &
                create_host_storage_int16_rank5, &
                create_host_storage_int8_rank0, &
                create_host_storage_int8_rank1, &
                create_host_storage_int8_rank2, &
                create_host_storage_int8_rank3, &
                create_host_storage_int8_rank4, &
                create_host_storage_int8_rank5
        generic :: get_host_storage => &
                get_host_storage_complex128_rank0, &
                get_host_storage_complex128_rank1, &
                get_host_storage_complex128_rank2, &
                get_host_storage_complex128_rank3, &
                get_host_storage_complex128_rank4, &
                get_host_storage_complex128_rank5, &
                get_host_storage_complex64_rank0, &
                get_host_storage_complex64_rank1, &
                get_host_storage_complex64_rank2, &
                get_host_storage_complex64_rank3, &
                get_host_storage_complex64_rank4, &
                get_host_storage_complex64_rank5, &
                get_host_storage_real64_rank0, &
                get_host_storage_real64_rank1, &
                get_host_storage_real64_rank2, &
                get_host_storage_real64_rank3, &
                get_host_storage_real64_rank4, &
                get_host_storage_real64_rank5, &
                get_host_storage_real32_rank0, &
                get_host_storage_real32_rank1, &
                get_host_storage_real32_rank2, &
                get_host_storage_real32_rank3, &
                get_host_storage_real32_rank4, &
                get_host_storage_real32_rank5, &
                get_host_storage_int64_rank0, &
                get_host_storage_int64_rank1, &
                get_host_storage_int64_rank2, &
                get_host_storage_int64_rank3, &
                get_host_storage_int64_rank4, &
                get_host_storage_int64_rank5, &
                get_host_storage_int32_rank0, &
                get_host_storage_int32_rank1, &
                get_host_storage_int32_rank2, &
                get_host_storage_int32_rank3, &
                get_host_storage_int32_rank4, &
                get_host_storage_int32_rank5, &
                get_host_storage_int16_rank0, &
                get_host_storage_int16_rank1, &
                get_host_storage_int16_rank2, &
                get_host_storage_int16_rank3, &
                get_host_storage_int16_rank4, &
                get_host_storage_int16_rank5, &
                get_host_storage_int8_rank0, &
                get_host_storage_int8_rank1, &
                get_host_storage_int8_rank2, &
                get_host_storage_int8_rank3, &
                get_host_storage_int8_rank4, &
                get_host_storage_int8_rank5
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
        procedure :: create_host_storage_complex128_rank0 => create_host_storage_complex128_rank0
        procedure :: create_host_storage_complex128_rank1 => create_host_storage_complex128_rank1
        procedure :: create_host_storage_complex128_rank2 => create_host_storage_complex128_rank2
        procedure :: create_host_storage_complex128_rank3 => create_host_storage_complex128_rank3
        procedure :: create_host_storage_complex128_rank4 => create_host_storage_complex128_rank4
        procedure :: create_host_storage_complex128_rank5 => create_host_storage_complex128_rank5
        procedure :: create_host_storage_complex64_rank0 => create_host_storage_complex64_rank0
        procedure :: create_host_storage_complex64_rank1 => create_host_storage_complex64_rank1
        procedure :: create_host_storage_complex64_rank2 => create_host_storage_complex64_rank2
        procedure :: create_host_storage_complex64_rank3 => create_host_storage_complex64_rank3
        procedure :: create_host_storage_complex64_rank4 => create_host_storage_complex64_rank4
        procedure :: create_host_storage_complex64_rank5 => create_host_storage_complex64_rank5
        procedure :: create_host_storage_real64_rank0 => create_host_storage_real64_rank0
        procedure :: create_host_storage_real64_rank1 => create_host_storage_real64_rank1
        procedure :: create_host_storage_real64_rank2 => create_host_storage_real64_rank2
        procedure :: create_host_storage_real64_rank3 => create_host_storage_real64_rank3
        procedure :: create_host_storage_real64_rank4 => create_host_storage_real64_rank4
        procedure :: create_host_storage_real64_rank5 => create_host_storage_real64_rank5
        procedure :: create_host_storage_real32_rank0 => create_host_storage_real32_rank0
        procedure :: create_host_storage_real32_rank1 => create_host_storage_real32_rank1
        procedure :: create_host_storage_real32_rank2 => create_host_storage_real32_rank2
        procedure :: create_host_storage_real32_rank3 => create_host_storage_real32_rank3
        procedure :: create_host_storage_real32_rank4 => create_host_storage_real32_rank4
        procedure :: create_host_storage_real32_rank5 => create_host_storage_real32_rank5
        procedure :: create_host_storage_int64_rank0 => create_host_storage_int64_rank0
        procedure :: create_host_storage_int64_rank1 => create_host_storage_int64_rank1
        procedure :: create_host_storage_int64_rank2 => create_host_storage_int64_rank2
        procedure :: create_host_storage_int64_rank3 => create_host_storage_int64_rank3
        procedure :: create_host_storage_int64_rank4 => create_host_storage_int64_rank4
        procedure :: create_host_storage_int64_rank5 => create_host_storage_int64_rank5
        procedure :: create_host_storage_int32_rank0 => create_host_storage_int32_rank0
        procedure :: create_host_storage_int32_rank1 => create_host_storage_int32_rank1
        procedure :: create_host_storage_int32_rank2 => create_host_storage_int32_rank2
        procedure :: create_host_storage_int32_rank3 => create_host_storage_int32_rank3
        procedure :: create_host_storage_int32_rank4 => create_host_storage_int32_rank4
        procedure :: create_host_storage_int32_rank5 => create_host_storage_int32_rank5
        procedure :: create_host_storage_int16_rank0 => create_host_storage_int16_rank0
        procedure :: create_host_storage_int16_rank1 => create_host_storage_int16_rank1
        procedure :: create_host_storage_int16_rank2 => create_host_storage_int16_rank2
        procedure :: create_host_storage_int16_rank3 => create_host_storage_int16_rank3
        procedure :: create_host_storage_int16_rank4 => create_host_storage_int16_rank4
        procedure :: create_host_storage_int16_rank5 => create_host_storage_int16_rank5
        procedure :: create_host_storage_int8_rank0 => create_host_storage_int8_rank0
        procedure :: create_host_storage_int8_rank1 => create_host_storage_int8_rank1
        procedure :: create_host_storage_int8_rank2 => create_host_storage_int8_rank2
        procedure :: create_host_storage_int8_rank3 => create_host_storage_int8_rank3
        procedure :: create_host_storage_int8_rank4 => create_host_storage_int8_rank4
        procedure :: create_host_storage_int8_rank5 => create_host_storage_int8_rank5
        procedure :: get_host_storage_complex128_rank0 => get_host_storage_complex128_rank0
        procedure :: get_host_storage_complex128_rank1 => get_host_storage_complex128_rank1
        procedure :: get_host_storage_complex128_rank2 => get_host_storage_complex128_rank2
        procedure :: get_host_storage_complex128_rank3 => get_host_storage_complex128_rank3
        procedure :: get_host_storage_complex128_rank4 => get_host_storage_complex128_rank4
        procedure :: get_host_storage_complex128_rank5 => get_host_storage_complex128_rank5
        procedure :: get_host_storage_complex64_rank0 => get_host_storage_complex64_rank0
        procedure :: get_host_storage_complex64_rank1 => get_host_storage_complex64_rank1
        procedure :: get_host_storage_complex64_rank2 => get_host_storage_complex64_rank2
        procedure :: get_host_storage_complex64_rank3 => get_host_storage_complex64_rank3
        procedure :: get_host_storage_complex64_rank4 => get_host_storage_complex64_rank4
        procedure :: get_host_storage_complex64_rank5 => get_host_storage_complex64_rank5
        procedure :: get_host_storage_real64_rank0 => get_host_storage_real64_rank0
        procedure :: get_host_storage_real64_rank1 => get_host_storage_real64_rank1
        procedure :: get_host_storage_real64_rank2 => get_host_storage_real64_rank2
        procedure :: get_host_storage_real64_rank3 => get_host_storage_real64_rank3
        procedure :: get_host_storage_real64_rank4 => get_host_storage_real64_rank4
        procedure :: get_host_storage_real64_rank5 => get_host_storage_real64_rank5
        procedure :: get_host_storage_real32_rank0 => get_host_storage_real32_rank0
        procedure :: get_host_storage_real32_rank1 => get_host_storage_real32_rank1
        procedure :: get_host_storage_real32_rank2 => get_host_storage_real32_rank2
        procedure :: get_host_storage_real32_rank3 => get_host_storage_real32_rank3
        procedure :: get_host_storage_real32_rank4 => get_host_storage_real32_rank4
        procedure :: get_host_storage_real32_rank5 => get_host_storage_real32_rank5
        procedure :: get_host_storage_int64_rank0 => get_host_storage_int64_rank0
        procedure :: get_host_storage_int64_rank1 => get_host_storage_int64_rank1
        procedure :: get_host_storage_int64_rank2 => get_host_storage_int64_rank2
        procedure :: get_host_storage_int64_rank3 => get_host_storage_int64_rank3
        procedure :: get_host_storage_int64_rank4 => get_host_storage_int64_rank4
        procedure :: get_host_storage_int64_rank5 => get_host_storage_int64_rank5
        procedure :: get_host_storage_int32_rank0 => get_host_storage_int32_rank0
        procedure :: get_host_storage_int32_rank1 => get_host_storage_int32_rank1
        procedure :: get_host_storage_int32_rank2 => get_host_storage_int32_rank2
        procedure :: get_host_storage_int32_rank3 => get_host_storage_int32_rank3
        procedure :: get_host_storage_int32_rank4 => get_host_storage_int32_rank4
        procedure :: get_host_storage_int32_rank5 => get_host_storage_int32_rank5
        procedure :: get_host_storage_int16_rank0 => get_host_storage_int16_rank0
        procedure :: get_host_storage_int16_rank1 => get_host_storage_int16_rank1
        procedure :: get_host_storage_int16_rank2 => get_host_storage_int16_rank2
        procedure :: get_host_storage_int16_rank3 => get_host_storage_int16_rank3
        procedure :: get_host_storage_int16_rank4 => get_host_storage_int16_rank4
        procedure :: get_host_storage_int16_rank5 => get_host_storage_int16_rank5
        procedure :: get_host_storage_int8_rank0 => get_host_storage_int8_rank0
        procedure :: get_host_storage_int8_rank1 => get_host_storage_int8_rank1
        procedure :: get_host_storage_int8_rank2 => get_host_storage_int8_rank2
        procedure :: get_host_storage_int8_rank3 => get_host_storage_int8_rank3
        procedure :: get_host_storage_int8_rank4 => get_host_storage_int8_rank4
        procedure :: get_host_storage_int8_rank5 => get_host_storage_int8_rank5
        procedure, nopass :: get_host_storage_from_c_ptr_array => get_host_storage_from_c_ptr_array
        procedure :: allocate_host_storage => allocate_host_storage
        procedure, private :: set_host_storage => set_host_storage
        procedure :: cleanup => cleanup
    end type fortran_host_converter

    interface secure_fortran_pointer_from_host
        module procedure sfp_from_host_complex128_rank0
        module procedure sfp_from_host_complex64_rank0
        module procedure sfp_from_host_real64_rank0
        module procedure sfp_from_host_real32_rank0
        module procedure sfp_from_host_int64_rank0
        module procedure sfp_from_host_int32_rank0
        module procedure sfp_from_host_int16_rank0
        module procedure sfp_from_host_int8_rank0
        module procedure sfp_from_host_complex128_rank1_from_integer
        module procedure sfp_from_host_complex128_rank1_from_int64
        module procedure sfp_from_host_complex128_rank2_from_integer
        module procedure sfp_from_host_complex128_rank2_from_int64
        module procedure sfp_from_host_complex128_rank3_from_integer
        module procedure sfp_from_host_complex128_rank3_from_int64
        module procedure sfp_from_host_complex128_rank4_from_integer
        module procedure sfp_from_host_complex128_rank4_from_int64
        module procedure sfp_from_host_complex128_rank5_from_integer
        module procedure sfp_from_host_complex128_rank5_from_int64
        module procedure sfp_from_host_complex64_rank1_from_integer
        module procedure sfp_from_host_complex64_rank1_from_int64
        module procedure sfp_from_host_complex64_rank2_from_integer
        module procedure sfp_from_host_complex64_rank2_from_int64
        module procedure sfp_from_host_complex64_rank3_from_integer
        module procedure sfp_from_host_complex64_rank3_from_int64
        module procedure sfp_from_host_complex64_rank4_from_integer
        module procedure sfp_from_host_complex64_rank4_from_int64
        module procedure sfp_from_host_complex64_rank5_from_integer
        module procedure sfp_from_host_complex64_rank5_from_int64
        module procedure sfp_from_host_real64_rank1_from_integer
        module procedure sfp_from_host_real64_rank1_from_int64
        module procedure sfp_from_host_real64_rank2_from_integer
        module procedure sfp_from_host_real64_rank2_from_int64
        module procedure sfp_from_host_real64_rank3_from_integer
        module procedure sfp_from_host_real64_rank3_from_int64
        module procedure sfp_from_host_real64_rank4_from_integer
        module procedure sfp_from_host_real64_rank4_from_int64
        module procedure sfp_from_host_real64_rank5_from_integer
        module procedure sfp_from_host_real64_rank5_from_int64
        module procedure sfp_from_host_real32_rank1_from_integer
        module procedure sfp_from_host_real32_rank1_from_int64
        module procedure sfp_from_host_real32_rank2_from_integer
        module procedure sfp_from_host_real32_rank2_from_int64
        module procedure sfp_from_host_real32_rank3_from_integer
        module procedure sfp_from_host_real32_rank3_from_int64
        module procedure sfp_from_host_real32_rank4_from_integer
        module procedure sfp_from_host_real32_rank4_from_int64
        module procedure sfp_from_host_real32_rank5_from_integer
        module procedure sfp_from_host_real32_rank5_from_int64
        module procedure sfp_from_host_int64_rank1_from_integer
        module procedure sfp_from_host_int64_rank1_from_int64
        module procedure sfp_from_host_int64_rank2_from_integer
        module procedure sfp_from_host_int64_rank2_from_int64
        module procedure sfp_from_host_int64_rank3_from_integer
        module procedure sfp_from_host_int64_rank3_from_int64
        module procedure sfp_from_host_int64_rank4_from_integer
        module procedure sfp_from_host_int64_rank4_from_int64
        module procedure sfp_from_host_int64_rank5_from_integer
        module procedure sfp_from_host_int64_rank5_from_int64
        module procedure sfp_from_host_int32_rank1_from_integer
        module procedure sfp_from_host_int32_rank1_from_int64
        module procedure sfp_from_host_int32_rank2_from_integer
        module procedure sfp_from_host_int32_rank2_from_int64
        module procedure sfp_from_host_int32_rank3_from_integer
        module procedure sfp_from_host_int32_rank3_from_int64
        module procedure sfp_from_host_int32_rank4_from_integer
        module procedure sfp_from_host_int32_rank4_from_int64
        module procedure sfp_from_host_int32_rank5_from_integer
        module procedure sfp_from_host_int32_rank5_from_int64
        module procedure sfp_from_host_int16_rank1_from_integer
        module procedure sfp_from_host_int16_rank1_from_int64
        module procedure sfp_from_host_int16_rank2_from_integer
        module procedure sfp_from_host_int16_rank2_from_int64
        module procedure sfp_from_host_int16_rank3_from_integer
        module procedure sfp_from_host_int16_rank3_from_int64
        module procedure sfp_from_host_int16_rank4_from_integer
        module procedure sfp_from_host_int16_rank4_from_int64
        module procedure sfp_from_host_int16_rank5_from_integer
        module procedure sfp_from_host_int16_rank5_from_int64
        module procedure sfp_from_host_int8_rank1_from_integer
        module procedure sfp_from_host_int8_rank1_from_int64
        module procedure sfp_from_host_int8_rank2_from_integer
        module procedure sfp_from_host_int8_rank2_from_int64
        module procedure sfp_from_host_int8_rank3_from_integer
        module procedure sfp_from_host_int8_rank3_from_int64
        module procedure sfp_from_host_int8_rank4_from_integer
        module procedure sfp_from_host_int8_rank4_from_int64
        module procedure sfp_from_host_int8_rank5_from_integer
        module procedure sfp_from_host_int8_rank5_from_int64
    end interface secure_fortran_pointer_from_host

    interface create_host_storage
        module procedure create_host_storage_nopass_complex128_rank0
        module procedure create_host_storage_nopass_complex128_rank1
        module procedure create_host_storage_nopass_complex128_rank2
        module procedure create_host_storage_nopass_complex128_rank3
        module procedure create_host_storage_nopass_complex128_rank4
        module procedure create_host_storage_nopass_complex128_rank5
        module procedure create_host_storage_nopass_complex64_rank0
        module procedure create_host_storage_nopass_complex64_rank1
        module procedure create_host_storage_nopass_complex64_rank2
        module procedure create_host_storage_nopass_complex64_rank3
        module procedure create_host_storage_nopass_complex64_rank4
        module procedure create_host_storage_nopass_complex64_rank5
        module procedure create_host_storage_nopass_real64_rank0
        module procedure create_host_storage_nopass_real64_rank1
        module procedure create_host_storage_nopass_real64_rank2
        module procedure create_host_storage_nopass_real64_rank3
        module procedure create_host_storage_nopass_real64_rank4
        module procedure create_host_storage_nopass_real64_rank5
        module procedure create_host_storage_nopass_real32_rank0
        module procedure create_host_storage_nopass_real32_rank1
        module procedure create_host_storage_nopass_real32_rank2
        module procedure create_host_storage_nopass_real32_rank3
        module procedure create_host_storage_nopass_real32_rank4
        module procedure create_host_storage_nopass_real32_rank5
        module procedure create_host_storage_nopass_int64_rank0
        module procedure create_host_storage_nopass_int64_rank1
        module procedure create_host_storage_nopass_int64_rank2
        module procedure create_host_storage_nopass_int64_rank3
        module procedure create_host_storage_nopass_int64_rank4
        module procedure create_host_storage_nopass_int64_rank5
        module procedure create_host_storage_nopass_int32_rank0
        module procedure create_host_storage_nopass_int32_rank1
        module procedure create_host_storage_nopass_int32_rank2
        module procedure create_host_storage_nopass_int32_rank3
        module procedure create_host_storage_nopass_int32_rank4
        module procedure create_host_storage_nopass_int32_rank5
        module procedure create_host_storage_nopass_int16_rank0
        module procedure create_host_storage_nopass_int16_rank1
        module procedure create_host_storage_nopass_int16_rank2
        module procedure create_host_storage_nopass_int16_rank3
        module procedure create_host_storage_nopass_int16_rank4
        module procedure create_host_storage_nopass_int16_rank5
        module procedure create_host_storage_nopass_int8_rank0
        module procedure create_host_storage_nopass_int8_rank1
        module procedure create_host_storage_nopass_int8_rank2
        module procedure create_host_storage_nopass_int8_rank3
        module procedure create_host_storage_nopass_int8_rank4
        module procedure create_host_storage_nopass_int8_rank5
    end interface create_host_storage

    interface get_host_storage_from_array
        module procedure get_from_array_complex128_rank0
        module procedure get_from_array_complex128_rank1
        module procedure get_from_array_complex128_rank2
        module procedure get_from_array_complex128_rank3
        module procedure get_from_array_complex128_rank4
        module procedure get_from_array_complex128_rank5
        module procedure get_from_array_complex64_rank0
        module procedure get_from_array_complex64_rank1
        module procedure get_from_array_complex64_rank2
        module procedure get_from_array_complex64_rank3
        module procedure get_from_array_complex64_rank4
        module procedure get_from_array_complex64_rank5
        module procedure get_from_array_real64_rank0
        module procedure get_from_array_real64_rank1
        module procedure get_from_array_real64_rank2
        module procedure get_from_array_real64_rank3
        module procedure get_from_array_real64_rank4
        module procedure get_from_array_real64_rank5
        module procedure get_from_array_real32_rank0
        module procedure get_from_array_real32_rank1
        module procedure get_from_array_real32_rank2
        module procedure get_from_array_real32_rank3
        module procedure get_from_array_real32_rank4
        module procedure get_from_array_real32_rank5
        module procedure get_from_array_int64_rank0
        module procedure get_from_array_int64_rank1
        module procedure get_from_array_int64_rank2
        module procedure get_from_array_int64_rank3
        module procedure get_from_array_int64_rank4
        module procedure get_from_array_int64_rank5
        module procedure get_from_array_int32_rank0
        module procedure get_from_array_int32_rank1
        module procedure get_from_array_int32_rank2
        module procedure get_from_array_int32_rank3
        module procedure get_from_array_int32_rank4
        module procedure get_from_array_int32_rank5
        module procedure get_from_array_int16_rank0
        module procedure get_from_array_int16_rank1
        module procedure get_from_array_int16_rank2
        module procedure get_from_array_int16_rank3
        module procedure get_from_array_int16_rank4
        module procedure get_from_array_int16_rank5
        module procedure get_from_array_int8_rank0
        module procedure get_from_array_int8_rank1
        module procedure get_from_array_int8_rank2
        module procedure get_from_array_int8_rank3
        module procedure get_from_array_int8_rank4
        module procedure get_from_array_int8_rank5
    end interface get_host_storage_from_array

    interface fortran_host_converter
        module procedure constructor_empty
        module procedure constructor
    end interface fortran_host_converter
contains
    function constructor_empty() result(this)
        type(fortran_host_converter) :: this

        this = fortran_host_converter(host_builder())
    end function constructor_empty

    function constructor(builder) result(this)
        class(host_builder), intent(in) :: builder
        type(fortran_host_converter) :: this

        this%builder = builder
    end function constructor

    subroutine create_host_storage_complex128_rank0(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real64), target, intent(in) :: array

        integer(int64) :: number_of_bytes

        number_of_bytes = storage_size((1.0_real64, 1.0_real64))/8
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_complex128_rank0

    subroutine create_host_storage_nopass_complex128_rank0(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real64), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_complex128_rank0

    function get_host_storage_complex128_rank0(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        complex(real64), target, intent(in) :: array
        type(host_storage) :: storage

        integer(int64) :: number_of_bytes

        storage = host_storage()
        number_of_bytes = storage_size((1.0_real64, 1.0_real64))/8
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_complex128_rank0

    function get_from_array_complex128_rank0(array) result(storage)
        complex(real64), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_complex128_rank0

    subroutine create_host_storage_complex128_rank1(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real64), dimension(:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_complex128_rank1

    subroutine create_host_storage_nopass_complex128_rank1(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real64), dimension(:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_complex128_rank1

    function get_host_storage_complex128_rank1(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        complex(real64), dimension(:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_complex128_rank1

    function get_from_array_complex128_rank1(array) result(storage)
        complex(real64), dimension(:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_complex128_rank1

    subroutine create_host_storage_complex128_rank2(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real64), dimension(:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_complex128_rank2

    subroutine create_host_storage_nopass_complex128_rank2(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real64), dimension(:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_complex128_rank2

    function get_host_storage_complex128_rank2(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        complex(real64), dimension(:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_complex128_rank2

    function get_from_array_complex128_rank2(array) result(storage)
        complex(real64), dimension(:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_complex128_rank2

    subroutine create_host_storage_complex128_rank3(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real64), dimension(:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_complex128_rank3

    subroutine create_host_storage_nopass_complex128_rank3(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real64), dimension(:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_complex128_rank3

    function get_host_storage_complex128_rank3(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        complex(real64), dimension(:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_complex128_rank3

    function get_from_array_complex128_rank3(array) result(storage)
        complex(real64), dimension(:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_complex128_rank3

    subroutine create_host_storage_complex128_rank4(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real64), dimension(:,:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_complex128_rank4

    subroutine create_host_storage_nopass_complex128_rank4(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real64), dimension(:,:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_complex128_rank4

    function get_host_storage_complex128_rank4(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        complex(real64), dimension(:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_complex128_rank4

    function get_from_array_complex128_rank4(array) result(storage)
        complex(real64), dimension(:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_complex128_rank4

    subroutine create_host_storage_complex128_rank5(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real64), dimension(:,:,:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_complex128_rank5

    subroutine create_host_storage_nopass_complex128_rank5(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real64), dimension(:,:,:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_complex128_rank5

    function get_host_storage_complex128_rank5(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        complex(real64), dimension(:,:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_complex128_rank5

    function get_from_array_complex128_rank5(array) result(storage)
        complex(real64), dimension(:,:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_complex128_rank5

    subroutine create_host_storage_complex64_rank0(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real32), target, intent(in) :: array

        integer(int64) :: number_of_bytes

        number_of_bytes = storage_size((1.0_real32, 1.0_real32))/8
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_complex64_rank0

    subroutine create_host_storage_nopass_complex64_rank0(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real32), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_complex64_rank0

    function get_host_storage_complex64_rank0(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        complex(real32), target, intent(in) :: array
        type(host_storage) :: storage

        integer(int64) :: number_of_bytes

        storage = host_storage()
        number_of_bytes = storage_size((1.0_real32, 1.0_real32))/8
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_complex64_rank0

    function get_from_array_complex64_rank0(array) result(storage)
        complex(real32), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_complex64_rank0

    subroutine create_host_storage_complex64_rank1(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real32), dimension(:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_complex64_rank1

    subroutine create_host_storage_nopass_complex64_rank1(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real32), dimension(:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_complex64_rank1

    function get_host_storage_complex64_rank1(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        complex(real32), dimension(:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_complex64_rank1

    function get_from_array_complex64_rank1(array) result(storage)
        complex(real32), dimension(:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_complex64_rank1

    subroutine create_host_storage_complex64_rank2(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real32), dimension(:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_complex64_rank2

    subroutine create_host_storage_nopass_complex64_rank2(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real32), dimension(:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_complex64_rank2

    function get_host_storage_complex64_rank2(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        complex(real32), dimension(:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_complex64_rank2

    function get_from_array_complex64_rank2(array) result(storage)
        complex(real32), dimension(:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_complex64_rank2

    subroutine create_host_storage_complex64_rank3(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real32), dimension(:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_complex64_rank3

    subroutine create_host_storage_nopass_complex64_rank3(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real32), dimension(:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_complex64_rank3

    function get_host_storage_complex64_rank3(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        complex(real32), dimension(:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_complex64_rank3

    function get_from_array_complex64_rank3(array) result(storage)
        complex(real32), dimension(:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_complex64_rank3

    subroutine create_host_storage_complex64_rank4(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real32), dimension(:,:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_complex64_rank4

    subroutine create_host_storage_nopass_complex64_rank4(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real32), dimension(:,:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_complex64_rank4

    function get_host_storage_complex64_rank4(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        complex(real32), dimension(:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_complex64_rank4

    function get_from_array_complex64_rank4(array) result(storage)
        complex(real32), dimension(:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_complex64_rank4

    subroutine create_host_storage_complex64_rank5(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real32), dimension(:,:,:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_complex64_rank5

    subroutine create_host_storage_nopass_complex64_rank5(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        complex(real32), dimension(:,:,:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_complex64_rank5

    function get_host_storage_complex64_rank5(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        complex(real32), dimension(:,:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_complex64_rank5

    function get_from_array_complex64_rank5(array) result(storage)
        complex(real32), dimension(:,:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_complex64_rank5

    subroutine create_host_storage_real64_rank0(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        real(real64), target, intent(in) :: array

        integer(int64) :: number_of_bytes

        number_of_bytes = storage_size(1.0_real64)/8
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_real64_rank0

    subroutine create_host_storage_nopass_real64_rank0(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        real(real64), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_real64_rank0

    function get_host_storage_real64_rank0(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        real(real64), target, intent(in) :: array
        type(host_storage) :: storage

        integer(int64) :: number_of_bytes

        storage = host_storage()
        number_of_bytes = storage_size(1.0_real64)/8
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_real64_rank0

    function get_from_array_real64_rank0(array) result(storage)
        real(real64), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_real64_rank0

    subroutine create_host_storage_real64_rank1(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        real(real64), dimension(:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1.0_real64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_real64_rank1

    subroutine create_host_storage_nopass_real64_rank1(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        real(real64), dimension(:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_real64_rank1

    function get_host_storage_real64_rank1(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        real(real64), dimension(:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1.0_real64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_real64_rank1

    function get_from_array_real64_rank1(array) result(storage)
        real(real64), dimension(:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_real64_rank1

    subroutine create_host_storage_real64_rank2(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        real(real64), dimension(:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1.0_real64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_real64_rank2

    subroutine create_host_storage_nopass_real64_rank2(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        real(real64), dimension(:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_real64_rank2

    function get_host_storage_real64_rank2(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        real(real64), dimension(:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1.0_real64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_real64_rank2

    function get_from_array_real64_rank2(array) result(storage)
        real(real64), dimension(:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_real64_rank2

    subroutine create_host_storage_real64_rank3(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        real(real64), dimension(:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1.0_real64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_real64_rank3

    subroutine create_host_storage_nopass_real64_rank3(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        real(real64), dimension(:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_real64_rank3

    function get_host_storage_real64_rank3(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        real(real64), dimension(:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1.0_real64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_real64_rank3

    function get_from_array_real64_rank3(array) result(storage)
        real(real64), dimension(:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_real64_rank3

    subroutine create_host_storage_real64_rank4(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        real(real64), dimension(:,:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1.0_real64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_real64_rank4

    subroutine create_host_storage_nopass_real64_rank4(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        real(real64), dimension(:,:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_real64_rank4

    function get_host_storage_real64_rank4(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        real(real64), dimension(:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1.0_real64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_real64_rank4

    function get_from_array_real64_rank4(array) result(storage)
        real(real64), dimension(:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_real64_rank4

    subroutine create_host_storage_real64_rank5(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        real(real64), dimension(:,:,:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1.0_real64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_real64_rank5

    subroutine create_host_storage_nopass_real64_rank5(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        real(real64), dimension(:,:,:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_real64_rank5

    function get_host_storage_real64_rank5(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        real(real64), dimension(:,:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1.0_real64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_real64_rank5

    function get_from_array_real64_rank5(array) result(storage)
        real(real64), dimension(:,:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_real64_rank5

    subroutine create_host_storage_real32_rank0(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        real(real32), target, intent(in) :: array

        integer(int64) :: number_of_bytes

        number_of_bytes = storage_size(1.0_real32)/8
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_real32_rank0

    subroutine create_host_storage_nopass_real32_rank0(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        real(real32), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_real32_rank0

    function get_host_storage_real32_rank0(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        real(real32), target, intent(in) :: array
        type(host_storage) :: storage

        integer(int64) :: number_of_bytes

        storage = host_storage()
        number_of_bytes = storage_size(1.0_real32)/8
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_real32_rank0

    function get_from_array_real32_rank0(array) result(storage)
        real(real32), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_real32_rank0

    subroutine create_host_storage_real32_rank1(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        real(real32), dimension(:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1.0_real32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_real32_rank1

    subroutine create_host_storage_nopass_real32_rank1(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        real(real32), dimension(:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_real32_rank1

    function get_host_storage_real32_rank1(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        real(real32), dimension(:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1.0_real32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_real32_rank1

    function get_from_array_real32_rank1(array) result(storage)
        real(real32), dimension(:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_real32_rank1

    subroutine create_host_storage_real32_rank2(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        real(real32), dimension(:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1.0_real32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_real32_rank2

    subroutine create_host_storage_nopass_real32_rank2(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        real(real32), dimension(:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_real32_rank2

    function get_host_storage_real32_rank2(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        real(real32), dimension(:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1.0_real32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_real32_rank2

    function get_from_array_real32_rank2(array) result(storage)
        real(real32), dimension(:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_real32_rank2

    subroutine create_host_storage_real32_rank3(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        real(real32), dimension(:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1.0_real32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_real32_rank3

    subroutine create_host_storage_nopass_real32_rank3(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        real(real32), dimension(:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_real32_rank3

    function get_host_storage_real32_rank3(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        real(real32), dimension(:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1.0_real32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_real32_rank3

    function get_from_array_real32_rank3(array) result(storage)
        real(real32), dimension(:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_real32_rank3

    subroutine create_host_storage_real32_rank4(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        real(real32), dimension(:,:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1.0_real32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_real32_rank4

    subroutine create_host_storage_nopass_real32_rank4(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        real(real32), dimension(:,:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_real32_rank4

    function get_host_storage_real32_rank4(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        real(real32), dimension(:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1.0_real32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_real32_rank4

    function get_from_array_real32_rank4(array) result(storage)
        real(real32), dimension(:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_real32_rank4

    subroutine create_host_storage_real32_rank5(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        real(real32), dimension(:,:,:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1.0_real32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_real32_rank5

    subroutine create_host_storage_nopass_real32_rank5(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        real(real32), dimension(:,:,:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_real32_rank5

    function get_host_storage_real32_rank5(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        real(real32), dimension(:,:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1.0_real32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_real32_rank5

    function get_from_array_real32_rank5(array) result(storage)
        real(real32), dimension(:,:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_real32_rank5

    subroutine create_host_storage_int64_rank0(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int64), target, intent(in) :: array

        integer(int64) :: number_of_bytes

        number_of_bytes = storage_size(1_int64)/8
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int64_rank0

    subroutine create_host_storage_nopass_int64_rank0(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int64), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int64_rank0

    function get_host_storage_int64_rank0(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int64), target, intent(in) :: array
        type(host_storage) :: storage

        integer(int64) :: number_of_bytes

        storage = host_storage()
        number_of_bytes = storage_size(1_int64)/8
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int64_rank0

    function get_from_array_int64_rank0(array) result(storage)
        integer(int64), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int64_rank0

    subroutine create_host_storage_int64_rank1(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int64), dimension(:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int64_rank1

    subroutine create_host_storage_nopass_int64_rank1(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int64), dimension(:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int64_rank1

    function get_host_storage_int64_rank1(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int64), dimension(:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int64_rank1

    function get_from_array_int64_rank1(array) result(storage)
        integer(int64), dimension(:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int64_rank1

    subroutine create_host_storage_int64_rank2(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int64), dimension(:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int64_rank2

    subroutine create_host_storage_nopass_int64_rank2(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int64), dimension(:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int64_rank2

    function get_host_storage_int64_rank2(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int64), dimension(:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int64_rank2

    function get_from_array_int64_rank2(array) result(storage)
        integer(int64), dimension(:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int64_rank2

    subroutine create_host_storage_int64_rank3(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int64), dimension(:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int64_rank3

    subroutine create_host_storage_nopass_int64_rank3(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int64), dimension(:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int64_rank3

    function get_host_storage_int64_rank3(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int64), dimension(:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int64_rank3

    function get_from_array_int64_rank3(array) result(storage)
        integer(int64), dimension(:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int64_rank3

    subroutine create_host_storage_int64_rank4(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int64), dimension(:,:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int64_rank4

    subroutine create_host_storage_nopass_int64_rank4(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int64), dimension(:,:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int64_rank4

    function get_host_storage_int64_rank4(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int64), dimension(:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int64_rank4

    function get_from_array_int64_rank4(array) result(storage)
        integer(int64), dimension(:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int64_rank4

    subroutine create_host_storage_int64_rank5(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int64), dimension(:,:,:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int64_rank5

    subroutine create_host_storage_nopass_int64_rank5(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int64), dimension(:,:,:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int64_rank5

    function get_host_storage_int64_rank5(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int64), dimension(:,:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int64)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int64_rank5

    function get_from_array_int64_rank5(array) result(storage)
        integer(int64), dimension(:,:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int64_rank5

    subroutine create_host_storage_int32_rank0(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int32), target, intent(in) :: array

        integer(int64) :: number_of_bytes

        number_of_bytes = storage_size(1_int32)/8
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int32_rank0

    subroutine create_host_storage_nopass_int32_rank0(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int32), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int32_rank0

    function get_host_storage_int32_rank0(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int32), target, intent(in) :: array
        type(host_storage) :: storage

        integer(int64) :: number_of_bytes

        storage = host_storage()
        number_of_bytes = storage_size(1_int32)/8
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int32_rank0

    function get_from_array_int32_rank0(array) result(storage)
        integer(int32), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int32_rank0

    subroutine create_host_storage_int32_rank1(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int32), dimension(:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int32_rank1

    subroutine create_host_storage_nopass_int32_rank1(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int32), dimension(:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int32_rank1

    function get_host_storage_int32_rank1(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int32), dimension(:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int32_rank1

    function get_from_array_int32_rank1(array) result(storage)
        integer(int32), dimension(:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int32_rank1

    subroutine create_host_storage_int32_rank2(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int32), dimension(:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int32_rank2

    subroutine create_host_storage_nopass_int32_rank2(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int32), dimension(:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int32_rank2

    function get_host_storage_int32_rank2(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int32), dimension(:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int32_rank2

    function get_from_array_int32_rank2(array) result(storage)
        integer(int32), dimension(:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int32_rank2

    subroutine create_host_storage_int32_rank3(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int32), dimension(:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int32_rank3

    subroutine create_host_storage_nopass_int32_rank3(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int32), dimension(:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int32_rank3

    function get_host_storage_int32_rank3(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int32), dimension(:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int32_rank3

    function get_from_array_int32_rank3(array) result(storage)
        integer(int32), dimension(:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int32_rank3

    subroutine create_host_storage_int32_rank4(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int32), dimension(:,:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int32_rank4

    subroutine create_host_storage_nopass_int32_rank4(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int32), dimension(:,:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int32_rank4

    function get_host_storage_int32_rank4(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int32), dimension(:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int32_rank4

    function get_from_array_int32_rank4(array) result(storage)
        integer(int32), dimension(:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int32_rank4

    subroutine create_host_storage_int32_rank5(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int32), dimension(:,:,:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int32_rank5

    subroutine create_host_storage_nopass_int32_rank5(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int32), dimension(:,:,:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int32_rank5

    function get_host_storage_int32_rank5(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int32), dimension(:,:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int32)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int32_rank5

    function get_from_array_int32_rank5(array) result(storage)
        integer(int32), dimension(:,:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int32_rank5

    subroutine create_host_storage_int16_rank0(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int16), target, intent(in) :: array

        integer(int64) :: number_of_bytes

        number_of_bytes = storage_size(1_int16)/8
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int16_rank0

    subroutine create_host_storage_nopass_int16_rank0(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int16), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int16_rank0

    function get_host_storage_int16_rank0(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int16), target, intent(in) :: array
        type(host_storage) :: storage

        integer(int64) :: number_of_bytes

        storage = host_storage()
        number_of_bytes = storage_size(1_int16)/8
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int16_rank0

    function get_from_array_int16_rank0(array) result(storage)
        integer(int16), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int16_rank0

    subroutine create_host_storage_int16_rank1(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int16), dimension(:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int16)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int16_rank1

    subroutine create_host_storage_nopass_int16_rank1(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int16), dimension(:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int16_rank1

    function get_host_storage_int16_rank1(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int16), dimension(:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int16)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int16_rank1

    function get_from_array_int16_rank1(array) result(storage)
        integer(int16), dimension(:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int16_rank1

    subroutine create_host_storage_int16_rank2(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int16), dimension(:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int16)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int16_rank2

    subroutine create_host_storage_nopass_int16_rank2(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int16), dimension(:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int16_rank2

    function get_host_storage_int16_rank2(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int16), dimension(:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int16)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int16_rank2

    function get_from_array_int16_rank2(array) result(storage)
        integer(int16), dimension(:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int16_rank2

    subroutine create_host_storage_int16_rank3(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int16), dimension(:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int16)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int16_rank3

    subroutine create_host_storage_nopass_int16_rank3(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int16), dimension(:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int16_rank3

    function get_host_storage_int16_rank3(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int16), dimension(:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int16)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int16_rank3

    function get_from_array_int16_rank3(array) result(storage)
        integer(int16), dimension(:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int16_rank3

    subroutine create_host_storage_int16_rank4(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int16), dimension(:,:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int16)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int16_rank4

    subroutine create_host_storage_nopass_int16_rank4(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int16), dimension(:,:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int16_rank4

    function get_host_storage_int16_rank4(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int16), dimension(:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int16)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int16_rank4

    function get_from_array_int16_rank4(array) result(storage)
        integer(int16), dimension(:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int16_rank4

    subroutine create_host_storage_int16_rank5(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int16), dimension(:,:,:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int16)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int16_rank5

    subroutine create_host_storage_nopass_int16_rank5(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int16), dimension(:,:,:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int16_rank5

    function get_host_storage_int16_rank5(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int16), dimension(:,:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int16)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int16_rank5

    function get_from_array_int16_rank5(array) result(storage)
        integer(int16), dimension(:,:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int16_rank5

    subroutine create_host_storage_int8_rank0(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int8), target, intent(in) :: array

        integer(int64) :: number_of_bytes

        number_of_bytes = storage_size(1_int8)/8
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int8_rank0

    subroutine create_host_storage_nopass_int8_rank0(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int8), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int8_rank0

    function get_host_storage_int8_rank0(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int8), target, intent(in) :: array
        type(host_storage) :: storage

        integer(int64) :: number_of_bytes

        storage = host_storage()
        number_of_bytes = storage_size(1_int8)/8
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int8_rank0

    function get_from_array_int8_rank0(array) result(storage)
        integer(int8), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int8_rank0

    subroutine create_host_storage_int8_rank1(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int8), dimension(:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int8)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int8_rank1

    subroutine create_host_storage_nopass_int8_rank1(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int8), dimension(:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int8_rank1

    function get_host_storage_int8_rank1(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int8), dimension(:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int8)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int8_rank1

    function get_from_array_int8_rank1(array) result(storage)
        integer(int8), dimension(:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int8_rank1

    subroutine create_host_storage_int8_rank2(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int8), dimension(:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int8)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int8_rank2

    subroutine create_host_storage_nopass_int8_rank2(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int8), dimension(:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int8_rank2

    function get_host_storage_int8_rank2(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int8), dimension(:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int8)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int8_rank2

    function get_from_array_int8_rank2(array) result(storage)
        integer(int8), dimension(:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int8_rank2

    subroutine create_host_storage_int8_rank3(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int8), dimension(:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int8)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int8_rank3

    subroutine create_host_storage_nopass_int8_rank3(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int8), dimension(:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int8_rank3

    function get_host_storage_int8_rank3(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int8), dimension(:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int8)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int8_rank3

    function get_from_array_int8_rank3(array) result(storage)
        integer(int8), dimension(:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int8_rank3

    subroutine create_host_storage_int8_rank4(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int8), dimension(:,:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int8)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int8_rank4

    subroutine create_host_storage_nopass_int8_rank4(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int8), dimension(:,:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int8_rank4

    function get_host_storage_int8_rank4(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int8), dimension(:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int8)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int8_rank4

    function get_from_array_int8_rank4(array) result(storage)
        integer(int8), dimension(:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int8_rank4

    subroutine create_host_storage_int8_rank5(this, storage, array)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int8), dimension(:,:,:,:,:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        bytes_pr_element = storage_size(1_int8)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call this%set_host_storage(storage, c_loc(array), number_of_bytes)
    end subroutine create_host_storage_int8_rank5

    subroutine create_host_storage_nopass_int8_rank5(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        integer(int8), dimension(:,:,:,:,:), target, intent(in) :: array

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%create_host_storage(storage, array)
        call converter%cleanup()
    end subroutine create_host_storage_nopass_int8_rank5

    function get_host_storage_int8_rank5(this, array) result(storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int8), dimension(:,:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_int8)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_int8_rank5

    function get_from_array_int8_rank5(array) result(storage)
        integer(int8), dimension(:,:,:,:,:), target, intent(in) :: array
        type(host_storage) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        storage = converter%get_host_storage(array)
        call converter%cleanup()
    end function get_from_array_int8_rank5

    subroutine secure_fortran_pointer_complex128_rank0(this, ptr, storage)
        class(fortran_host_converter), intent(in) :: this
        complex(real64), pointer, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        if ( bytes_pr_element /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex128_rank0::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr)
    end subroutine secure_fortran_pointer_complex128_rank0

    subroutine sfp_from_host_complex128_rank0(ptr, storage)
        complex(real64), pointer, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage)
        call converter%cleanup()
    end subroutine sfp_from_host_complex128_rank0

    subroutine secure_fortran_pointer_complex128_rank1_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex128_rank1_from_integer::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[product(dims)])
    end subroutine secure_fortran_pointer_complex128_rank1_from_integer

    subroutine sfp_from_host_complex128_rank1_from_integer(ptr, storage, dims)
        complex(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex128_rank1_from_integer

    subroutine secure_fortran_pointer_complex128_rank1_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex128_rank1_from_int64::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[product(dims)])
    end subroutine secure_fortran_pointer_complex128_rank1_from_int64

    subroutine sfp_from_host_complex128_rank1_from_int64(ptr, storage, dims)
        complex(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex128_rank1_from_int64

    subroutine secure_fortran_pointer_complex128_rank2_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex128_rank2_from_integer::Dimension mismatch."
        if ( size(dims) /= 2 ) &
                error stop "secure_fortran_pointer_complex128_rank2_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_complex128_rank2_from_integer

    subroutine sfp_from_host_complex128_rank2_from_integer(ptr, storage, dims)
        complex(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex128_rank2_from_integer

    subroutine secure_fortran_pointer_complex128_rank2_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex128_rank2_from_int64::Dimension mismatch."
        if ( size(dims) /= 2 ) &
                error stop "secure_fortran_pointer_complex128_rank2_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_complex128_rank2_from_int64

    subroutine sfp_from_host_complex128_rank2_from_int64(ptr, storage, dims)
        complex(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex128_rank2_from_int64

    subroutine secure_fortran_pointer_complex128_rank3_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex128_rank3_from_integer::Dimension mismatch."
        if ( size(dims) /= 3 ) &
                error stop "secure_fortran_pointer_complex128_rank3_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_complex128_rank3_from_integer

    subroutine sfp_from_host_complex128_rank3_from_integer(ptr, storage, dims)
        complex(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex128_rank3_from_integer

    subroutine secure_fortran_pointer_complex128_rank3_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex128_rank3_from_int64::Dimension mismatch."
        if ( size(dims) /= 3 ) &
                error stop "secure_fortran_pointer_complex128_rank3_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_complex128_rank3_from_int64

    subroutine sfp_from_host_complex128_rank3_from_int64(ptr, storage, dims)
        complex(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex128_rank3_from_int64

    subroutine secure_fortran_pointer_complex128_rank4_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex128_rank4_from_integer::Dimension mismatch."
        if ( size(dims) /= 4 ) &
                error stop "secure_fortran_pointer_complex128_rank4_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_complex128_rank4_from_integer

    subroutine sfp_from_host_complex128_rank4_from_integer(ptr, storage, dims)
        complex(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex128_rank4_from_integer

    subroutine secure_fortran_pointer_complex128_rank4_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex128_rank4_from_int64::Dimension mismatch."
        if ( size(dims) /= 4 ) &
                error stop "secure_fortran_pointer_complex128_rank4_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_complex128_rank4_from_int64

    subroutine sfp_from_host_complex128_rank4_from_int64(ptr, storage, dims)
        complex(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex128_rank4_from_int64

    subroutine secure_fortran_pointer_complex128_rank5_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex128_rank5_from_integer::Dimension mismatch."
        if ( size(dims) /= 5 ) &
                error stop "secure_fortran_pointer_complex128_rank5_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_complex128_rank5_from_integer

    subroutine sfp_from_host_complex128_rank5_from_integer(ptr, storage, dims)
        complex(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex128_rank5_from_integer

    subroutine secure_fortran_pointer_complex128_rank5_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real64, 1.0_real64))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex128_rank5_from_int64::Dimension mismatch."
        if ( size(dims) /= 5 ) &
                error stop "secure_fortran_pointer_complex128_rank5_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_complex128_rank5_from_int64

    subroutine sfp_from_host_complex128_rank5_from_int64(ptr, storage, dims)
        complex(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex128_rank5_from_int64

    subroutine secure_fortran_pointer_complex64_rank0(this, ptr, storage)
        class(fortran_host_converter), intent(in) :: this
        complex(real32), pointer, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        if ( bytes_pr_element /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex64_rank0::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr)
    end subroutine secure_fortran_pointer_complex64_rank0

    subroutine sfp_from_host_complex64_rank0(ptr, storage)
        complex(real32), pointer, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage)
        call converter%cleanup()
    end subroutine sfp_from_host_complex64_rank0

    subroutine secure_fortran_pointer_complex64_rank1_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex64_rank1_from_integer::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[product(dims)])
    end subroutine secure_fortran_pointer_complex64_rank1_from_integer

    subroutine sfp_from_host_complex64_rank1_from_integer(ptr, storage, dims)
        complex(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex64_rank1_from_integer

    subroutine secure_fortran_pointer_complex64_rank1_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex64_rank1_from_int64::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[product(dims)])
    end subroutine secure_fortran_pointer_complex64_rank1_from_int64

    subroutine sfp_from_host_complex64_rank1_from_int64(ptr, storage, dims)
        complex(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex64_rank1_from_int64

    subroutine secure_fortran_pointer_complex64_rank2_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex64_rank2_from_integer::Dimension mismatch."
        if ( size(dims) /= 2 ) &
                error stop "secure_fortran_pointer_complex64_rank2_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_complex64_rank2_from_integer

    subroutine sfp_from_host_complex64_rank2_from_integer(ptr, storage, dims)
        complex(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex64_rank2_from_integer

    subroutine secure_fortran_pointer_complex64_rank2_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex64_rank2_from_int64::Dimension mismatch."
        if ( size(dims) /= 2 ) &
                error stop "secure_fortran_pointer_complex64_rank2_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_complex64_rank2_from_int64

    subroutine sfp_from_host_complex64_rank2_from_int64(ptr, storage, dims)
        complex(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex64_rank2_from_int64

    subroutine secure_fortran_pointer_complex64_rank3_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex64_rank3_from_integer::Dimension mismatch."
        if ( size(dims) /= 3 ) &
                error stop "secure_fortran_pointer_complex64_rank3_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_complex64_rank3_from_integer

    subroutine sfp_from_host_complex64_rank3_from_integer(ptr, storage, dims)
        complex(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex64_rank3_from_integer

    subroutine secure_fortran_pointer_complex64_rank3_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex64_rank3_from_int64::Dimension mismatch."
        if ( size(dims) /= 3 ) &
                error stop "secure_fortran_pointer_complex64_rank3_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_complex64_rank3_from_int64

    subroutine sfp_from_host_complex64_rank3_from_int64(ptr, storage, dims)
        complex(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex64_rank3_from_int64

    subroutine secure_fortran_pointer_complex64_rank4_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex64_rank4_from_integer::Dimension mismatch."
        if ( size(dims) /= 4 ) &
                error stop "secure_fortran_pointer_complex64_rank4_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_complex64_rank4_from_integer

    subroutine sfp_from_host_complex64_rank4_from_integer(ptr, storage, dims)
        complex(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex64_rank4_from_integer

    subroutine secure_fortran_pointer_complex64_rank4_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex64_rank4_from_int64::Dimension mismatch."
        if ( size(dims) /= 4 ) &
                error stop "secure_fortran_pointer_complex64_rank4_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_complex64_rank4_from_int64

    subroutine sfp_from_host_complex64_rank4_from_int64(ptr, storage, dims)
        complex(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex64_rank4_from_int64

    subroutine secure_fortran_pointer_complex64_rank5_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex64_rank5_from_integer::Dimension mismatch."
        if ( size(dims) /= 5 ) &
                error stop "secure_fortran_pointer_complex64_rank5_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_complex64_rank5_from_integer

    subroutine sfp_from_host_complex64_rank5_from_integer(ptr, storage, dims)
        complex(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex64_rank5_from_integer

    subroutine secure_fortran_pointer_complex64_rank5_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        complex(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size((1.0_real32, 1.0_real32))/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_complex64_rank5_from_int64::Dimension mismatch."
        if ( size(dims) /= 5 ) &
                error stop "secure_fortran_pointer_complex64_rank5_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_complex64_rank5_from_int64

    subroutine sfp_from_host_complex64_rank5_from_int64(ptr, storage, dims)
        complex(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_complex64_rank5_from_int64

    subroutine secure_fortran_pointer_real64_rank0(this, ptr, storage)
        class(fortran_host_converter), intent(in) :: this
        real(real64), pointer, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real64)/8
        if ( bytes_pr_element /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real64_rank0::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr)
    end subroutine secure_fortran_pointer_real64_rank0

    subroutine sfp_from_host_real64_rank0(ptr, storage)
        real(real64), pointer, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage)
        call converter%cleanup()
    end subroutine sfp_from_host_real64_rank0

    subroutine secure_fortran_pointer_real64_rank1_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real64_rank1_from_integer::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[product(dims)])
    end subroutine secure_fortran_pointer_real64_rank1_from_integer

    subroutine sfp_from_host_real64_rank1_from_integer(ptr, storage, dims)
        real(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real64_rank1_from_integer

    subroutine secure_fortran_pointer_real64_rank1_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real64_rank1_from_int64::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[product(dims)])
    end subroutine secure_fortran_pointer_real64_rank1_from_int64

    subroutine sfp_from_host_real64_rank1_from_int64(ptr, storage, dims)
        real(real64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real64_rank1_from_int64

    subroutine secure_fortran_pointer_real64_rank2_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real64_rank2_from_integer::Dimension mismatch."
        if ( size(dims) /= 2 ) &
                error stop "secure_fortran_pointer_real64_rank2_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_real64_rank2_from_integer

    subroutine sfp_from_host_real64_rank2_from_integer(ptr, storage, dims)
        real(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real64_rank2_from_integer

    subroutine secure_fortran_pointer_real64_rank2_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real64_rank2_from_int64::Dimension mismatch."
        if ( size(dims) /= 2 ) &
                error stop "secure_fortran_pointer_real64_rank2_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_real64_rank2_from_int64

    subroutine sfp_from_host_real64_rank2_from_int64(ptr, storage, dims)
        real(real64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real64_rank2_from_int64

    subroutine secure_fortran_pointer_real64_rank3_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real64_rank3_from_integer::Dimension mismatch."
        if ( size(dims) /= 3 ) &
                error stop "secure_fortran_pointer_real64_rank3_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_real64_rank3_from_integer

    subroutine sfp_from_host_real64_rank3_from_integer(ptr, storage, dims)
        real(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real64_rank3_from_integer

    subroutine secure_fortran_pointer_real64_rank3_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real64_rank3_from_int64::Dimension mismatch."
        if ( size(dims) /= 3 ) &
                error stop "secure_fortran_pointer_real64_rank3_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_real64_rank3_from_int64

    subroutine sfp_from_host_real64_rank3_from_int64(ptr, storage, dims)
        real(real64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real64_rank3_from_int64

    subroutine secure_fortran_pointer_real64_rank4_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real64_rank4_from_integer::Dimension mismatch."
        if ( size(dims) /= 4 ) &
                error stop "secure_fortran_pointer_real64_rank4_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_real64_rank4_from_integer

    subroutine sfp_from_host_real64_rank4_from_integer(ptr, storage, dims)
        real(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real64_rank4_from_integer

    subroutine secure_fortran_pointer_real64_rank4_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real64_rank4_from_int64::Dimension mismatch."
        if ( size(dims) /= 4 ) &
                error stop "secure_fortran_pointer_real64_rank4_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_real64_rank4_from_int64

    subroutine sfp_from_host_real64_rank4_from_int64(ptr, storage, dims)
        real(real64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real64_rank4_from_int64

    subroutine secure_fortran_pointer_real64_rank5_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real64_rank5_from_integer::Dimension mismatch."
        if ( size(dims) /= 5 ) &
                error stop "secure_fortran_pointer_real64_rank5_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_real64_rank5_from_integer

    subroutine sfp_from_host_real64_rank5_from_integer(ptr, storage, dims)
        real(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real64_rank5_from_integer

    subroutine secure_fortran_pointer_real64_rank5_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real64_rank5_from_int64::Dimension mismatch."
        if ( size(dims) /= 5 ) &
                error stop "secure_fortran_pointer_real64_rank5_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_real64_rank5_from_int64

    subroutine sfp_from_host_real64_rank5_from_int64(ptr, storage, dims)
        real(real64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real64_rank5_from_int64

    subroutine secure_fortran_pointer_real32_rank0(this, ptr, storage)
        class(fortran_host_converter), intent(in) :: this
        real(real32), pointer, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real32)/8
        if ( bytes_pr_element /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real32_rank0::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr)
    end subroutine secure_fortran_pointer_real32_rank0

    subroutine sfp_from_host_real32_rank0(ptr, storage)
        real(real32), pointer, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage)
        call converter%cleanup()
    end subroutine sfp_from_host_real32_rank0

    subroutine secure_fortran_pointer_real32_rank1_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real32_rank1_from_integer::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[product(dims)])
    end subroutine secure_fortran_pointer_real32_rank1_from_integer

    subroutine sfp_from_host_real32_rank1_from_integer(ptr, storage, dims)
        real(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real32_rank1_from_integer

    subroutine secure_fortran_pointer_real32_rank1_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real32_rank1_from_int64::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[product(dims)])
    end subroutine secure_fortran_pointer_real32_rank1_from_int64

    subroutine sfp_from_host_real32_rank1_from_int64(ptr, storage, dims)
        real(real32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real32_rank1_from_int64

    subroutine secure_fortran_pointer_real32_rank2_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real32_rank2_from_integer::Dimension mismatch."
        if ( size(dims) /= 2 ) &
                error stop "secure_fortran_pointer_real32_rank2_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_real32_rank2_from_integer

    subroutine sfp_from_host_real32_rank2_from_integer(ptr, storage, dims)
        real(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real32_rank2_from_integer

    subroutine secure_fortran_pointer_real32_rank2_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real32_rank2_from_int64::Dimension mismatch."
        if ( size(dims) /= 2 ) &
                error stop "secure_fortran_pointer_real32_rank2_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_real32_rank2_from_int64

    subroutine sfp_from_host_real32_rank2_from_int64(ptr, storage, dims)
        real(real32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real32_rank2_from_int64

    subroutine secure_fortran_pointer_real32_rank3_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real32_rank3_from_integer::Dimension mismatch."
        if ( size(dims) /= 3 ) &
                error stop "secure_fortran_pointer_real32_rank3_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_real32_rank3_from_integer

    subroutine sfp_from_host_real32_rank3_from_integer(ptr, storage, dims)
        real(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real32_rank3_from_integer

    subroutine secure_fortran_pointer_real32_rank3_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real32_rank3_from_int64::Dimension mismatch."
        if ( size(dims) /= 3 ) &
                error stop "secure_fortran_pointer_real32_rank3_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_real32_rank3_from_int64

    subroutine sfp_from_host_real32_rank3_from_int64(ptr, storage, dims)
        real(real32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real32_rank3_from_int64

    subroutine secure_fortran_pointer_real32_rank4_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real32_rank4_from_integer::Dimension mismatch."
        if ( size(dims) /= 4 ) &
                error stop "secure_fortran_pointer_real32_rank4_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_real32_rank4_from_integer

    subroutine sfp_from_host_real32_rank4_from_integer(ptr, storage, dims)
        real(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real32_rank4_from_integer

    subroutine secure_fortran_pointer_real32_rank4_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real32_rank4_from_int64::Dimension mismatch."
        if ( size(dims) /= 4 ) &
                error stop "secure_fortran_pointer_real32_rank4_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_real32_rank4_from_int64

    subroutine sfp_from_host_real32_rank4_from_int64(ptr, storage, dims)
        real(real32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real32_rank4_from_int64

    subroutine secure_fortran_pointer_real32_rank5_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real32_rank5_from_integer::Dimension mismatch."
        if ( size(dims) /= 5 ) &
                error stop "secure_fortran_pointer_real32_rank5_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_real32_rank5_from_integer

    subroutine sfp_from_host_real32_rank5_from_integer(ptr, storage, dims)
        real(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real32_rank5_from_integer

    subroutine secure_fortran_pointer_real32_rank5_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        real(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1.0_real32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_real32_rank5_from_int64::Dimension mismatch."
        if ( size(dims) /= 5 ) &
                error stop "secure_fortran_pointer_real32_rank5_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_real32_rank5_from_int64

    subroutine sfp_from_host_real32_rank5_from_int64(ptr, storage, dims)
        real(real32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_real32_rank5_from_int64

    subroutine secure_fortran_pointer_int64_rank0(this, ptr, storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int64), pointer, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int64)/8
        if ( bytes_pr_element /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int64_rank0::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr)
    end subroutine secure_fortran_pointer_int64_rank0

    subroutine sfp_from_host_int64_rank0(ptr, storage)
        integer(int64), pointer, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage)
        call converter%cleanup()
    end subroutine sfp_from_host_int64_rank0

    subroutine secure_fortran_pointer_int64_rank1_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int64_rank1_from_integer::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[product(dims)])
    end subroutine secure_fortran_pointer_int64_rank1_from_integer

    subroutine sfp_from_host_int64_rank1_from_integer(ptr, storage, dims)
        integer(int64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int64_rank1_from_integer

    subroutine secure_fortran_pointer_int64_rank1_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int64_rank1_from_int64::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[product(dims)])
    end subroutine secure_fortran_pointer_int64_rank1_from_int64

    subroutine sfp_from_host_int64_rank1_from_int64(ptr, storage, dims)
        integer(int64), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int64_rank1_from_int64

    subroutine secure_fortran_pointer_int64_rank2_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int64_rank2_from_integer::Dimension mismatch."
        if ( size(dims) /= 2 ) &
                error stop "secure_fortran_pointer_int64_rank2_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int64_rank2_from_integer

    subroutine sfp_from_host_int64_rank2_from_integer(ptr, storage, dims)
        integer(int64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int64_rank2_from_integer

    subroutine secure_fortran_pointer_int64_rank2_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int64_rank2_from_int64::Dimension mismatch."
        if ( size(dims) /= 2 ) &
                error stop "secure_fortran_pointer_int64_rank2_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int64_rank2_from_int64

    subroutine sfp_from_host_int64_rank2_from_int64(ptr, storage, dims)
        integer(int64), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int64_rank2_from_int64

    subroutine secure_fortran_pointer_int64_rank3_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int64_rank3_from_integer::Dimension mismatch."
        if ( size(dims) /= 3 ) &
                error stop "secure_fortran_pointer_int64_rank3_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int64_rank3_from_integer

    subroutine sfp_from_host_int64_rank3_from_integer(ptr, storage, dims)
        integer(int64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int64_rank3_from_integer

    subroutine secure_fortran_pointer_int64_rank3_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int64_rank3_from_int64::Dimension mismatch."
        if ( size(dims) /= 3 ) &
                error stop "secure_fortran_pointer_int64_rank3_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int64_rank3_from_int64

    subroutine sfp_from_host_int64_rank3_from_int64(ptr, storage, dims)
        integer(int64), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int64_rank3_from_int64

    subroutine secure_fortran_pointer_int64_rank4_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int64_rank4_from_integer::Dimension mismatch."
        if ( size(dims) /= 4 ) &
                error stop "secure_fortran_pointer_int64_rank4_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int64_rank4_from_integer

    subroutine sfp_from_host_int64_rank4_from_integer(ptr, storage, dims)
        integer(int64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int64_rank4_from_integer

    subroutine secure_fortran_pointer_int64_rank4_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int64_rank4_from_int64::Dimension mismatch."
        if ( size(dims) /= 4 ) &
                error stop "secure_fortran_pointer_int64_rank4_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int64_rank4_from_int64

    subroutine sfp_from_host_int64_rank4_from_int64(ptr, storage, dims)
        integer(int64), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int64_rank4_from_int64

    subroutine secure_fortran_pointer_int64_rank5_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int64_rank5_from_integer::Dimension mismatch."
        if ( size(dims) /= 5 ) &
                error stop "secure_fortran_pointer_int64_rank5_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int64_rank5_from_integer

    subroutine sfp_from_host_int64_rank5_from_integer(ptr, storage, dims)
        integer(int64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int64_rank5_from_integer

    subroutine secure_fortran_pointer_int64_rank5_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int64)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int64_rank5_from_int64::Dimension mismatch."
        if ( size(dims) /= 5 ) &
                error stop "secure_fortran_pointer_int64_rank5_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int64_rank5_from_int64

    subroutine sfp_from_host_int64_rank5_from_int64(ptr, storage, dims)
        integer(int64), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int64_rank5_from_int64

    subroutine secure_fortran_pointer_int32_rank0(this, ptr, storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int32), pointer, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int32)/8
        if ( bytes_pr_element /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int32_rank0::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr)
    end subroutine secure_fortran_pointer_int32_rank0

    subroutine sfp_from_host_int32_rank0(ptr, storage)
        integer(int32), pointer, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage)
        call converter%cleanup()
    end subroutine sfp_from_host_int32_rank0

    subroutine secure_fortran_pointer_int32_rank1_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int32_rank1_from_integer::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[product(dims)])
    end subroutine secure_fortran_pointer_int32_rank1_from_integer

    subroutine sfp_from_host_int32_rank1_from_integer(ptr, storage, dims)
        integer(int32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int32_rank1_from_integer

    subroutine secure_fortran_pointer_int32_rank1_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int32_rank1_from_int64::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[product(dims)])
    end subroutine secure_fortran_pointer_int32_rank1_from_int64

    subroutine sfp_from_host_int32_rank1_from_int64(ptr, storage, dims)
        integer(int32), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int32_rank1_from_int64

    subroutine secure_fortran_pointer_int32_rank2_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int32_rank2_from_integer::Dimension mismatch."
        if ( size(dims) /= 2 ) &
                error stop "secure_fortran_pointer_int32_rank2_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int32_rank2_from_integer

    subroutine sfp_from_host_int32_rank2_from_integer(ptr, storage, dims)
        integer(int32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int32_rank2_from_integer

    subroutine secure_fortran_pointer_int32_rank2_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int32_rank2_from_int64::Dimension mismatch."
        if ( size(dims) /= 2 ) &
                error stop "secure_fortran_pointer_int32_rank2_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int32_rank2_from_int64

    subroutine sfp_from_host_int32_rank2_from_int64(ptr, storage, dims)
        integer(int32), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int32_rank2_from_int64

    subroutine secure_fortran_pointer_int32_rank3_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int32_rank3_from_integer::Dimension mismatch."
        if ( size(dims) /= 3 ) &
                error stop "secure_fortran_pointer_int32_rank3_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int32_rank3_from_integer

    subroutine sfp_from_host_int32_rank3_from_integer(ptr, storage, dims)
        integer(int32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int32_rank3_from_integer

    subroutine secure_fortran_pointer_int32_rank3_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int32_rank3_from_int64::Dimension mismatch."
        if ( size(dims) /= 3 ) &
                error stop "secure_fortran_pointer_int32_rank3_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int32_rank3_from_int64

    subroutine sfp_from_host_int32_rank3_from_int64(ptr, storage, dims)
        integer(int32), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int32_rank3_from_int64

    subroutine secure_fortran_pointer_int32_rank4_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int32_rank4_from_integer::Dimension mismatch."
        if ( size(dims) /= 4 ) &
                error stop "secure_fortran_pointer_int32_rank4_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int32_rank4_from_integer

    subroutine sfp_from_host_int32_rank4_from_integer(ptr, storage, dims)
        integer(int32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int32_rank4_from_integer

    subroutine secure_fortran_pointer_int32_rank4_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int32_rank4_from_int64::Dimension mismatch."
        if ( size(dims) /= 4 ) &
                error stop "secure_fortran_pointer_int32_rank4_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int32_rank4_from_int64

    subroutine sfp_from_host_int32_rank4_from_int64(ptr, storage, dims)
        integer(int32), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int32_rank4_from_int64

    subroutine secure_fortran_pointer_int32_rank5_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int32_rank5_from_integer::Dimension mismatch."
        if ( size(dims) /= 5 ) &
                error stop "secure_fortran_pointer_int32_rank5_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int32_rank5_from_integer

    subroutine sfp_from_host_int32_rank5_from_integer(ptr, storage, dims)
        integer(int32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int32_rank5_from_integer

    subroutine secure_fortran_pointer_int32_rank5_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int32)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int32_rank5_from_int64::Dimension mismatch."
        if ( size(dims) /= 5 ) &
                error stop "secure_fortran_pointer_int32_rank5_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int32_rank5_from_int64

    subroutine sfp_from_host_int32_rank5_from_int64(ptr, storage, dims)
        integer(int32), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int32_rank5_from_int64

    subroutine secure_fortran_pointer_int16_rank0(this, ptr, storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int16), pointer, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int16)/8
        if ( bytes_pr_element /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int16_rank0::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr)
    end subroutine secure_fortran_pointer_int16_rank0

    subroutine sfp_from_host_int16_rank0(ptr, storage)
        integer(int16), pointer, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage)
        call converter%cleanup()
    end subroutine sfp_from_host_int16_rank0

    subroutine secure_fortran_pointer_int16_rank1_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int16), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int16)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int16_rank1_from_integer::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[product(dims)])
    end subroutine secure_fortran_pointer_int16_rank1_from_integer

    subroutine sfp_from_host_int16_rank1_from_integer(ptr, storage, dims)
        integer(int16), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int16_rank1_from_integer

    subroutine secure_fortran_pointer_int16_rank1_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int16), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int16)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int16_rank1_from_int64::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[product(dims)])
    end subroutine secure_fortran_pointer_int16_rank1_from_int64

    subroutine sfp_from_host_int16_rank1_from_int64(ptr, storage, dims)
        integer(int16), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int16_rank1_from_int64

    subroutine secure_fortran_pointer_int16_rank2_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int16), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int16)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int16_rank2_from_integer::Dimension mismatch."
        if ( size(dims) /= 2 ) &
                error stop "secure_fortran_pointer_int16_rank2_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int16_rank2_from_integer

    subroutine sfp_from_host_int16_rank2_from_integer(ptr, storage, dims)
        integer(int16), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int16_rank2_from_integer

    subroutine secure_fortran_pointer_int16_rank2_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int16), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int16)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int16_rank2_from_int64::Dimension mismatch."
        if ( size(dims) /= 2 ) &
                error stop "secure_fortran_pointer_int16_rank2_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int16_rank2_from_int64

    subroutine sfp_from_host_int16_rank2_from_int64(ptr, storage, dims)
        integer(int16), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int16_rank2_from_int64

    subroutine secure_fortran_pointer_int16_rank3_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int16), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int16)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int16_rank3_from_integer::Dimension mismatch."
        if ( size(dims) /= 3 ) &
                error stop "secure_fortran_pointer_int16_rank3_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int16_rank3_from_integer

    subroutine sfp_from_host_int16_rank3_from_integer(ptr, storage, dims)
        integer(int16), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int16_rank3_from_integer

    subroutine secure_fortran_pointer_int16_rank3_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int16), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int16)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int16_rank3_from_int64::Dimension mismatch."
        if ( size(dims) /= 3 ) &
                error stop "secure_fortran_pointer_int16_rank3_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int16_rank3_from_int64

    subroutine sfp_from_host_int16_rank3_from_int64(ptr, storage, dims)
        integer(int16), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int16_rank3_from_int64

    subroutine secure_fortran_pointer_int16_rank4_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int16), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int16)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int16_rank4_from_integer::Dimension mismatch."
        if ( size(dims) /= 4 ) &
                error stop "secure_fortran_pointer_int16_rank4_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int16_rank4_from_integer

    subroutine sfp_from_host_int16_rank4_from_integer(ptr, storage, dims)
        integer(int16), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int16_rank4_from_integer

    subroutine secure_fortran_pointer_int16_rank4_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int16), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int16)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int16_rank4_from_int64::Dimension mismatch."
        if ( size(dims) /= 4 ) &
                error stop "secure_fortran_pointer_int16_rank4_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int16_rank4_from_int64

    subroutine sfp_from_host_int16_rank4_from_int64(ptr, storage, dims)
        integer(int16), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int16_rank4_from_int64

    subroutine secure_fortran_pointer_int16_rank5_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int16), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int16)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int16_rank5_from_integer::Dimension mismatch."
        if ( size(dims) /= 5 ) &
                error stop "secure_fortran_pointer_int16_rank5_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int16_rank5_from_integer

    subroutine sfp_from_host_int16_rank5_from_integer(ptr, storage, dims)
        integer(int16), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int16_rank5_from_integer

    subroutine secure_fortran_pointer_int16_rank5_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int16), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int16)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int16_rank5_from_int64::Dimension mismatch."
        if ( size(dims) /= 5 ) &
                error stop "secure_fortran_pointer_int16_rank5_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int16_rank5_from_int64

    subroutine sfp_from_host_int16_rank5_from_int64(ptr, storage, dims)
        integer(int16), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int16_rank5_from_int64

    subroutine secure_fortran_pointer_int8_rank0(this, ptr, storage)
        class(fortran_host_converter), intent(in) :: this
        integer(int8), pointer, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int8)/8
        if ( bytes_pr_element /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int8_rank0::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr)
    end subroutine secure_fortran_pointer_int8_rank0

    subroutine sfp_from_host_int8_rank0(ptr, storage)
        integer(int8), pointer, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage)
        call converter%cleanup()
    end subroutine sfp_from_host_int8_rank0

    subroutine secure_fortran_pointer_int8_rank1_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int8), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int8)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int8_rank1_from_integer::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[product(dims)])
    end subroutine secure_fortran_pointer_int8_rank1_from_integer

    subroutine sfp_from_host_int8_rank1_from_integer(ptr, storage, dims)
        integer(int8), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int8_rank1_from_integer

    subroutine secure_fortran_pointer_int8_rank1_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int8), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int8)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int8_rank1_from_int64::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[product(dims)])
    end subroutine secure_fortran_pointer_int8_rank1_from_int64

    subroutine sfp_from_host_int8_rank1_from_int64(ptr, storage, dims)
        integer(int8), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int8_rank1_from_int64

    subroutine secure_fortran_pointer_int8_rank2_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int8), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int8)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int8_rank2_from_integer::Dimension mismatch."
        if ( size(dims) /= 2 ) &
                error stop "secure_fortran_pointer_int8_rank2_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int8_rank2_from_integer

    subroutine sfp_from_host_int8_rank2_from_integer(ptr, storage, dims)
        integer(int8), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int8_rank2_from_integer

    subroutine secure_fortran_pointer_int8_rank2_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int8), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int8)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int8_rank2_from_int64::Dimension mismatch."
        if ( size(dims) /= 2 ) &
                error stop "secure_fortran_pointer_int8_rank2_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int8_rank2_from_int64

    subroutine sfp_from_host_int8_rank2_from_int64(ptr, storage, dims)
        integer(int8), dimension(:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int8_rank2_from_int64

    subroutine secure_fortran_pointer_int8_rank3_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int8), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int8)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int8_rank3_from_integer::Dimension mismatch."
        if ( size(dims) /= 3 ) &
                error stop "secure_fortran_pointer_int8_rank3_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int8_rank3_from_integer

    subroutine sfp_from_host_int8_rank3_from_integer(ptr, storage, dims)
        integer(int8), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int8_rank3_from_integer

    subroutine secure_fortran_pointer_int8_rank3_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int8), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int8)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int8_rank3_from_int64::Dimension mismatch."
        if ( size(dims) /= 3 ) &
                error stop "secure_fortran_pointer_int8_rank3_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int8_rank3_from_int64

    subroutine sfp_from_host_int8_rank3_from_int64(ptr, storage, dims)
        integer(int8), dimension(:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int8_rank3_from_int64

    subroutine secure_fortran_pointer_int8_rank4_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int8), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int8)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int8_rank4_from_integer::Dimension mismatch."
        if ( size(dims) /= 4 ) &
                error stop "secure_fortran_pointer_int8_rank4_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int8_rank4_from_integer

    subroutine sfp_from_host_int8_rank4_from_integer(ptr, storage, dims)
        integer(int8), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int8_rank4_from_integer

    subroutine secure_fortran_pointer_int8_rank4_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int8), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int8)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int8_rank4_from_int64::Dimension mismatch."
        if ( size(dims) /= 4 ) &
                error stop "secure_fortran_pointer_int8_rank4_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int8_rank4_from_int64

    subroutine sfp_from_host_int8_rank4_from_int64(ptr, storage, dims)
        integer(int8), dimension(:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int8_rank4_from_int64

    subroutine secure_fortran_pointer_int8_rank5_from_integer(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int8), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int8)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int8_rank5_from_integer::Dimension mismatch."
        if ( size(dims) /= 5 ) &
                error stop "secure_fortran_pointer_int8_rank5_from_integer::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int8_rank5_from_integer

    subroutine sfp_from_host_int8_rank5_from_integer(ptr, storage, dims)
        integer(int8), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer, dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int8_rank5_from_integer

    subroutine secure_fortran_pointer_int8_rank5_from_int64(this, ptr, storage, dims)
        class(fortran_host_converter), intent(in) :: this
        integer(int8), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_int8)/8
        if ( bytes_pr_element*product(dims) /= storage%number_of_bytes ) &
                error stop "secure_fortran_pointer_int8_rank5_from_int64::Dimension mismatch."
        if ( size(dims) /= 5 ) &
                error stop "secure_fortran_pointer_int8_rank5_from_int64::Rank mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=dims)
    end subroutine secure_fortran_pointer_int8_rank5_from_int64

    subroutine sfp_from_host_int8_rank5_from_int64(ptr, storage, dims)
        integer(int8), dimension(:,:,:,:,:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), dimension(:), intent(in) :: dims

        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        call converter%secure_fortran_pointer(ptr, storage, dims)
        call converter%cleanup()
    end subroutine sfp_from_host_int8_rank5_from_int64

    function get_host_storage_from_c_ptr_array(array) result(storage)
        type(c_ptr), dimension(:), target, intent(in) :: array
        type(host_storage) :: storage

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes

        storage = host_storage()
        bytes_pr_element = storage_size(1_c_intptr_t)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call storage%set_data_pointer(c_loc(array), number_of_bytes)
    end function get_host_storage_from_c_ptr_array

    subroutine secure_c_ptr_array_from_host(ptr, storage, array_size)
        type(c_ptr), dimension(:), pointer, contiguous, intent(inout) :: ptr
        class(host_storage), intent(in) :: storage
        integer(int64), intent(in) :: array_size

        integer :: bytes_pr_element

        bytes_pr_element = storage_size(1_c_intptr_t)/8
        if ( bytes_pr_element*array_size /= storage%number_of_bytes ) &
            error stop "secure_c_ptr_array_from_host::Dimension mismatch."

        call c_f_pointer(storage%get_data_pointer(), ptr, shape=[array_size])
    end subroutine secure_c_ptr_array_from_host

    subroutine create_host_storage_from_c_ptr_array(storage, array)
        class(host_storage), allocatable, intent(inout) :: storage
        type(c_ptr), dimension(:), target, intent(in) :: array

        integer :: bytes_pr_element
        integer(int64) :: number_of_bytes
        type(fortran_host_converter) :: converter

        converter = fortran_host_converter()
        bytes_pr_element = storage_size(1_c_intptr_t)/8
        number_of_bytes = size(array, kind=int64)*bytes_pr_element
        call converter%set_host_storage(storage, c_loc(array), number_of_bytes)
        call converter%cleanup()
    end subroutine create_host_storage_from_c_ptr_array

    subroutine allocate_host_storage(this, storage)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage

        call this%builder%allocate_host_storage(storage)
    end subroutine allocate_host_storage

    subroutine set_host_storage(this, storage, ptr, number_of_bytes)
        class(fortran_host_converter), intent(in) :: this
        class(host_storage), allocatable, intent(inout) :: storage
        type(c_ptr), intent(in) :: ptr
        integer(int64), intent(in) :: number_of_bytes

        call this%allocate_host_storage(storage)
        call storage%set_data_pointer(ptr, number_of_bytes)
    end subroutine set_host_storage

    subroutine cleanup(this)
        class(fortran_host_converter), intent(inout) :: this

        if(allocated(this%builder)) deallocate(this%builder)
    end subroutine cleanup
end module fortran_host_converter_module
