add_library(
    ntcl_data_helpers
    storage_helper.f90
)
add_library(ntcl_data::helpers ALIAS ntcl_data_helpers)
target_include_directories(
    ntcl_data_helpers
    PUBLIC
    ${CMAKE_CURRENT_BINARY_DIR}
)
target_link_libraries(
    ntcl_data_helpers
    PUBLIC
    ntcl_data_memory_api
    ntcl_data_converter
)