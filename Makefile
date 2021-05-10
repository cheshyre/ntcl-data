# Auto-generated -- do not modify!

SOURCE_DIR := $(shell dirname ${MAKEFILE_LIST})
MAKEINC := ${NTCL_ROOT}/ntcl-build/makefile_fragments

include ${MAKEINC}/standard_preample.mk

modules      += concurrency concurrency_api memory memory_api host_concurrency host_memory converter scratch_buffer construction helpers
test_modules += concurrency concurrency_api memory memory_api host_concurrency host_memory converter scratch_buffer construction helpers

ifdef use_cuda
modules      += cuda_base cuda_concurrency cuda_memory cuda_plugin
test_modules += cuda_base cuda_concurrency cuda_memory cuda_plugin
FFLAGS += -Duse_cuda
endif

ifdef use_hip
modules      += hip_base hip_concurrency hip_memory
test_modules += hip_base hip_concurrency hip_memory
FFLAGS += -Duse_hip
endif

modules      += api
test_modules += api

test_modules += unittest

library_name := libntcl-data.a

external_include := 
external_libraries := ${NTCL_ROOT}/ntcl-util/lib/libntcl-util.a
internal_include_dirs := ${NTCL_ROOT}/ntcl-util/include

ifdef use_cuda
external_libraries += ${CUDA_LIBS} -lstdc++
endif

include ${MAKEINC}/standard_defs.mk
