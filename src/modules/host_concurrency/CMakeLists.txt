add_library(
    ntcl_data_host_concurrency
    dependency_manager_host.f90
    event_handler_host.f90
    host_concurrency_plugin.f90
    stream_handler_host.f90
)
add_library(ntcl_data::host_concurrency ALIAS ntcl_data_host_concurrency)
target_include_directories(
    ntcl_data_host_concurrency
    PUBLIC
    ${CMAKE_CURRENT_BINARY_DIR}
)
target_link_libraries(
    ntcl_data_host_concurrency
    PUBLIC
    ntcl_data_concurrency
)