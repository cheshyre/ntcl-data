add_library(
    ntcl_data_concurrency_test
    concurrency_package_test.f90
    event_test.f90
    stream_test.f90
)
add_library(ntcl_util::concurrency_test ALIAS ntcl_data_concurrency_test)
target_include_directories(
    ntcl_data_concurrency_test
    PUBLIC
    ${CMAKE_CURRENT_BINARY_DIR}
)
target_link_libraries(
    ntcl_data_concurrency_test
    PUBLIC
    ntcl_data_concurrency
    ntcl_util::api
)
