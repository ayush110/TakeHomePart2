cmake_minimum_required(VERSION 3.16)

project(Part2 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Multimedia)

qt_standard_project_setup()

qt_add_executable(appPart2
    main.cpp
)

qt_add_qml_module(appPart2
    URI Part2
    VERSION 1.0
    QML_FILES Main.qml VideoPopup.qml BasicCarInfo.qml IconTextItem.qml

    RESOURCES
    assets/images/car-image.png

    assets/videos/car-video2.mp4
    assets/images//battery.png
    assets/images/temperature.png
    assets/images/5080477.png
    assets/data/history.json

    SOURCES videopopup.h videopopup.cpp
    SOURCES servicehistory.h servicehistory.cpp
    QML_FILES ServiceHistory.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appPart2 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appPart2
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appPart2
    PRIVATE Qt6::Quick Qt6::Multimedia
)

include(GNUInstallDirs)
install(TARGETS appPart2
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
