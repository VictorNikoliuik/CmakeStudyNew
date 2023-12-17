set(LIBRARY_SRC
    my_lib.cpp)
set(LIBRARIES_INCLUDES
    "${INCLUDE_PATH}/my_lib"
    "${CMAKE_BINARY_DIR}/configured_files/include")

add_library(${LIBRARY_NAME} STATIC 
${LIBRARY_SRC}
${MY_LIB_HEADERS})

target_include_directories(${LIBRARY_NAME} PUBLIC ${LIBRARIES_INCLUDES})


if(${ENABLE_WARNINGS})
    target_set_warnings(
        ${LIBRARY_NAME}
        ${ENABLE_WARNINGS}
        ${ENABLE_WARNINGS_AS_ERRORS}
    )
endif()
