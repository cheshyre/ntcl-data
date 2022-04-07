add_library(
    ntcl_data_concurrency_api
    concurrency_api.f90
)
add_library(ntcl_data::concurrency_api ALIAS ntcl_data_concurrency_api)
target_include_directories(
    ntcl_data_concurrency_api
    PUBLIC
    ${CMAKE_CURRENT_BINARY_DIR}
)
target_link_libraries(
    ntcl_data_concurrency_api
    PUBLIC
    ntcl_data_concurrency
)