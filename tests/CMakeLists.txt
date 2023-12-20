set(TESTS_SRS main.cpp)
set(TESTS_INDLUDES "./")
set(TESTS_NAME Testing)

add_executable(${TESTS_NAME} ${TESTS_SRS})
target_include_directories(${TESTS_NAME} PUBLIC ${TESTS_INDLUDES})
target_link_libraries(${TESTS_NAME} PUBLIC
${LIBRARY_NAME}
Catch2::Catch2)
