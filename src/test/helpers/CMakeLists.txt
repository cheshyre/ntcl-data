add_library(
    ntcl_data_helpers_test
    helpers_package_test.f90
    storage_helper_test.f90
)
add_library(ntcl_util::helpers_test ALIAS ntcl_data_helpers_test)
target_include_directories(
    ntcl_data_helpers_test
    PUBLIC
    ${CMAKE_CURRENT_BINARY_DIR}
)
target_link_libraries(
    ntcl_data_helpers_test
    PUBLIC
    ntcl_util::api
    ntcl_data_api
)
