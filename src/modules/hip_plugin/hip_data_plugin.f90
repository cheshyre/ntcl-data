module hip_data_plugin
    use :: hip_memory_wrapper_module
    use :: hip_data_wrapper_module

    use :: hip_storage_module
    use :: hip_pinned_storage_module
    use :: hip_builder_module
    use :: hip_pinned_builder_module
    use :: host_hip_manager_module

    use :: hip_concurrency_plugin
    use :: hip_concurrency_interface

    implicit none
    public
end module hip_data_plugin
