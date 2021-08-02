
find_package(Catch2 REQUIRED)

# Allows for faster build times when iterating on tests.
add_library(catch_main STATIC)
target_sources(catch_main
    PRIVATE
        catch_main.cpp)
target_link_libraries(catch_main PUBLIC Catch2::Catch2)
target_compile_features(catch_main PUBLIC cxx_std_14)


add_executable(example_lib_tests)
target_sources(example_lib_tests
    PRIVATE
        example_tests.cpp)

target_link_libraries(example_lib_tests
    PRIVATE
        catch_main
        Catch2::Catch2)
target_include_directories(example_lib_tests
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR})


include(Catch)
catch_discover_tests(
    example_lib_tests
    TEST_PREFIX
    ""
    EXTRA_ARGS
        -s
        --reporter=xml
        --out=tests.xml)

# Without the above you would have to do the following
# add_test(NAME <Test NAME> COMMAND example_lib_tests <args>)
