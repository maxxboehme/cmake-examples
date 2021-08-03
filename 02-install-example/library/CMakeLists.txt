add_library(example_lib STATIC)
target_sources(example_lib
    PUBLIC
        entrypoints.hpp
    PRIVATE
        entrypoints.cpp)

target_public_headers(example_lib
    ${CMAKE_CURRENT_SOURCE_DIR}/entrypoints.hpp)

target_include_directories(example_lib
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR})
