CMake VCPKG Integration Example
```
$ vcpkg install catch2
$ mkdir build && cd build
$ cmake .. -DCMAKE_TOOLCHAIN_FILE=~/github/vcpkg/scripts/buildsystems/vcpkg.cmake
```
