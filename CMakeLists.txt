cmake_minimum_required(VERSION 3.16)
project("th-common-widgets.qt" VERSION 0.0.1 LANGUAGES CXX)

find_package(Qt6 REQUIRED COMPONENTS Widgets)

FILE(GLOB_RECURSE SRC src/*.cc src/*.h)
add_library(th-common-widgets-qt ${SRC})
target_link_libraries(th-common-widgets-qt PUBLIC Qt6::Widgets)

target_include_directories(th-common-widgets-qt
        PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

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
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        FILES_MATCHING PATTERN "*.h"
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
