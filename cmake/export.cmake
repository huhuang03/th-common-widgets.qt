

include(GNUInstallDirs)

install(
        TARGETS th-common-widgets-qt
        EXPORT th-common-widgets-qtTargets
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(
        DIRECTORY include/
        DESTINATION ${CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT}
)

install(
    EXPORT th-common-widgets-qtTargets
    FILE th-common-widgets-qtTargets.cmake
    NAMESPACE th-common-widgets-qt::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/th-common-widgets-qt
)

include(CMakePackageConfigHelpers)

configure_package_config_file(
    cmake/th-common-widgets-qtConfig.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/th-common-widgets-qtConfig.cmake
    INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/th-common-widgets-qt
)

write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/th-common-widgets-qtConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
)

install(
    FILES
        ${CMAKE_CURRENT_BINARY_DIR}/th-common-widgets-qtConfig.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/th-common-widgets-qtConfigVersion.cmake
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/th-common-widgets-qt
)
