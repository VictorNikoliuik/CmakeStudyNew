set(TESTS_SRS "${CMAKE_CURRENT_SOURCE_DIR}/main.cpp")
set(TESTS_INDLUDES "")
set(TESTS_NAME Testing)

add_executable(${TESTS_NAME} ${TESTS_SRS} ${TESTS_INDLUDES})
target_include_directories(${TESTS_NAME} PUBLIC ${TESTS_INDLUDES})
target_link_libraries(${TESTS_NAME} PRIVATE Catch2::Catch2)
target_link_libraries(${TESTS_NAME} PUBLIC ${LIBRARY_NAME})

if(${ENABLE_COVERAGE})
    set(COVERAGE_MAIN "coverage")
    set(COVERAGE_EXCLUDES
        "${PROJECT_SOURCE_DIR}/app/*"
        "${PROJECT_SOURCE_DIR}/cmake/*"
        "${PROJECT_SOURCE_DIR}/docs/*"
        "${PROJECT_SOURCE_DIR}/external/*"
        "${PROJECT_SOURCE_DIR}/tests/*"
        "${PROJECT_SOURCE_DIR}/build/*"
        "/usr/include/*"
        "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX14.2.sdk/usr/include/*"
        "/Users/mac/.*")

    setup_target_for_coverage_lcov(
        NAME
        ${COVERAGE_MAIN}
        EXECUTABLE
        ${TESTS_NAME}
        DEPENDENCIES
        ${TESTS_NAME})
endif()
