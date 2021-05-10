module storage_construction_api
    use :: storage_builder_factory_module, only : &
            get_storage_builder, &
            create_storage_builder
    use :: storage_builder_module, only : storage_builder
    use :: storage_builder_interface, only : &
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

    implicit none
    public
end module storage_construction_api
