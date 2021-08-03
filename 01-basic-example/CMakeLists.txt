cmake_minimum_required(VERSION 3.15)

# Keep project infomration in a separate file
include("${CMAKE_CURRENT_LIST_DIR}/project-meta-info.cmake")

project(PackageConfigExampleProject
    VERSION ${project_version}
    DESCRIPTION ${project_description}
    HOMEPAGE_URL ${project_homepage}
    LANGUAGES CXX)

include(cmake/StandardProjectSettings.cmake)

add_subdirectory(library)
add_subdirectory(executable)
