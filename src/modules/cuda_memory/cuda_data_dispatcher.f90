module cuda_data_dispatcher_module
    use, intrinsic :: iso_c_binding, only : c_null_ptr, c_ptr

    use :: memory_api, only : &
            data_storage, &
            memory_manager
    use :: stream_module, only : stream
    use :: cuda_storage_module, only : cuda_storage

    implicit none
    private

    public :: cuda_data_dispatcher

    type :: cuda_data_dispatcher
    contains
        procedure :: get_temporary => get_temporary
        procedure :: update_from_temporary => update_from_temporary
        procedure :: release_temporary => release_temporary
        procedure :: update_and_release_temporary => update_and_release_temporary
    end type cuda_data_dispatcher

contains
    type(c_ptr) function get_temporary(this, storage, astream)
        class(cuda_data_dispatcher), intent(in) :: this
        class(data_storage), intent(in) :: storage
        type(stream), intent(in), optional :: astream

        type(cuda_storage) :: local

        local = cuda_storage()
        call memory_manager%secure_local_storage(storage, local, astream)
        get_temporary = local%get_data_pointer()

        call local%clear()
    end function get_temporary

    subroutine update_and_release_temporary(this, storage, src, astream)
        class(cuda_data_dispatcher), intent(in) :: this
        class(data_storage), intent(inout) :: storage
        type(c_ptr), intent(inout) :: src
        type(stream), intent(in), optional :: astream

        call this%update_from_temporary(storage, src, astream)
        call this%release_temporary(storage, src, astream)
    end subroutine update_and_release_temporary

    subroutine update_from_temporary(this, storage, src, astream)
        class(cuda_data_dispatcher), intent(in) :: this
        class(data_storage), intent(inout) :: storage
        type(c_ptr), intent(in) :: src
        type(stream), intent(in), optional :: astream

        type(cuda_storage) :: local_storage

        local_storage = cuda_storage(src, storage%number_of_bytes)
        call memory_manager%update_remote_storage(local_storage, storage, astream)
        call local_storage%clear()
    end subroutine update_from_temporary

    subroutine release_temporary(this, storage, ptr, astream)
        class(cuda_data_dispatcher), intent(in) :: this
        class(data_storage), intent(in) :: storage
        type(c_ptr), intent(inout) :: ptr
        type(stream), intent(in), optional :: astream

        type(cuda_storage) :: local_storage

        local_storage = cuda_storage(ptr, storage%number_of_bytes)
        call memory_manager%release_local_storage(storage, local_storage, astream)
        ptr = c_null_ptr
    end subroutine release_temporary
end module cuda_data_dispatcher_module
