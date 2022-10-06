QT += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17
CONFIG -= debug_and_release debug_and_release_target

CONFIG(debug, debug|release) {
    BUILD_FLAG = debug
} else {
    BUILD_FLAG = release
}

TARGET = s57parser

PROJECT_BUILD_PATH = $$PWD/build/$$BUILD_FLAG
PROJECT_INCLUDE_PATH = $$PWD/include
PROJECT_SOURCE_PATH = $$PWD/src
PROJECT_VENDOR_PATH = $$PWD/vendor
PROJECT_UI_PATH = $$PWD/ui

PROJECT_INTERMEDIATE_PATH = $$PROJECT_BUILD_PATH/intermediate
RCC_DIR = $$PROJECT_INTERMEDIATE_PATH/rcc/
MOC_DIR = $$PROJECT_INTERMEDIATE_PATH/moc/
OBJECTS_DIR = $$PROJECT_INTERMEDIATE_PATH/obj/

UI_DIR = $$PROJECT_INCLUDE_PATH/view/
DESTDIR = $$PROJECT_BUILD_PATH/

GDAL_ROOT_PATH = $$PROJECT_VENDOR_PATH/gdal-3.5.2
GDAL_INCLUDE_PATH = $$GDAL_ROOT_PATH/include
GDAL_LIB_PATH = $$GDAL_ROOT_PATH/lib

LIBS += -L$$GDAL_LIB_PATH/
LIBS += -lgdal_i

INCLUDEPATH += $$PROJECT_INCLUDE_PATH
INCLUDEPATH += $$PROJECT_INCLUDE_PATH/model/
INCLUDEPATH += $$PROJECT_INCLUDE_PATH/view/
INCLUDEPATH += $$PROJECT_INCLUDE_PATH/service/

INCLUDEPATH += $$GDAL_INCLUDE_PATH

DEPENDPATH += $$GDAL_INCLUDE_PATH

SOURCES += \
    $$PROJECT_SOURCE_PATH/main.cpp \
    $$PROJECT_SOURCE_PATH/view/mainwindow.cpp \
    $$PROJECT_SOURCE_PATH/view/logger.cpp \
    $$PROJECT_SOURCE_PATH/model/model.cpp \
    $$PROJECT_SOURCE_PATH/service/gdal_manager.cpp \
    $$PROJECT_SOURCE_PATH/service/s57_parser.cpp

HEADERS += \
    $$PROJECT_INCLUDE_PATH/view/mainwindow.h \
    $$PROJECT_INCLUDE_PATH/view/logger.h \
    $$PROJECT_INCLUDE_PATH/model/model.h \
    $$PROJECT_INCLUDE_PATH/service/gdal_manager.h \
    $$PROJECT_INCLUDE_PATH/service/s57_parser.h

FORMS += \
    $$PROJECT_UI_PATH/mainwindow.ui

DISTFILES += \
    .gitignore \
    README.md