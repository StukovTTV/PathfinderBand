MACRO(CONFIGURE_SDL2_SOUND _NAME_TARGET _ONLY_DEFINES)
    INCLUDE(FindPkgConfig)
    PKG_SEARCH_MODULE(SDL2 sdl2)
    PKG_SEARCH_MODULE(SDL2_MIXER SDL2_mixer>=2.0.0)
    IF(SDL2_FOUND AND SDL2_MIXER_FOUND)
        IF(NOT _ONLY_DEFINES)
            TARGET_LINK_LIBRARIES(${_NAME_TARGET} PRIVATE ${SDL2_LIBRARIES} ${SDL2_MIXER_LIBRARIES})
            TARGET_INCLUDE_DIRECTORIES(${_NAME_TARGET} PRIVATE ${SDL2_INCLUDE_DIRS} ${SDL2_MIXER_INCLUDE_DIRS})
            TARGET_COMPILE_OPTIONS(${_NAME_TARGET} PRIVATE ${SDL2_CFLAGS} ${SDL2_MIXER_CFLAGS})
            TARGET_LINK_OPTIONS(${_NAME_TARGET} PRIVATE ${SDL2_LDFLAGS} ${SDL2_MIXER_LDFLAGS})
        ENDIF()
        TARGET_COMPILE_DEFINITIONS(${_NAME_TARGET} PRIVATE -D SOUND_SDL2)
        TARGET_COMPILE_DEFINITIONS(${_NAME_TARGET} PRIVATE -D SOUND)
        MESSAGE(STATUS "Support for sound with SDL2 - Ready")
    ELSE()
        MESSAGE(FATAL_ERROR "Support for sound with SDL2 - Failed")
    ENDIF()
ENDMACRO()
