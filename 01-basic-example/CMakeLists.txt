cmake_minimum_required(VERSION 3.15)

project(BasicExampleProject
    VERSION 0.0.1
    DESCRIPTION "Simple CMake beginner project"
    LANGUAGES CXX)


add_subdirectory(library)
add_subdirectory(executable)
