cmake_minimum_required(VERSION 3.27)

project(
    CMakeStudy
    VERSION 1.0.0
    LANGUAGES C CXX
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(LIBRARY_NAME Library)
set(EXECUTABLE_NAME Executable)
set(INCLUDE_PATH "${CMAKE_SOURCE_DIR}/include")
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")

# Options
option(COMPILER_RT_BUILD_SHARED_ASAN "Zlupa" ON)
option(USE_CPM "Using CPM package manager" OFF)
option(USE_CONAN "Using CPM package manager" ON)
option(ENABLE_TEST "Define if Unit Tests enabled" ON)
option(ENABLE_WARNINGS "Enabale compiler warnings" ON)
option(ENABLE_WARNINGS_AS_ERRORS "Enabale compiler warnings as errors" OFF)
option(SANITIZER_ADRESS "Enabale sanitizer adress error" ON)
option(SANITIZER_UNDEFINED "Enabale sanitizer undefined error" ON)
option(LTO_ENABLED "Enable LTO/IPO" ON)

# For non git projects:
include(AddGitSubmodule)
# add_git_submodule(external/json)

if(USE_CPM)
    message(STATUS "Using CPM")
    include(CPM)
    cpmaddpackage("gh:nlohmann/json#v3.11.3")
    cpmaddpackage("gh:catchorg/Catch2#v2.13.9")
elseif(USE_CONAN)
    message(STATUS "Using CONAN")
    #conan will generate this file in the build/
    include(${CMAKE_BINARY_DIR}/conan_toolchain.cmake)
    find_package(nlohmann_json)
    find_package(Catch2)
else()
    message(STATUS "Using FetchContent")
    include(FetchContent)
    FetchContent_Declare(
        nlohmann_json
        GIT_REPOSITORY https://github.com/nlohmann/json
        GIT_TAG v3.11.3
        GIT_SHALLOW TRUE
    )
    FetchContent_MakeAvailable(nlohmann_json)

    FetchContent_Declare(
        Catch2
        GIT_REPOSITORY https://github.com/catchorg/Catch2
        GIT_TAG v2.13.9
        GIT_SHALLOW TRUE)
    FetchContent_MakeAvailable(Catch2)
endif()

#Doxygen generating target
include(Docs)

if(ENABLE_TEST)
    add_subdirectory(tests)
endif()


if(ENABLE_WARNINGS)
    include(Warnings)
endif()

if(SANITIZER_ADRESS OR SANITIZER_UNDEFINED)
    include(Sanitizers)
endif()

if(LTO_ENABLED)
    include(Lto)
    target_enable_lto(
        TARGET
        ${LIBRARY_NAME}
        ${EXECUTABLE_NAME}
        ENABLE
        ON
    )
endif()


add_subdirectory(configured)
# add_subdirectory(external)
add_subdirectory(app)
add_subdirectory(src)
