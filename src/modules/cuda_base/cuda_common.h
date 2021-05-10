#pragma once
#include <stdio.h>

#define check_cuda_error(ans) { gpuAssert((ans), __FILE__, __LINE__); }
extern "C"
inline void gpuAssert(cudaError_t code, const char *file, int line, bool abort=true)
{
    #ifdef DEBUG
        if (code != cudaSuccess)
        {
            fprintf(stderr,"GPUassert: %s %s %d\n", cudaGetErrorString(code), file, line);
            if (abort) exit(code);
        }
    #endif
}


