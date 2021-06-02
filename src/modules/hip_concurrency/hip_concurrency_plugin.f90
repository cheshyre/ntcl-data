module hip_concurrency_plugin
    use :: dependency_manager_hip_module, only : dependency_manager_hip
    use :: event_handler_hip_module, only : event_handler_hip
    use :: stream_handler_hip_module, only : stream_handler_hip

    implicit none
    public
contains
    integer function hip_synchronize_wrapper(astream)
        use, intrinsic :: iso_c_binding, only : c_associated
        use :: concurrency_api, only : stream
        use :: hip_concurrency_interface, only : &
                hip_stream_synchronize, &
                hip_device_synchronize

        type(stream), intent(in), optional :: astream

        hip_synchronize_wrapper = 0

        if ( present(astream) ) then
            if ( c_associated(astream%sid) ) then
                hip_synchronize_wrapper = hip_stream_synchronize(astream%sid)
            else
                hip_synchronize_wrapper = hip_device_synchronize()
            end if
        else
            hip_synchronize_wrapper = hip_device_synchronize()
        end if
    end function hip_synchronize_wrapper
end module hip_concurrency_plugin
