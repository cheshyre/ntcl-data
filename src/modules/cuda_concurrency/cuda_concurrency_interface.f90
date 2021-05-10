module cuda_concurrency_interface
    use, intrinsic :: iso_c_binding, only : c_ptr, c_int

    implicit none

    interface
        type(c_ptr) function cuda_create_event() bind(C, name="cuda_create_event")
            import :: c_ptr
        end function cuda_create_event

        subroutine cuda_destroy_event(event) bind(C, name="cuda_destroy_event")
            import :: c_ptr
            type(c_ptr), value :: event
        end subroutine cuda_destroy_event

        integer(c_int) function cuda_query_event(event) bind(C, name="cuda_query_event")
            import :: c_int
            import :: c_ptr
            type(c_ptr), value :: event
        end function cuda_query_event

        subroutine cuda_record_event(event, stream) bind(C, name="cuda_record_event")
            import :: c_ptr
            type(c_ptr), value :: event, stream
        end subroutine cuda_record_event

        subroutine cuda_record_event_without_stream(event) bind(C, name="cuda_record_event_without_stream")
            import :: c_ptr
            type(c_ptr), value :: event
        end subroutine cuda_record_event_without_stream

        type(c_ptr) function cuda_create_stream() bind(C, name="cuda_create_stream")
            import :: c_ptr
        end function cuda_create_stream

        subroutine cuda_destroy_stream(stream) bind(C, name="cuda_destroy_stream")
            import :: c_ptr
            type(c_ptr), value :: stream
        end subroutine cuda_destroy_stream

        integer(c_int) function cuda_query_stream(stream) bind(C, name="cuda_query_stream")
            import :: c_int
            import :: c_ptr
            type(c_ptr), value :: stream
        end function cuda_query_stream

        subroutine cuda_stream_wait_for_event(stream, event) bind(C, name="cuda_stream_wait_for_event")
            import :: c_ptr
            type(c_ptr), value :: event, stream
        end subroutine cuda_stream_wait_for_event

        subroutine cuda_stream_synchronize(stream) bind(c, name="cuda_stream_synchronize")
            import :: c_ptr

            type(c_ptr), value :: stream
        end subroutine cuda_stream_synchronize

        subroutine cuda_synchronize_all() bind(C, name="cuda_synchronize_all")
        end subroutine cuda_synchronize_all

        subroutine cuda_event_synchronize(event) bind(C, name="cuda_event_synchronize")
            import :: c_ptr
            type(c_ptr), value :: event
        end subroutine cuda_event_synchronize
    end interface
end module cuda_concurrency_interface
