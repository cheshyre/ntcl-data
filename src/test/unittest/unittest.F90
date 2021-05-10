! Auto-generated -- DO NOT MODIFY
program unittest
    use :: util_api, only : &
            assert, &
            selector

    use :: data_initializer, only : &
            data_initialize, &
            data_finalize

    use :: concurrency_package_test_module, only : &
            concurrency_package_test
    use :: concurrency_api_package_test_module, only : &
            concurrency_api_package_test
    use :: memory_package_test_module, only : &
            memory_package_test
    use :: memory_api_package_test_module, only : &
            memory_api_package_test
    use :: host_concurrency_package_test_module, only : &
            host_concurrency_package_test
    use :: host_memory_package_test_module, only : &
            host_memory_package_test
    use :: converter_package_test_module, only : &
            converter_package_test
    use :: scratch_buffer_package_test_module, only : &
            scratch_buffer_package_test
    use :: construction_package_test_module, only : &
            construction_package_test
    use :: helpers_package_test_module, only : &
            helpers_package_test

#ifdef use_cuda
    use :: cuda_base_package_test_module, only : &
            cuda_base_package_test
    use :: cuda_concurrency_package_test_module, only : &
            cuda_concurrency_package_test
    use :: cuda_memory_package_test_module, only : &
            cuda_memory_package_test
    use :: cuda_plugin_package_test_module, only : &
            cuda_plugin_package_test
#endif

#ifdef use_hip
    use :: hip_base_package_test_module, only : &
            hip_base_package_test
    use :: hip_concurrency_package_test_module, only : &
            hip_concurrency_package_test
    use :: hip_memory_package_test_module, only : &
            hip_memory_package_test
#endif

    use :: api_package_test_module, only : &
            api_package_test

    implicit none

    type(assert) :: assertion
    type(selector) :: aselector

    type(concurrency_package_test) :: &
            aconcurrency_package_test
    type(concurrency_api_package_test) :: &
            aconcurrency_api_package_test
    type(memory_package_test) :: &
            amemory_package_test
    type(memory_api_package_test) :: &
            amemory_api_package_test
    type(host_concurrency_package_test) :: &
            ahost_concurrency_package_test
    type(host_memory_package_test) :: &
            ahost_memory_package_test
    type(converter_package_test) :: &
            aconverter_package_test
    type(scratch_buffer_package_test) :: &
            ascratch_buffer_package_test
    type(construction_package_test) :: &
            aconstruction_package_test
    type(helpers_package_test) :: &
            ahelpers_package_test

#ifdef use_cuda
    type(cuda_base_package_test) :: &
            acuda_base_package_test
    type(cuda_concurrency_package_test) :: &
            acuda_concurrency_package_test
    type(cuda_memory_package_test) :: &
            acuda_memory_package_test
    type(cuda_plugin_package_test) :: &
            acuda_plugin_package_test
#endif

#ifdef use_hip
    type(hip_base_package_test) :: &
            ahip_base_package_test
    type(hip_concurrency_package_test) :: &
            ahip_concurrency_package_test
    type(hip_memory_package_test) :: &
            ahip_memory_package_test
#endif

    type(api_package_test) :: &
            aapi_package_test

    assertion = assert()
    aselector = selector()

    call data_initialize()

    aconcurrency_package_test = concurrency_package_test(aselector)
    call aconcurrency_package_test%run(assertion)
    call aconcurrency_package_test%cleanup()

    aconcurrency_api_package_test = concurrency_api_package_test(aselector)
    call aconcurrency_api_package_test%run(assertion)
    call aconcurrency_api_package_test%cleanup()

    amemory_package_test = memory_package_test(aselector)
    call amemory_package_test%run(assertion)
    call amemory_package_test%cleanup()

    amemory_api_package_test = memory_api_package_test(aselector)
    call amemory_api_package_test%run(assertion)
    call amemory_api_package_test%cleanup()

    ahost_concurrency_package_test = host_concurrency_package_test(aselector)
    call ahost_concurrency_package_test%run(assertion)
    call ahost_concurrency_package_test%cleanup()

    ahost_memory_package_test = host_memory_package_test(aselector)
    call ahost_memory_package_test%run(assertion)
    call ahost_memory_package_test%cleanup()

    aconverter_package_test = converter_package_test(aselector)
    call aconverter_package_test%run(assertion)
    call aconverter_package_test%cleanup()

    ascratch_buffer_package_test = scratch_buffer_package_test(aselector)
    call ascratch_buffer_package_test%run(assertion)
    call ascratch_buffer_package_test%cleanup()

    aconstruction_package_test = construction_package_test(aselector)
    call aconstruction_package_test%run(assertion)
    call aconstruction_package_test%cleanup()

    ahelpers_package_test = helpers_package_test(aselector)
    call ahelpers_package_test%run(assertion)
    call ahelpers_package_test%cleanup()

#ifdef use_cuda
    acuda_base_package_test = cuda_base_package_test(aselector)
    call acuda_base_package_test%run(assertion)
    call acuda_base_package_test%cleanup()

    acuda_concurrency_package_test = cuda_concurrency_package_test(aselector)
    call acuda_concurrency_package_test%run(assertion)
    call acuda_concurrency_package_test%cleanup()

    acuda_memory_package_test = cuda_memory_package_test(aselector)
    call acuda_memory_package_test%run(assertion)
    call acuda_memory_package_test%cleanup()

    acuda_plugin_package_test = cuda_plugin_package_test(aselector)
    call acuda_plugin_package_test%run(assertion)
    call acuda_plugin_package_test%cleanup()
#endif

#ifdef use_hip
    ahip_base_package_test = hip_base_package_test(aselector)
    call ahip_base_package_test%run(assertion)
    call ahip_base_package_test%cleanup()

    ahip_concurrency_package_test = hip_concurrency_package_test(aselector)
    call ahip_concurrency_package_test%run(assertion)
    call ahip_concurrency_package_test%cleanup()

    ahip_memory_package_test = hip_memory_package_test(aselector)
    call ahip_memory_package_test%run(assertion)
    call ahip_memory_package_test%cleanup()
#endif

    aapi_package_test = api_package_test(aselector)
    call aapi_package_test%run(assertion)
    call aapi_package_test%cleanup()

    call data_finalize()

    call assertion%write_summary()

    call aselector%cleanup()
    call assertion%cleanup()
end program unittest
