#include <hip_common.h>
#include <hip/hip_runtime.h>
#include <stdio.h>

extern "C" hipEvent_t * hip_create_event()
{
  hipEvent_t *event;

  event = (hipEvent_t *) malloc(sizeof(hipEvent_t));
  check_hip_error(hipEventCreateWithFlags(event, hipEventDisableTiming));
  return event;
}

extern "C" void hip_destroy_event(hipEvent_t *event)
{
  check_hip_error(hipEventDestroy(*event));
  free(event);
}

extern "C" hipError_t hip_query_event(hipEvent_t *event)
{
  hipError_t error;

  error = hipEventQuery(*event);

  check_hip_error(error);

  return error;
}

extern "C" void hip_record_event(hipEvent_t *event, hipStream_t *stream)
{
  check_hip_error(hipEventRecord(*event, *stream));
}

extern "C" void hip_record_event_without_stream(hipEvent_t *event)
{
  check_hip_error(hipEventRecord(*event));
}

extern "C" hipStream_t * hip_create_stream()
{
  hipStream_t *stream;

  stream = (hipStream_t *) malloc(sizeof(hipStream_t));
  check_hip_error(hipStreamCreate(stream));
  return stream;
}

extern "C" void hip_destroy_stream(hipStream_t *stream)
{
  check_hip_error(hipStreamDestroy(*stream));
  free(stream);
}

extern "C" hipError_t hip_query_stream(hipStream_t *stream)
{
  hipError_t error;
  error = hipStreamQuery(*stream);
  check_hip_error(error);
  return error;
}

extern "C" void hip_stream_wait_for_event(hipStream_t *stream, hipEvent_t *event)
{
  check_hip_error(hipStreamWaitEvent(*stream, *event, 0));
}

extern "C" void hip_event_synchronize(hipEvent_t *event)
{
  check_hip_error(hipEventSynchronize(*event));
}

extern "C" void hip_synchronize_all(void)
{
  check_hip_error(hipDeviceSynchronize());
}
