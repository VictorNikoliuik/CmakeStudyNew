set(LIBRARY_SRC my_lib.cpp)
set(LIBRARIES_INCLUDES "${INCLUDE_PATH}/my_lib"
                       "${CMAKE_BINARY_DIR}/configured_files/include")

add_library(${LIBRARY_NAME} STATIC ${LIBRARY_SRC} ${MY_LIB_HEADERS})

target_include_directories(${LIBRARY_NAME} PUBLIC ${LIBRARIES_INCLUDES})

if(SANITIZER_ADRESS
   OR SANITIZER_UNDEFINED
   AND NOT ${ENABLE_TEST})
    add_sanitizer_flags(${EXECUTABLE_NAME} SANITIZER_ADRESS SANITIZER_UNDEFINED)
endif()

target_set_warnings(
    TARGET
    ${LIBRARY_NAME}
    ENABLE
    ${ENABLE_WARNINGS}
    AS_ERRORS
    ${ENABLE_WARNINGS_AS_ERRORS})

if(${CLANG_TIDY_ENABLED})
    add_clang_tidy_to_target(${LIBRARY_NAME})
endif()
