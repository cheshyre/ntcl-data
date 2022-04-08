add_library(
    ntcl_data_concurrency_api_test
    concurrency_api_package_test.f90
)
add_library(ntcl_util::concurrency_api_test ALIAS ntcl_data_concurrency_api_test)
target_include_directories(
    ntcl_data_concurrency_api_test
    PUBLIC
    ${CMAKE_CURRENT_BINARY_DIR}
)
target_link_libraries(
    ntcl_data_concurrency_api_test
    PUBLIC
    ntcl_util::api
)
