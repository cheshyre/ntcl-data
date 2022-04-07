add_library(
    ntcl_data_memory_api
    memory_api.f90
)
add_library(ntcl_data::memory_api ALIAS ntcl_data_memory_api)
target_include_directories(
    ntcl_data_memory_api
    PUBLIC
    ${CMAKE_CURRENT_BINARY_DIR}
)
target_link_libraries(
    ntcl_data_memory_api
    PUBLIC
    ntcl_data_memory
)