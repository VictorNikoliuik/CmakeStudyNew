function(
    add_sanitizer_flags
    TARGET_NAME
    ENABLE_SANITIZE_ADDR
    ENABLE_SANITIZE_UNDEF)
    if(NOT ENABLE_SANITIZE_ADDR AND NOT ENABLE_SANITIZE_UNDEF)
        message(STATUS "Sanitizers deactivated.")
        return()
    endif()

    message(STATUS "Sanitizers activated.")
    if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR CMAKE_CXX_COMPILER_ID MATCHES
                                                "GNU")
        target_compile_options(${TARGET_NAME} PRIVATE "-fno-omit-frame-pointer")
        target_link_options(${TARGET_NAME} PRIVATE "-fno-omit-frame-pointer")

        if(ENABLE_SANITIZE_ADDR)
            target_compile_options(${TARGET_NAME} PRIVATE "-fsanitize=address")
            target_link_options(${TARGET_NAME} PRIVATE "-fsanitize=address")
        endif()

        if(ENABLE_SANITIZE_UNDEF)
            target_compile_options(${TARGET_NAME}
                                   PRIVATE "-fsanitize=undefined")
            target_link_options(${TARGET_NAME} PRIVATE "-fsanitize=undefined")
        endif()
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
        if(ENABLE_SANITIZE_ADDR)
            target_compile_options(${TARGET_NAME} "/fsanitize=address")
        endif()

        if(ENABLE_SANITIZE_UNDEF)
            message(STATUS "Undefined sanitizer not impl. for MSVC!")
        endif()
    else()
        message(STATUS "Sanitizer not supported in this environment!")
    endif()
endfunction(add_sanitizer_flags)
