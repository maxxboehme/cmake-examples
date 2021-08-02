add_executable(example_executable)
target_sources(example_executable
    PRIVATE
        main.cpp)
target_link_libraries(example_executable
    PRIVATE
        example_lib)
