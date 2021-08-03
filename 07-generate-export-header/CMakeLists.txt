cmake_minimum_required(VERSION 3.15)

# Keep project infomration in a separate file
include("${CMAKE_CURRENT_LIST_DIR}/project-meta-info.cmake")

project(PackageConfigExampleProject
    VERSION ${project_version}
    DESCRIPTION ${project_description}
    HOMEPAGE_URL ${project_homepage}
    LANGUAGES CXX)

include(cmake/StandardProjectSettings.cmake)
include(cmake/Utilities.cmake)
include(GNUInstallDirs)
include(GenerateExportHeader)

include(cmake/SetupConan.cmake)

add_subdirectory(library)

option(ENABLE_TESTING "Enable building tests" ON)
if(ENABLE_TESTING)
    message("Building Tests")
    enable_testing()
    add_subdirectory(tests)
endif()

# Specify some variables to help with specifying install configuration and help generate Config files.
set(generated_dir "${CMAKE_CURRENT_BINARY_DIR}/generated")
set(version_config "${generated_dir}/${PROJECT_NAME}-config-version.cmake")
set(project_config "${generated_dir}/${PROJECT_NAME}-config.cmake")
set(targets_export_name "${PROJECT_NAME}-targets")
set(namespace "${PROJECT_NAME}::")
set(config_files_install_location "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    "${version_config}"
    VERSION
        ${project_version}
    COMPATIBILITY
        SameMajorVersion)

configure_package_config_file(
    "${PROJECT_SOURCE_DIR}/cmake/Config.cmake.in"
    "${project_config}"
    INSTALL_DESTINATION
        ${config_files_install_location})

set(runtime_component "${PROJECT_NAME}_rt")
set(development_component "${PROJECT_NAME}_dev")

install(
    TARGETS example_lib
    EXPORT ${targets_export_name}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        COMPONENT ${runtime_component}
    LIBRARY DESTINATION ${CMAKE_INSTALL_BINDIR}
        COMPONENT ${runtime_component}
        NAMELINK_COMPONENT ${development_component}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_BINDIR}
        COMPONENT ${development_component}
    PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        COMPONENT ${development_component})

install(
    EXPORT ${targets_export_name}
    NAMESPACE ${namespace}
    DESTINATION ${config_files_install_location})

install(
    FILES ${project_config} ${version_config}
    DESTINATION ${config_files_install_location})


# Packaging Support
include(cmake/Packaging.cmake)
