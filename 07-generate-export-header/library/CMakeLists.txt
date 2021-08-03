add_library(example_lib SHARED)
generate_export_header(example_lib)
target_sources(example_lib
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/entrypoints.h>
	$<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/example_lib_export.h>
    PRIVATE
        entrypoints.cpp)

target_public_headers(example_lib
    ${CMAKE_CURRENT_SOURCE_DIR}/entrypoints.h
    ${CMAKE_CURRENT_BINARY_DIR}/example_lib_export.h)

target_include_directories(example_lib
    PUBLIC
    	$<BUILD_INTERFACE:${CMAKE_BINARY_DIR}>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)
