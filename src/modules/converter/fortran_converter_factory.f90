module fortran_converter_factory_module
    use :: util_api, only : string
    use :: memory_api, only : &
            memory_factory, &
            data_builder

    use :: host_memory_plugin, only : host_builder

    use :: fortran_data_converter_module, only : fortran_data_converter
    use :: fortran_host_converter_module, only : fortran_host_converter

    implicit none
    private

    public :: fortran_converter_factory

    type :: fortran_converter_factory
    contains
        generic :: get_data_converter => &
                get_data_converter_from_string, &
                get_data_converter_from_chars
        generic :: build_data_converter => &
                build_data_converter_from_string, &
                build_data_converter_from_chars
        generic :: get_host_converter => &
                get_host_converter_from_string, &
                get_host_converter_from_chars
        generic :: build_host_converter => &
                build_host_converter_from_string, &
                build_host_converter_from_chars
        procedure :: get_data_converter_from_string => get_data_converter_from_string
        procedure :: get_data_converter_from_chars => get_data_converter_from_chars
        procedure :: build_data_converter_from_string => build_data_converter_from_string
        procedure :: build_data_converter_from_chars => build_data_converter_from_chars
        procedure :: get_host_converter_from_string => get_host_converter_from_string
        procedure :: get_host_converter_from_chars => get_host_converter_from_chars
        procedure :: build_host_converter_from_string => build_host_converter_from_string
        procedure :: build_host_converter_from_chars => build_host_converter_from_chars
    end type fortran_converter_factory
contains
    subroutine build_data_converter_from_string(this, converter, key)
        class(fortran_converter_factory), intent(in) :: this
        type(fortran_data_converter), intent(inout) :: converter
        type(string), intent(in) :: key

        call this%build_host_converter(converter%converter, key)
    end subroutine build_data_converter_from_string

    type(fortran_data_converter) function get_data_converter_from_string(this, key)
        class(fortran_converter_factory), intent(in) :: this
        type(string), intent(in) :: key

        call this%build_data_converter(get_data_converter_from_string, key)
    end function get_data_converter_from_string

    type(fortran_data_converter) function get_data_converter_from_chars(this, key)
        class(fortran_converter_factory), intent(in) :: this
        character(len=*), intent(in) :: key

        call this%build_data_converter(get_data_converter_from_chars, string(key))
    end function get_data_converter_from_chars

    subroutine build_data_converter_from_chars(this, converter, key)
        class(fortran_converter_factory), intent(in) :: this
        type(fortran_data_converter), intent(inout) :: converter
        character(len=*), intent(in) :: key

        call this%build_data_converter(converter, string(key))
    end subroutine build_data_converter_from_chars

    subroutine build_host_converter_from_string(this, converter, key)
        class(fortran_converter_factory), intent(in) :: this
        type(fortran_host_converter), intent(inout) :: converter
        type(string), intent(in) :: key

        class(data_builder), allocatable :: builder

        call memory_factory%create_data_builder(builder, key)

        select type(builder)
        class is (host_builder)
            call converter%cleanup()
            converter%builder = builder
        class default
            error stop "fortran_converter_factory:build_host_converter_from_string:Not a valid builder."
        end select
        deallocate(builder)
    end subroutine build_host_converter_from_string

    type(fortran_host_converter) function get_host_converter_from_string(this, key)
        class(fortran_converter_factory), intent(in) :: this
        type(string), intent(in) :: key

        call this%build_host_converter(get_host_converter_from_string, key)
    end function get_host_converter_from_string

    type(fortran_host_converter) function get_host_converter_from_chars(this, key)
        class(fortran_converter_factory), intent(in) :: this
        character(len=*), intent(in) :: key

        call this%build_host_converter(get_host_converter_from_chars, string(key))
    end function get_host_converter_from_chars

    subroutine build_host_converter_from_chars(this, converter, key)
        class(fortran_converter_factory), intent(in) :: this
        type(fortran_host_converter), intent(inout) :: converter
        character(len=*), intent(in) :: key

        call this%build_host_converter(converter, string(key))
    end subroutine build_host_converter_from_chars
end module fortran_converter_factory_module
