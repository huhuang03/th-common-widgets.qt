cmake_minimum_required(VERSION 3.16)
project("th-common-widgets.qt" VERSION 0.0.1 LANGUAGES CXX)

find_package(Qt6 REQUIRED COMPONENTS Widgets)

add_library(th-common-widgets-qt SHARED)
set_target_properties(th-common-widgets-qt PROPERTIES AUTOMOC ON)
set_target_properties(th-common-widgets-qt PROPERTIES
    WINDOWS_EXPORT_ALL_SYMBOLS ON
)
target_link_libraries(th-common-widgets-qt PUBLIC Qt6::Widgets)

target_sources(th-common-widgets-qt
        PRIVATE
        src/range-slider/range_slider.cc
        PUBLIC
        FILE_SET HEADERS
        BASE_DIRS include
        FILES include/th_common_widgets_qt/range_slider.h)

include(cmake/export.cmake)