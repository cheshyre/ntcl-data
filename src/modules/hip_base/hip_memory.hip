#include <stdio.h>
#include "hip_common.h"
#include <hip/hip_runtime.h>

extern "C" int hip_update_device(void *d_dst, void *h_src, size_t nbytes)
{
  hipError_t error;
  error = hipMemcpy(d_dst, h_src, nbytes, hipMemcpyHostToDevice);
  check_hip_error(error);

  return error;
}

extern "C" int hip_update_host(void *h_dst, void *d_src, size_t nbytes)
{
  hipError_t error;
  error = hipMemcpy(h_dst, d_src, nbytes, hipMemcpyDeviceToHost);
  check_hip_error(error);

  return error;
}

extern "C" int hip_update_device_async(void *dst, void *src, size_t nbytes)
{
  hipError_t error;
  error = hipMemcpyAsync(dst, src, nbytes, hipMemcpyHostToDevice, 0);
  check_hip_error(error);

  return error;
}

extern "C" int hip_update_host_async(void *dst, void *src, size_t nbytes)
{
  hipError_t error;
  error = hipMemcpyAsync(dst, src, nbytes, hipMemcpyDeviceToHost, 0);
  check_hip_error(error);

  return error;
}

extern "C" int hip_device2device(void *dst, void *src, size_t nbytes)
{
  hipError_t error;
  error = hipMemcpy(dst, src, nbytes, hipMemcpyDeviceToDevice);
  check_hip_error(error);

  return error;
}

extern "C" int hip_update_device_async_with_stream(void *dst, void *src, size_t nbytes, hipStream_t *stream)
{
  hipError_t error;

  if ( stream )
  {
    error = hipMemcpyAsync(dst, src, nbytes, hipMemcpyHostToDevice, *stream);
  } else
  {
    error = hipMemcpyAsync(dst, src, nbytes, hipMemcpyHostToDevice, 0);
  }
  check_hip_error(error);

  return error;
}

extern "C" int hip_update_host_async_with_stream(void *dst, void *src, size_t nbytes, hipStream_t *stream)
{
  hipError_t error;

  if ( stream )
  {
    error = hipMemcpyAsync(dst, src, nbytes, hipMemcpyDeviceToHost, *stream);
  } else
  {
    error = hipMemcpyAsync(dst, src, nbytes, hipMemcpyDeviceToHost, 0);
  }
  check_hip_error(error);

  return error;
}

extern "C" int hip_device2device_with_stream(void *dst, void *src, size_t nbytes, hipStream_t *stream)
{
  hipError_t error;

  if ( stream )
  {
    error = hipMemcpyAsync(dst, src, nbytes, hipMemcpyDeviceToDevice, *stream);
  } else
  {
    error = hipMemcpyAsync(dst, src, nbytes, hipMemcpyDeviceToDevice, 0);
  }
  check_hip_error(error);

  return error;
}

extern "C" int hipMallocWrapper(void** buffer, size_t nbytes){
  hipError_t error;

  error = hipMalloc(buffer,nbytes);

  check_hip_error(error);

  return error;
}

extern "C" int hipMallocHostWrapper(void** buffer, size_t nbytes){
  hipError_t error;

  error = hipHostMalloc(buffer,nbytes);

  check_hip_error(error);

  return error;
}

extern "C" int hipFreeWrapper(void* buffer){
  hipError_t error;

  error = hipFree(buffer);

  check_hip_error(error);

  return error;
}

extern "C" int hipFreeHostWrapper(void* buffer){
  hipError_t error;

  error = hipHostFree(buffer);

  check_hip_error(error);

  return error;
}

extern "C" int hipMemGetInfoWrapper(size_t* free, size_t* total){
  hipError_t error;

  error = hipMemGetInfo(free, total);

  check_hip_error(error);

  return error;
}

extern "C" int hipDeviceSynchronizeWrapper(){
  hipError_t error;

  error = hipDeviceSynchronize();

  check_hip_error(error);

  return error;
}

extern "C" int hipStreamSynchronizeWrapper(hipStream_t stream){
  hipError_t error;

  error = hipStreamSynchronize(stream);

  check_hip_error(error);

  return error;
}

extern "C" int check_hip_peek_at_last_error()
{
  hipError_t error;

  error = hipPeekAtLastError();

  check_hip_error(error);

  return error;
}

extern "C" void hip_error_printer(hipError_t code)
{
  fprintf(stderr,"hipError:%d: %s\n", code, hipGetErrorString(code));
}
