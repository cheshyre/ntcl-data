module host_data_manager_module
    use, intrinsic :: iso_fortran_env, only : error_unit, int64
    use, intrinsic :: iso_c_binding, only : c_ptr, c_f_pointer, c_loc
    use :: data_manager_module, only : data_manager
    use :: data_storage_module, only : data_storage
    use :: host_storage_module, only : host_storage
    use :: stream_module, only : stream

    implicit none
    private

    public :: host_data_manager

    type, extends(data_manager) :: host_data_manager
    contains
        procedure :: copy_storage => copy_storage
        procedure :: secure_local_storage => secure_local_storage
        procedure :: update_remote_storage => update_remote_storage
        procedure :: release_local_storage => release_local_storage

        procedure :: copy_host_data => copy_host_data
        procedure :: point_to_host_data => point_to_host_data
        procedure :: update_host_storage_from_host => update_host_storage_from_host
        procedure :: release_host_storage_from_host => release_host_storage_from_host
        procedure :: copy_storage_from_cpointer => copy_storage_from_cpointer
    end type host_data_manager
contains
    subroutine copy_storage(this, src, dst, astream)
        class(host_data_manager), intent(in) :: this
        class(data_storage), intent(in) :: src
        class(data_storage), intent(inout) :: dst
        type(stream), intent(in), optional :: astream

        select type (src)
        type is (host_storage)
            select type (dst)
            type is (host_storage)
                call this%copy_host_data(src, dst)
            end select
        end select
    end subroutine copy_storage

    subroutine secure_local_storage(this, src, dst, astream)
        class(host_data_manager), intent(in) :: this
        class(data_storage), intent(in) :: src
        class(data_storage), intent(inout) :: dst
        type(stream), intent(in), optional :: astream

        select type (src)
        type is (host_storage)
            select type (dst)
            type is (host_storage)
                call this%point_to_host_data(src, dst)
            end select
        end select
    end subroutine secure_local_storage

    subroutine update_remote_storage(this, src, dst, astream)
        class(host_data_manager), intent(in) :: this
        class(data_storage), intent(in) :: src
        class(data_storage), intent(inout) :: dst
        type(stream), intent(in), optional :: astream

        select type (src)
        type is (host_storage)
            select type (dst)
            type is (host_storage)
                call this%update_host_storage_from_host(src, dst)
            end select
        end select
    end subroutine update_remote_storage

    subroutine release_local_storage(this, src, dst, astream)
        class(host_data_manager), intent(in) :: this
        class(data_storage), intent(in) :: src
        class(data_storage), intent(inout) :: dst
        type(stream), intent(in), optional :: astream

        select type (src)
        type is (host_storage)
            select type (dst)
            type is (host_storage)
                call this%release_host_storage_from_host(src, dst)
            end select
        end select
    end subroutine release_local_storage

    subroutine copy_host_data(this, src, dst)
        class(host_data_manager), intent(in) :: this
        class(host_storage), intent(in) :: src
        class(host_storage), intent(inout) :: dst

        if ( src%is_allocated ) then
            if ( (.not. dst%is_allocated) .or. dst%number_of_bytes /= src%number_of_bytes) &
                    call dst%allocate_data(src%number_of_bytes)
        else
            return
        end if

        call this%copy_storage_from_cpointer(src%get_data_pointer(), dst%get_data_pointer(), &
                src%number_of_bytes)
    end subroutine copy_host_data

    subroutine update_host_storage_from_host(this, src, dst)
        class(host_data_manager), intent(in) :: this
        class(host_storage), intent(in) :: src
        class(host_storage), intent(inout) :: dst

        ! Do nothing since local is remote
        ! Maybe should check for identical pointers
    end subroutine update_host_storage_from_host

    subroutine release_host_storage_from_host(this, src, dst)
        class(host_data_manager), intent(in) :: this
        class(host_storage), intent(in) :: src
        class(host_storage), intent(inout) :: dst

        call dst%clear()
    end subroutine release_host_storage_from_host

    subroutine copy_storage_from_cpointer(this, src, dst, nbytes)
        class(host_data_manager), intent(in) :: this
        type(c_ptr), intent(in) :: src
        type(c_ptr), intent(in) :: dst
        integer(int64), intent(in) :: nbytes

        character(len=1), dimension(:), pointer :: sptr, dptr

        call c_f_pointer(src, sptr, shape=[nbytes])
        call c_f_pointer(dst, dptr, shape=[nbytes])
        dptr = sptr
    end subroutine copy_storage_from_cpointer

    subroutine point_to_host_data(this, src, dst)
        class(host_data_manager), intent(in) :: this
        class(host_storage), intent(in) :: src
        class(host_storage), intent(inout) :: dst

        call dst%set_data_pointer(src%get_data_pointer(), src%number_of_bytes)
    end subroutine point_to_host_data
end module host_data_manager_module
