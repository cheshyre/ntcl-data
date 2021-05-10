module data_dev
    use :: data_api

    use :: memory_api, only : &
            abstract_memory_factory

    use :: concurrency_api, only : &
            abstract_concurrency_factory

    use :: host_memory_plugin, only : &
            host_storage, &
            host_builder, &
            host_data_manager

    use :: host_concurrency_plugin, only : &
            dependency_manager_host, &
            event_handler_host, &
            stream_handler_host

    use :: default_memory_factory_module, only : default_memory_factory
    use :: default_concurrency_factory_module, only : default_concurrency_factory

    implicit none
    public
end module data_dev
