add_library(
    ntcl_data_converter_test
    converter_package_test.f90
    fortran_data_converter_test.f90
    fortran_host_converter_test.f90
)
add_library(ntcl_util::converter_test ALIAS ntcl_data_converter_test)
target_include_directories(
    ntcl_data_converter_test
    PUBLIC
    ${CMAKE_CURRENT_BINARY_DIR}
)
target_link_libraries(
    ntcl_data_converter_test
    PUBLIC
    ntcl_util::api
    ntcl_data_api
)
