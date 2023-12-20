function(target_enable_lto TARGET)

    include(CheckIPOSupported)
    check_ipo_supported(RESULT result OUTPUT output)

    if(result)
        message(STATUS "IPO/LTO is supported!")
        set_property(TARGET ${TARGET} PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE`)
    else()
        message(WARNING "IPO/LTO is not supported!")
    endif()
endfunction(target_enable_lto)
