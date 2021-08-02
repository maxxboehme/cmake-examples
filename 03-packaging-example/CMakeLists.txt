cmake_minimum_required(VERSION 3.15)

# Keep project infomration in a separate file
include("${CMAKE_CURRENT_LIST_DIR}/project-meta-info.cmake")

project(PackagingExampleProject
    VERSION ${project_version}
    DESCRIPTION ${project_description}
    HOMEPAGE_URL ${project_homepage}
    LANGUAGES CXX)

include(GNUInstallDirs)

add_subdirectory(library)
add_subdirectory(executable)

set(runtime_component "${PROJECT_NAME}_rt")
set(development_component "${PROJECT_NAME}_dev")

install(
    TARGETS example_executable example_lib
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        COMPONENT ${runtime_component}
    LIBRARY DESTINATION ${CMAKE_INSTALL_BINDIR}
        COMPONENT ${runtime_component}
        NAMELINK_COMPONENT ${development_component}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_BINDIR}
        COMPONENT ${development_component}
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        COMPONENT ${development_component})

# Packaging Support
include(cmake/Packaging.cmake)
