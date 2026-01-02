cmake_minimum_required(VERSION 3.16)
project("th-common-widgets.qt" VERSION 0.0.1 LANGUAGES CXX)

find_package(Qt6 REQUIRED COMPONENTS Widgets)

add_library(th-common-widgets-qt src/range-slider/range_slider.cc
        include/th_common_widgets_qt/range_slider.h)

set_target_properties(th-common-widgets-qt PROPERTIES AUTOMOC ON)
target_link_libraries(th-common-widgets-qt PUBLIC Qt6::Widgets)

target_include_directories(th-common-widgets-qt
        PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)
