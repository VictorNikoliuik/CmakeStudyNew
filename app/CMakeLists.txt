add_executable(${EXECUTABLE_NAME} main.cpp)

target_link_libraries(${EXECUTABLE_NAME} PUBLIC 
${LIBRARY_NAME}
nlohmann_json::nlohmann_json)
target_include_directories(${EXECUTABLE_NAME} PUBLIC
    "./")

if(${ENABLE_WARNINGS})
    target_set_warnings(
        ${EXECUTABLE_NAME}
        ${ENABLE_WARNINGS}
        ${ENABLE_WARNINGS_AS_ERRORS}
    )
endif()

if(${LTO_ENABLED})
    target_enable_lto(${EXECUTABLE_NAME})
endif()

if(SANITIZER_ADRESS OR SANITIZER_UNDEFINED)
    add_sanitizer_flags(${EXECUTABLE_NAME} SANITIZER_ADRESS SANITIZER_UNDEFINED)
endif()
