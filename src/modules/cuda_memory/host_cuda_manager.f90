module host_cuda_manager_module
    use, intrinsic :: iso_fortran_env, only : error_unit
    use, intrinsic :: iso_c_binding, only : c_int, c_size_t, c_ptr
    use :: data_manager_module, only : data_manager
    use :: data_storage_module, only : data_storage
    use :: host_storage_module, only : host_storage
    use :: cuda_data_manager_module, only : cuda_data_manager
    use :: host_data_manager_module, only : host_data_manager
    use :: cuda_storage_module, only : cuda_storage
    use :: cuda_pinned_storage_module, only : cuda_pinned_storage
    use :: cuda_data_wrapper_module, only : &
            cuda_update_device, &
            cuda_update_host, &
            cuda_data_success, &
            cuda_update_host_async, &
            cuda_update_host_async_with_stream, &
            cuda_update_device_async, &
            cuda_update_device_async_with_stream
    use :: fortran_c_intrinsics, only : memcpy
    use :: stream_module, only : stream

    implicit none
    private

    public :: host_cuda_manager

    type, extends(data_manager) :: host_cuda_manager
        type(cuda_data_manager) :: device_manager
        type(host_data_manager) :: host_manager
    contains
        procedure :: copy_storage => copy_storage
        procedure :: secure_local_storage => secure_local_storage
        procedure :: update_remote_storage => update_remote_storage
        procedure :: release_local_storage => release_local_storage
        procedure :: device2host => device2host
        procedure :: host2device => host2device
        procedure :: device2host_async => device2host_async
        procedure :: host2device_async => host2device_async
        procedure :: host2host => host2host
    end type host_cuda_manager

    interface host_cuda_manager
        module procedure constructor
    end interface host_cuda_manager
