module event_module
    use, intrinsic :: iso_c_binding, only : c_ptr, c_null_ptr

    implicit none
    private

    public :: event

    type :: event
        type(c_ptr) :: eid
    end type event

    interface event
        module procedure constructor
        module procedure constructor_with_id
    end interface event

contains
    function constructor() result(this)
        type(event) :: this

        this%eid = c_null_ptr
    end function constructor

    function constructor_with_id(sid) result(this)
        type(c_ptr), intent(in) :: sid
        type(event) :: this

        this%eid = sid
    end function constructor_with_id
end module event_module
