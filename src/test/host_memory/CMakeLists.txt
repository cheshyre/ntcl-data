add_library(
    ntcl_data_host_memory_test
    host_memory_package_test.f90
    host_builder_test.f90
)
add_library(ntcl_util::host_memory_test ALIAS ntcl_data_host_memory_test)
target_include_directories(
    ntcl_data_host_memory_test
    PUBLIC
    ${CMAKE_CURRENT_BINARY_DIR}
)
target_link_libraries(
    ntcl_data_host_memory_test
    PUBLIC
    ntcl_util::api
    ntcl_data_host_memory
)
