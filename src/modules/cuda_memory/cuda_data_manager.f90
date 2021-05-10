module cuda_data_manager_module
    use, intrinsic :: iso_c_binding, only : c_int, c_size_t
    use :: data_manager_module, only : data_manager
    use :: data_storage_module, only : data_storage
    use :: cuda_data_wrapper_module, only : &
            cuda_device2device, &
            cuda_device2device_with_stream, &
            cuda_data_success
    use :: cuda_storage_module, only : cuda_storage
    use :: stream_module, only : stream
    implicit none
    private

    public :: cuda_data_manager

    type, extends(data_manager) :: cuda_data_manager
    contains
        procedure :: copy_storage => copy_storage
        procedure :: secure_local_storage => secure_local_storage
        procedure :: update_remote_storage => update_remote_storage
        procedure :: release_local_storage => release_local_storage
        procedure :: copy_device_data => copy_device_data
        procedure :: point_to_device_data => point_to_device_data
        procedure :: update_device_storage_from_device => update_device_storage_from_device
        procedure :: release_device_storage_from_device => release_device_storage_from_device
    end type cuda_data_manager
contains
    subroutine copy_storage(this, src, dst, astream)
        class(cuda_data_manager), intent(in) :: this
        class(data_storage), intent(in) :: src
        class(data_storage), intent(inout) :: dst
        type(stream), intent(in), optional :: astream

        select type (src)
        type is (cuda_storage)
            select type (dst)
            type is (cuda_storage)
                call this%copy_device_data(src, dst, astream)
            end select
        end select
    end subroutine copy_storage

    subroutine secure_local_storage(this, src, dst, astream)
        class(cuda_data_manager), intent(in) :: this
        class(data_storage), intent(in) :: src
        class(data_storage), intent(inout) :: dst
        type(stream), intent(in), optional :: astream

        select type (src)
        type is (cuda_storage)
            select type (dst)
            type is (cuda_storage)
                call this%point_to_device_data(src, dst)
            end select
        end select
    end subroutine secure_local_storage

    subroutine update_remote_storage(this, src, dst, astream)
        class(cuda_data_manager), intent(in) :: this
        class(data_storage), intent(in) :: src
        class(data_storage), intent(inout) :: dst
        type(stream), intent(in), optional :: astream

        select type (src)
        type is (cuda_storage)
            select type (dst)
            type is (cuda_storage)
                call this%update_device_storage_from_device(src, dst)
            end select
        end select
    end subroutine update_remote_storage

    subroutine release_local_storage(this, src, dst, astream)
        class(cuda_data_manager), intent(in) :: this
        class(data_storage), intent(in) :: src
        class(data_storage), intent(inout) :: dst
        type(stream), intent(in), optional :: astream

        select type (src)
        type is (cuda_storage)
            select type (dst)
            type is (cuda_storage)
                call this%release_device_storage_from_device(src, dst)
            end select
        end select
    end subroutine release_local_storage

    subroutine copy_device_data(this, src, dst, astream)
        class(cuda_data_manager), intent(in) :: this
        type(cuda_storage), intent(in) :: src
        type(cuda_storage), intent(inout) :: dst
        type(stream), intent(in), optional :: astream

        integer(c_int) :: error

        if ( src%is_allocated ) then
            call dst%allocate_data(src%number_of_bytes)
        else
            return
        end if

        if ( present( astream) ) then
            error = cuda_device2device_with_stream(dst%get_data_pointer(), src%get_data_pointer(), &
                    int(src%number_of_bytes, c_size_t), astream%sid)
        else
            error = cuda_device2device(dst%get_data_pointer(), src%get_data_pointer(), &
                    int(src%number_of_bytes, c_size_t))
        end if
        if ( error /= cuda_data_success ) call dst%deallocate_data()
    end subroutine copy_device_data

    subroutine point_to_device_data(this, src, dst)
        class(cuda_data_manager), intent(in) :: this
        type(cuda_storage), intent(in) :: src
        type(cuda_storage), intent(inout) :: dst

        dst = cuda_storage(src%get_data_pointer(), src%number_of_bytes)
    end subroutine point_to_device_data

    subroutine update_device_storage_from_device(this, src, dst)
        class(cuda_data_manager), intent(in) :: this
        type(cuda_storage), intent(in) :: src
        type(cuda_storage), intent(inout) :: dst

        ! Do nothing.
        ! Maybe check for pointer equivalence
    end subroutine update_device_storage_from_device

    subroutine release_device_storage_from_device(this, src, dst)
        class(cuda_data_manager), intent(in) :: this
        type(cuda_storage), intent(in) :: src
        type(cuda_storage), intent(inout) :: dst

        ! Do nothing.
        ! Maybe check for pointer equivalence
    end subroutine release_device_storage_from_device

end module cuda_data_manager_module
