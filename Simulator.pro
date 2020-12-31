QT       += core gui widgets

CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS \
            M_PI=3.1415926535

QMAKE_CXXFLAGS += /utf-8

SOURCES += \
    delegate/ConfigurationDelegate.cpp \
    delegate/ConfigurationModel.cpp \
    dock/CustomDockTabBar.cpp \
    dock/CustomDockTabBarPushButton.cpp \
    dock/CustomDockWidget.cpp \
    dock/CustomDockWidgetBar.cpp \
    main.cpp \
    mainwindow.cpp \
    occWidget.cpp \
    robotics/RLAPI_PlanThread.cpp \
    robotics/RLAPI_Reader.cpp \
    robotics/RLAPI_Writer.cpp \
    robotics/RLConvertAPI.cpp

HEADERS += \
    delegate/ConfigurationDelegate.h \
    delegate/ConfigurationModel.h \
    dock/CustomDockTabBar.h \
    dock/CustomDockTabBarPushButton.h \
    dock/CustomDockWidget.h \
    dock/CustomDockWidgetBar.h \
    mainwindow.h \
    occWidget.h \
    robotics/RLAPI_ConfigurationOptimizer.h \
    robotics/RLAPI_PlanThread.h \
    robotics/RLAPI_Reader.h \
    robotics/RLAPI_Writer.h \
    robotics/RLConvertAPI.h

FORMS += \
    mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    res.qrc

INCLUDEPATH += D:/OpenCASCADE/inc
LIBS += D:\OpenCASCADE\lib\*.lib
CONFIG(debug, debug|release) {
    INCLUDEPATH += D:/RoboticsLibrary/Debug/include
    LIBS += -LD:\RoboticsLibrary\Debug\lib
    LIBS += -lrlsgsd -lrlmdlsd -lrlplansd -llibxml2d -llibxsltd -lPQPd -lrlkinsd
} else {
    INCLUDEPATH += D:/RoboticsLibrary/Release/include
    LIBS += -LD:\RoboticsLibrary\Release\lib
    LIBS += -lrlsgs -lrlmdls -lrlplans -llibxml2 -llibxslt -lPQP -lrlkins
}

CONFIG(debug, debug|release) {
    TARGET = Simulatord
} else {
    TARGET = Simulator
}

DESTDIR  = $$PWD\bin
