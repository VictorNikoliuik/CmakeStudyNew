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
# For non git projects:
include(AddGitSubmodule)
# add_git_submodule(external/json)

include(FetchContent)
FetchContent_Declare(
    nlohmann_json
    GIT_REPOSITORY https://github.com/nlohmann/json
    GIT_TAG v3.11.3
    GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(nlohmann_json)

#Doxygen generating target
include(Docs)

option(ENABLE_TEST "Define if Unit Tests enabled" ON)
if(ENABLE_TEST)
    add_subdirectory(tests)
endif()

option(ENABLE_WARNINGS "Enabale compiler warnings" ON)
option(ENABLE_WARNINGS_AS_ERRORS "Enabale compiler warnings as errors" OFF)

if(ENABLE_WARNINGS)
    include(Warnings)
endif()

option(SANITIZER_ADRESS "Enabale sanitizer adress error" ON)
option(SANITIZER_UNDEFINED "Enabale sanitizer undefined error" ON)

if(SANITIZER_ADRESS OR SANITIZER_UNDEFINED)
    include(Sanitizers)
    add_sanitizer_flags(SANITIZER_ADRESS SANITIZER_UNDEFINED)
endif()


add_subdirectory(configured)
# add_subdirectory(external)
add_subdirectory(app)
add_subdirectory(src)
