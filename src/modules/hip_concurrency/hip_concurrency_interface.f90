module hip_concurrency_interface
    use, intrinsic :: iso_c_binding, only : c_ptr, c_int

    implicit none

    interface
        type(c_ptr) function hip_create_event() bind(C, name="hip_create_event")
            import :: c_ptr
        end function hip_create_event

        subroutine hip_destroy_event(event) bind(C, name="hip_destroy_event")
            import :: c_ptr
            type(c_ptr), value :: event
        end subroutine hip_destroy_event

        integer(c_int) function hip_query_event(event) bind(C, name="hip_query_event")
            import :: c_int
            import :: c_ptr
            type(c_ptr), value :: event
        end function hip_query_event

        subroutine hip_record_event(event, stream) bind(C, name="hip_record_event")
            import :: c_ptr
            type(c_ptr), value :: event, stream
        end subroutine hip_record_event

        subroutine hip_record_event_without_stream(event) bind(C, name="hip_record_event_without_stream")
            import :: c_ptr
            type(c_ptr), value :: event
        end subroutine hip_record_event_without_stream

        type(c_ptr) function hip_create_stream() bind(C, name="hip_create_stream")
            import :: c_ptr
        end function hip_create_stream

        subroutine hip_destroy_stream(stream) bind(C, name="hip_destroy_stream")
            import :: c_ptr
            type(c_ptr), value :: stream
        end subroutine hip_destroy_stream

        integer(c_int) function hip_query_stream(stream) bind(C, name="hip_query_stream")
            import :: c_int
            import :: c_ptr
            type(c_ptr), value :: stream
        end function hip_query_stream

        subroutine hip_stream_wait_for_event(stream, event) bind(C, name="hip_stream_wait_for_event")
            import :: c_ptr
            type(c_ptr), value :: event, stream
        end subroutine hip_stream_wait_for_event

        subroutine hip_synchronize_all() bind(C, name="hip_synchronize_all")
        end subroutine hip_synchronize_all

        subroutine hip_event_synchronize(event) bind(C, name="hip_event_synchronize")
            import :: c_ptr
            type(c_ptr), value :: event
        end subroutine hip_event_synchronize
    end interface
end module hip_concurrency_interface
