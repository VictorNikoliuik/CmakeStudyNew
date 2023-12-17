set(TESTS_SRS main.cpp)
set(TESTS_INDLUDES "./")
set(TESTS_NAME Testing)

include(FetchContent)

FetchContent_Declare(
    Catch2
    GIT_REPOSITORY https://github.com/catchorg/Catch2
    GIT_TAG v2.13.9
    GIT_SHALLOW TRUE)
FetchContent_MakeAvailable(Catch2)

add_executable(${TESTS_NAME} ${TESTS_SRS})
target_include_directories(${TESTS_NAME} PUBLIC ${TESTS_INDLUDES})
target_link_libraries(${TESTS_NAME} PUBLIC
${LIBRARY_NAME}
Catch2::Catch2)