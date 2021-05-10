module data_api
    use :: memory_api, only : &
            data_storage, &
            data_storage_wrapper, &
            data_manager, &
            data_builder, &
            memory_factory, &
            memory_manager, &
            memory_initialize, &
            memory_finalize

    use :: concurrency_api, only : &
            event, &
            event_handler, &
            stream, &
            stream_handler, &
            dependency_manager, &
            concurrency_factory, &
            concurrency_initialize, &
            concurrency_finalize

    use :: scratch_buffer_api, only : &
            scratch_buffer, &
            scratch_buffer_builder, &
            create_scratch_buffer, &
            get_scratch_buffer

    use :: fortran_host_converter_module, only : &
            fortran_host_converter, &
            create_host_storage, &
            secure_fortran_pointer_from_host, &
            get_host_storage_from_array, &
            get_host_storage_from_c_ptr_array, &
            secure_c_ptr_array_from_host, &
            create_host_storage_from_c_ptr_array

    use :: fortran_data_converter_module, only : &
            fortran_data_converter, &
            secure_fortran_pointer_from_remote_storage, &
            release_pointer_from_remote_storage, &
            update_remote_storage_from_pointer, &
            update_remote_storage_and_release_pointer

    use :: fortran_converter_factory_module, only : fortran_converter_factory

    use :: storage_construction_api, only : &
            create_storage_builder, &
            get_storage_builder, &
            storage_builder, &
            allocate_and_create_storage, &
            create_storage, &
            allocate_and_create_storage_in_scratch, &
            create_storage_in_scratch, &
            allocate_and_copy_storage, &
            copy_storage, &
            allocate_and_copy_storage_to_scratch, &
            copy_storage_to_scratch, &
            allocate_and_point_to_storage, &
            point_to_storage, &
            copy_storage_from_c_ptr, &
            copy_storage_to_scratch_from_c_ptr

    use :: storage_helper_module, only : storage_helper

    implicit none
    public
end module data_api
