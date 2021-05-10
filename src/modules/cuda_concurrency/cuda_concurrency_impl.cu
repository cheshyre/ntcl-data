#include <cuda_common.h>

extern "C" cudaEvent_t * cuda_create_event()
{
        cudaEvent_t *event;

        event = (cudaEvent_t *) malloc(sizeof(cudaEvent_t));
        check_cuda_error(cudaEventCreateWithFlags(event, cudaEventDisableTiming));
        return event;
}

extern "C" void cuda_destroy_event(cudaEvent_t *event)
{
        check_cuda_error(cudaEventDestroy(*event));
        free(event);
}

extern "C" cudaError_t cuda_query_event(cudaEvent_t *event)
{
        return cudaEventQuery(*event);
}

extern "C" void cuda_record_event(cudaEvent_t *event, cudaStream_t *stream)
{
        check_cuda_error(cudaEventRecord(*event, *stream));
}

extern "C" void cuda_record_event_without_stream(cudaEvent_t *event)
{
        check_cuda_error(cudaEventRecord(*event));
}

extern "C" cudaStream_t * cuda_create_stream()
{
        cudaStream_t *stream;

        stream = (cudaStream_t *) malloc(sizeof(cudaStream_t));
        check_cuda_error(cudaStreamCreate(stream));
        return stream;
}

extern "C" void cuda_destroy_stream(cudaStream_t *stream)
{
        check_cuda_error(cudaStreamDestroy(*stream));
        free(stream);
}

extern "C" void cuda_stream_synchronize(cudaStream_t *stream) {
        check_cuda_error(cudaStreamSynchronize(*stream));
}

extern "C" cudaError_t cuda_query_stream(cudaStream_t *stream)
{
        return cudaStreamQuery(*stream);
}

extern "C" void cuda_stream_wait_for_event(cudaStream_t *stream, cudaEvent_t *event)
{
        check_cuda_error(cudaStreamWaitEvent(*stream, *event, 0));
}

extern "C" void cuda_event_synchronize(cudaEvent_t *event)
{
    check_cuda_error(cudaEventSynchronize(*event));
}

extern "C" void cuda_synchronize_all(void)
{
    check_cuda_error(cudaDeviceSynchronize());
}
