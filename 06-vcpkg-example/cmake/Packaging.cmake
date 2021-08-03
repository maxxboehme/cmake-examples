# Packaging Support
set(CPACK_PACKAGE_VENDOR "${project_vendor}")
set(CPACK_PACKAGE_CONTACT "${project_contact}")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "${project_description}")
set(CPACK_PACKAGE_DESCRIPTION_FILE "${PROJECT_SOURCE_DIR}/README.md")
set(CPACK_RESOURCE_FILE_LICENSE "${PROJECT_SOURCE_DIR}/LICENSE.txt")
set(CPACK_RESOURCE_FILE_README "${PROJECT_SOURCE_DIR}/README.md")

include(cmake/PackagingDEB.cmake)
include(cmake/PackagingRPM.cmake)
include(cmake/PackagingWIX.cmake)

# This must always be after CPACK variables
include(CPack)

cpack_add_component(
    ${runtime_component}
    DISPLAY_NAME Runtime
    DESCRIPTION "Files required by dependencies to run.")

cpack_add_component(
    ${development_component}
    DISPLAY_NAME Development
    DESCRIPTION "Files required by dependencies to build or help during development."
    DEPENDS ${runtime_component})
