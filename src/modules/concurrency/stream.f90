module stream_module
    use, intrinsic :: iso_c_binding, only : c_ptr, c_null_ptr

    implicit none
    private

    public :: stream

    type :: stream
        type(c_ptr) :: sid
    end type stream

    interface stream
        module procedure constructor
        module procedure constructor_with_id
    end interface stream

contains
    function constructor() result(this)
        type(stream) :: this

        this%sid = c_null_ptr
    end function constructor

    function constructor_with_id(sid) result(this)
        type(c_ptr), intent(in) :: sid
        type(stream) :: this

        this%sid = sid
    end function constructor_with_id
end module stream_module
