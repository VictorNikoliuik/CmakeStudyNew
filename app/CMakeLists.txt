add_executable(${EXECUTABLE_NAME} main.cpp)

target_link_libraries(${EXECUTABLE_NAME} PUBLIC ${LIBRARY_NAME}
                                                nlohmann_json::nlohmann_json)
target_include_directories(${EXECUTABLE_NAME} PUBLIC "./")

if(SANITIZER_ADRESS OR SANITIZER_UNDEFINED)
    add_sanitizer_flags(${EXECUTABLE_NAME} SANITIZER_ADRESS SANITIZER_UNDEFINED)
endif()

target_set_warnings(
    TARGET
    ${EXECUTABLE_NAME}
    ENABLE
    ${ENABLE_WARNINGS}
    AS_ERRORS
    ${ENABLE_WARNINGS_AS_ERRORS})

if(${CLANG_TIDY_ENABLED})
    add_clang_tidy_to_target(${EXECUTABLE_NAME})
endif()
