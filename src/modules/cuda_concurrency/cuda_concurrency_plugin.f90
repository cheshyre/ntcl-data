module cuda_concurrency_plugin
    use :: dependency_manager_cuda_module, only : dependency_manager_cuda
    use :: event_handler_cuda_module, only : event_handler_cuda
    use :: stream_handler_cuda_module, only : stream_handler_cuda

    implicit none
    public

contains
    integer function cuda_synchronize_wrapper(astream)
        use, intrinsic :: iso_c_binding, only : c_associated
        use :: concurrency_api, only : stream
        use :: cuda_memory_interface, only : cudadevicesynchronize
        use :: cuda_concurrency_interface, only : cuda_stream_synchronize

        type(stream), intent(in), optional :: astream

        cuda_synchronize_wrapper = 0

        if ( present(astream) ) then
            if ( c_associated(astream%sid) ) then
                call cuda_stream_synchronize(astream%sid)
            else
                cuda_synchronize_wrapper = cudadevicesynchronize()
            end if
        else
            cuda_synchronize_wrapper = cudadevicesynchronize()
        end if
    end function cuda_synchronize_wrapper
end module cuda_concurrency_plugin
