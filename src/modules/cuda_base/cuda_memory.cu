#include <stdio.h>
#include "cuda_common.h"
void allocate_device_data(void **buffer, long int number_of_bytes)
{
  check_cuda_error(cudaMalloc(buffer, number_of_bytes));
}

extern "C" int cuda_update_device(void *dst, void *src, size_t nbytes)
{
  cudaError_t error;

  error = cudaMemcpy(dst, src, nbytes, cudaMemcpyHostToDevice);
  check_cuda_error(error);

  return error;
}

extern "C" int cuda_update_host(void *dst, void *src, size_t nbytes)
{
  cudaError_t error;

  error = cudaMemcpy(dst, src, nbytes, cudaMemcpyDeviceToHost);
  check_cuda_error(error);

  return error;
}

extern "C" int cuda_update_device_async(void *dst, void *src, size_t nbytes)
{
  cudaError_t error;

  error = cudaMemcpyAsync(dst, src, nbytes, cudaMemcpyHostToDevice, 0);
  check_cuda_error(error);

  return error;
}

extern "C" int cuda_update_host_async(void *dst, void *src, size_t nbytes)
{
  cudaError_t error;

  error = cudaMemcpyAsync(dst, src, nbytes, cudaMemcpyDeviceToHost, 0);
  check_cuda_error(error);

  return error;
}

extern "C" int cuda_device2device(void *dst, void *src, size_t nbytes)
{
  cudaError_t error;

  error = cudaMemcpy(dst, src, nbytes, cudaMemcpyDeviceToDevice);
  check_cuda_error(error);

  return error;
}

extern "C" int cuda_update_device_async_with_stream(void *dst, void *src, size_t nbytes, cudaStream_t *stream)
{
  cudaError_t error;

  if ( stream )
  {
    error = cudaMemcpyAsync(dst, src, nbytes, cudaMemcpyHostToDevice, *stream);
  } else
  {
    error = cudaMemcpyAsync(dst, src, nbytes, cudaMemcpyHostToDevice, 0);
  }
  check_cuda_error(error);

  return error;
}

extern "C" int cuda_update_host_async_with_stream(void *dst, void *src, size_t nbytes, cudaStream_t *stream)
{
  cudaError_t error;

  if ( stream )
  {
    error = cudaMemcpyAsync(dst, src, nbytes, cudaMemcpyDeviceToHost, *stream);
  } else
  {
    error = cudaMemcpyAsync(dst, src, nbytes, cudaMemcpyDeviceToHost, 0);
  }
  check_cuda_error(error);

  return error;
}

extern "C" int cuda_device2device_with_stream(void *dst, void *src, size_t nbytes, cudaStream_t *stream)
{
  cudaError_t error;

  if ( stream )
  {
    error = cudaMemcpyAsync(dst, src, nbytes, cudaMemcpyDeviceToDevice, *stream);
  } else
  {
    error = cudaMemcpyAsync(dst, src, nbytes, cudaMemcpyDeviceToDevice, 0);
  }
  check_cuda_error(error);

  return error;
}

extern "C" int check_cuda_peek_at_last_error()
{
  cudaError_t error;

  error = cudaPeekAtLastError();

  check_cuda_error(error);

  return error;
}

extern "C" void cuda_error_printer(cudaError_t code)
{
  fprintf(stderr,"cudaError:%d: %s\n", code, cudaGetErrorString(code));
}