contains
    function constructor() result(this)
        type(host_cuda_manager) :: this
    end function constructor

    subroutine copy_storage(this, src, dst, astream)
        class(host_cuda_manager), intent(in) :: this
        class(data_storage), intent(in) :: src
        class(data_storage), intent(inout) :: dst
        type(stream), intent(in), optional :: astream

        if ( src%is_allocated ) then
            if ( (.not. dst%is_allocated) .or. dst%number_of_bytes /= src%number_of_bytes) &
                    call dst%allocate_data(src%number_of_bytes)
        else
            return
        end if

        select type (s => src)
        type is (host_storage)
            select type (d => dst)
            type is (host_storage)
                call this%host_manager%copy_host_data(s, d)
            type is (cuda_pinned_storage)
                call this%host2host(s, d)
            type is (cuda_storage)
                call this%host2device(s, d)
            end select
        type is (cuda_storage)
            select type (d => dst)
            type is (host_storage)
                call this%device2host(s, d)
            type is (cuda_pinned_storage)
                call this%device2host_async(s, d, astream)
            type is (cuda_storage)
                call this%device_manager%copy_device_data(s, d, astream)
            end select
        type is (cuda_pinned_storage)
            select type (d => dst)
            type is (host_storage)
                call this%host2host(s, d)
            type is (cuda_pinned_storage)
                call this%host2host(s, d)
            type is (cuda_storage)
                call this%host2device_async(s, d, astream)
            end select
        end select
    end subroutine copy_storage

    subroutine secure_local_storage(this, src, dst, astream)
        class(host_cuda_manager), intent(in) :: this
        class(data_storage), intent(in) :: src
        class(data_storage), intent(inout) :: dst
        type(stream), intent(in), optional :: astream

        if (.not. src%is_allocated) return

        select type (s => src)
        type is (host_storage)
            select type (d => dst)
            type is (host_storage)
                call this%host_manager%point_to_host_data(s, d)
            type is (cuda_pinned_storage)
                call dst%allocate_data(src%number_of_bytes)
                call this%host2host(s, d)
            type is (cuda_storage)
                call dst%allocate_data(src%number_of_bytes)
                call this%host2device(s, d)
            end select
        type is (cuda_storage)
            select type (d => dst)
            type is (host_storage)
                call dst%allocate_data(src%number_of_bytes)
                call this%device2host(s, d)
            type is (cuda_pinned_storage)
                call dst%allocate_data(src%number_of_bytes)
                call this%device2host_async(s, d, astream)
            type is (cuda_storage)
                call this%device_manager%point_to_device_data(s, d)
            end select
        type is (cuda_pinned_storage)
            select type (d => dst)
            class is (host_storage)
                call this%host_manager%point_to_host_data(s, d)
            type is (cuda_storage)
                call dst%allocate_data(src%number_of_bytes)
                call this%host2device_async(s, d, astream)
            end select
        end select
    end subroutine secure_local_storage

    subroutine update_remote_storage(this, src, dst, astream)
        class(host_cuda_manager), intent(in) :: this
        class(data_storage), intent(in) :: src
        class(data_storage), intent(inout) :: dst
        type(stream), intent(in), optional :: astream

        if (.not. src%is_allocated) return
        if ( .not. same_type_as(src, dst) .and. dst%number_of_bytes /= src%number_of_bytes) &
            call dst%allocate_data(src%number_of_bytes)

        select type (s => src)
        type is (host_storage)
            select type (d => dst)
            class is (host_storage)
                call this%host_manager%update_host_storage_from_host(s, d)
            type is (cuda_storage)
                call this%host2device(s, d)
            end select
        type is (cuda_storage)
            select type (d => dst)
            type is (host_storage)
                call this%device2host(s, d)
            type is (cuda_pinned_storage)
                call this%device2host_async(s, d, astream)
            type is (cuda_storage)
                call this%device_manager%update_device_storage_from_device(s, d)
            end select
        type is (cuda_pinned_storage)
            select type (d => dst)
            type is (host_storage)
                call this%host2host(s, d)
            type is (cuda_pinned_storage)
                call this%host_manager%update_host_storage_from_host(s, d)
            type is (cuda_storage)
                call this%host2device_async(s, d, astream)
            end select
        end select
    end subroutine update_remote_storage

    subroutine release_local_storage(this, src, dst, astream)
        class(host_cuda_manager), intent(in) :: this
        class(data_storage), intent(in) :: src
        class(data_storage), intent(inout) :: dst
        type(stream), intent(in), optional :: astream

        if (.not. dst%is_allocated) return

        select type (s => src)
        type is (host_storage)
            select type (d => dst)
            type is (host_storage)
                call this%host_manager%release_host_storage_from_host(s, d)
            type is (cuda_pinned_storage)
                call d%deallocate_data()
            type is (cuda_storage)
                call d%deallocate_data()
            end select
        type is (cuda_storage)
            select type (d => dst)
            type is (host_storage)
                call d%deallocate_data()
            type is (cuda_pinned_storage)
                call d%deallocate_data()
            type is (cuda_storage)
                call this%device_manager%release_device_storage_from_device(s, d)
            end select
        type is (cuda_pinned_storage)
            select type (d => dst)
            class is (host_storage)
                call this%host_manager%release_host_storage_from_host(s, d)
            type is (cuda_storage)
                call d%deallocate_data()
            end select
        end select
    end subroutine release_local_storage

    subroutine host2host(this, src, dst)
        class(host_cuda_manager), intent(in) :: this
        class(host_storage), intent(in) :: src
        class(host_storage), intent(inout) :: dst

        type(c_ptr) :: dummy

        dummy = memcpy(dst%get_data_pointer(), src%get_data_pointer(), &
                int(dst%number_of_bytes, c_size_t) )
    end subroutine host2host

    subroutine device2host(this, src, dst)
        class(host_cuda_manager), intent(in) :: this
        class(cuda_storage), intent(in) :: src
        class(host_storage), intent(inout) :: dst

        integer(c_int) :: error

        error = cuda_update_host(dst%get_data_pointer(), src%get_data_pointer(), &
                int(dst%number_of_bytes, c_size_t) )
    end subroutine device2host

    subroutine device2host_async(this, src, dst, astream)
        class(host_cuda_manager), intent(in) :: this
        class(cuda_storage), intent(in) :: src
        class(host_storage), intent(inout) :: dst
        type(stream), intent(in), optional :: astream

        integer(c_int) :: error

        if ( present(astream) ) then
            error = cuda_update_host_async_with_stream(dst%get_data_pointer(), src%get_data_pointer(), &
                    int(dst%number_of_bytes, c_size_t), astream%sid )
        else
            error = cuda_update_host_async(dst%get_data_pointer(), src%get_data_pointer(), &
                    int(dst%number_of_bytes, c_size_t) )
        end if
    end subroutine device2host_async

    subroutine host2device(this, src, dst)
        class(host_cuda_manager), intent(in) :: this
        class(host_storage), intent(in) :: src
        class(cuda_storage), intent(inout) :: dst

        integer(c_int) :: error

        error = cuda_update_device(dst%get_data_pointer(), src%get_data_pointer(), &
                int(dst%number_of_bytes, c_size_t) )
    end subroutine host2device

    subroutine host2device_async(this, src, dst, astream)
        class(host_cuda_manager), intent(in) :: this
        class(host_storage), intent(in) :: src
        class(cuda_storage), intent(inout) :: dst
        type(stream), intent(in), optional :: astream

        integer(c_int) :: error

        if ( present(astream) ) then
            error = cuda_update_device_async_with_stream(dst%get_data_pointer(), src%get_data_pointer(), &
                    int(dst%number_of_bytes, c_size_t), astream%sid )
        else
            error = cuda_update_device_async(dst%get_data_pointer(), src%get_data_pointer(), &
                    int(dst%number_of_bytes, c_size_t) )
        end if
    end subroutine host2device_async
end module host_cuda_manager_module
