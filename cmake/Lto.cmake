function(target_enable_lto)

set(one_value_args ENABLE)
set(${multi_Value_Args} TARGET)

cmake_parse_arguments(
    LTO
    "${options}"
    "${one_value_args}"
    "${multi_Value_Args}"
    ${ARGN}
)

    include(CheckIPOSupported)
    check_ipo_supported(RESULT result OUTPUT output)

    if(result)
        message(STATUS "IPO/LTO is supported!")
        set_property(TARGET ${LTO_TARGET} PROPERTY INTERPROCEDURAL_OPTIMIZATION ${LTO_ENABLE})
    else()
        message(WARNING "IPO/LTO is not supported!")
    endif()
endfunction(target_enable_lto)
