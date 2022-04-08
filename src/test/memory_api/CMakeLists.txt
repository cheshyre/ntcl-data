add_library(
    ntcl_data_memory_api_test
    memory_api_package_test.f90
)
add_library(ntcl_util::memory_api_test ALIAS ntcl_data_memory_api_test)
target_include_directories(
    ntcl_data_memory_api_test
    PUBLIC
    ${CMAKE_CURRENT_BINARY_DIR}
)
target_link_libraries(
    ntcl_data_memory_api_test
    PUBLIC
    ntcl_util::api
)
