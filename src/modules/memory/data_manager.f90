module data_manager_module
    use :: stream_module, only : stream
    use :: data_storage_module, only : data_storage

    implicit none
    private

    public :: data_manager

    type, abstract :: data_manager
    contains
        procedure(copy_storage_interface), deferred :: copy_storage
        procedure(copy_storage_interface), deferred :: secure_local_storage
        procedure(copy_storage_interface), deferred :: update_remote_storage
        procedure(copy_storage_interface), deferred :: release_local_storage
        procedure :: update_remote_and_release_local => update_remote_and_release_local
    end type data_manager

    abstract interface
        subroutine copy_storage_interface(this, src, dst, astream)
            import :: data_manager
            import :: data_storage
            import :: stream

            class(data_manager), intent(in) :: this
            class(data_storage), intent(in) :: src
            class(data_storage), intent(inout) :: dst
            type(stream), intent(in), optional :: astream
        end subroutine copy_storage_interface
    end interface
contains
    subroutine update_remote_and_release_local(this, local, remote, astream)
        class(data_manager), intent(in) :: this
        class(data_storage), intent(inout) :: local, remote
        type(stream), intent(in), optional :: astream

        call this%update_remote_storage(local, remote, astream)
        call this%release_local_storage(remote, local, astream)
    end subroutine update_remote_and_release_local
end module data_manager_module
