add_library(example_lib STATIC)
target_sources(example_lib
    PUBLIC
        entrypoints.hpp
    PRIVATE
        entrypoints.cpp)

target_include_directories(example_lib
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR})
