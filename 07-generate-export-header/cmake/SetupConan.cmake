# Download automatically, you can also just copy the conan.cmake file
if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
  message(
    STATUS
      "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
  file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.16.1/conan.cmake"
       "${CMAKE_BINARY_DIR}/conan.cmake")
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

conan_cmake_configure(
    REQUIRES
        catch2/2.9.2
        fakeit/2.0.9
    OPTIONS
        fakeit:integration=catch
    GENERATORS
        cmake_paths
        cmake_find_package)

conan_cmake_autodetect(settings)

conan_cmake_install(PATH_OR_REFERENCE .
    BUILD missing
    SETTINGS ${settings})

include(${CMAKE_BINARY_DIR}/conan_paths.cmake)
