module cuda_data_plugin
    use :: cuda_memory_interface
    use :: cuda_memory_wrapper_module
    use :: cuda_data_wrapper_module

    use :: cuda_storage_module
    use :: cuda_pinned_storage_module
    use :: cuda_builder_module
    use :: cuda_pinned_builder_module
    use :: host_cuda_manager_module

    use :: cuda_concurrency_plugin
    use :: cuda_concurrency_interface

    implicit none
    public
end module cuda_data_plugin
