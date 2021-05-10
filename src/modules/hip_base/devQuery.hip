#include "hip/hip_runtime.h"
#include <stdio.h>

// Print device properties
void printDevProp(hipDeviceProp_t devProp)
{
    printf("Name:                          %s\n",  devProp.name);
    printf("Total global memory:           %u\n",  devProp.totalGlobalMem);
    printf("Total shared memory per block: %u\n",  devProp.sharedMemPerBlock);
    printf("Total registers per block:     %d\n",  devProp.regsPerBlock);
    printf("Warp size:                     %d\n",  devProp.warpSize);
    printf("Maximum threads per block:     %d\n",  devProp.maxThreadsPerBlock);
    for (int i = 0; i < 3; ++i)
    printf("Maximum dimension %d of block:  %d\n", i, devProp.maxThreadsDim[i]);
    for (int i = 0; i < 3; ++i)
    printf("Maximum dimension %d of grid:   %d\n", i, devProp.maxGridSize[i]);
    printf("Clock rate:                    %d\n",  devProp.clockRate);
    printf("Mem Clock rate:                %d\n",  devProp.memoryClockRate);
    printf("Mem Bus Width in bits:         %d\n",  devProp.memoryBusWidth);
    printf("Total constant memory:         %u\n",  devProp.totalConstMem);
    printf("Major revision number:         %d\n",  devProp.major);
    printf("Minor revision number:         %d\n",  devProp.minor);
    printf("Number of multiprocessors:     %d\n",  devProp.multiProcessorCount);
    printf("L2 cache size:                 %d\n",  devProp.l2CacheSize);
    printf("Max resident thread per mp:    %d\n",  devProp.maxThreadsPerMultiProcessor);
    printf("Compute mode:                  %d\n",  devProp.computeMode);
    printf("Device-side clock freq (khz):  %d\n",  devProp.clockInstructionRate);
    return;
}

extern "C" int hipDevProp(){
    // Number of CUDA devices
    int devCount;
    hipGetDeviceCount(&devCount);
    printf("HIP Device Query...\n");
    printf("There are %d devices.\n", devCount);

    // Iterate through devices
    for (int i = 0; i < devCount; ++i)
    {
        // Get device properties
        printf("\nDevice #%d\n", i);
        hipDeviceProp_t devProp;
        hipGetDeviceProperties(&devProp, i);
        printDevProp(devProp);
    }
    return 0;
}
