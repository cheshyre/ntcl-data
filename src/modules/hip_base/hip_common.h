#pragma once
#include <stdio.h>
#include <hip/hip_runtime.h>

#define check_hip_error(ans) { gpuAssert((ans), __FILE__, __LINE__); }
inline void gpuAssert(hipError_t code, const char *file, int line, bool abort=true)
{
#ifdef DEBUG
        if (code != hipSuccess)
        {
            fprintf(stderr,"GPUassert %d: %s %s %d\n", code, hipGetErrorString(code), file, line);
            if (abort) exit(code);
        }
#endif
}
