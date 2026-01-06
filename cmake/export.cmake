add_library(th-common-widgets-qt::th-common-widgets-qt
        ALIAS th-common-widgets-qt
)

install(TARGETS th-common-widgets-qt
        EXPORT thCommonWidgetsQtTargets
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION bin
        ARCHIVE DESTINATION lib
        FILE_SET HEADERS
        DESTINATION include
)

include(CMakePackageConfigHelpers)

# 生成 Config.cmake
configure_package_config_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/cmake/th-common-widgets-qtConfig.cmake.in
        ${CMAKE_CURRENT_BINARY_DIR}/th-common-widgets-qtConfig.cmake
        INSTALL_DESTINATION lib/cmake/th-common-widgets-qt
)

# 生成 Version.cmake（可选但强烈推荐）
write_basic_package_version_file(
        ${CMAKE_CURRENT_BINARY_DIR}/th-common-widgets-qtConfigVersion.cmake
        VERSION ${PROJECT_VERSION}
        COMPATIBILITY SameMajorVersion
)

# 安装 Config / Version
install(FILES
        ${CMAKE_CURRENT_BINARY_DIR}/th-common-widgets-qtConfig.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/th-common-widgets-qtConfigVersion.cmake
        DESTINATION lib/cmake/th-common-widgets-qt
)

# 安装导出的 targets
install(EXPORT thCommonWidgetsQtTargets
        NAMESPACE th-common-widgets-qt::
        DESTINATION lib/cmake/th-common-widgets-qt
)