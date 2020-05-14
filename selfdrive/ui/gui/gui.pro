QT += quick

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp

RESOURCES += \
    rc.qrc

TRANSLATIONS += \
    gui_en_US.ts

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

android {
    LIBS += -L$$PWD/../../../phonelibs/zmq/aarch64/lib/ -lzmq
    INCLUDEPATH += $$PWD/../../../phonelibs/zmq/include
    DEPENDPATH += $$PWD/../../../phonelibs/zmq/include
    ANDROID_EXTRA_LIBS += $$PWD/../../../phonelibs/zmq/aarch64/lib/libzmq.so
    ANDROID_EXTRA_LIBS += $$PWD/../../../phonelibs/zmq/aarch64/lib/libczmq.so
    ANDROID_EXTRA_LIBS += $$PWD/../../../phonelibs/zmq/aarch64/lib/libgnustl_shared.so

#    LIBS += -L$$PWD/../../../cereal/ -lcereal_shared -lmessaging_shared
#    LIBS += -L$$PWD/android/libs/arm64-v8a/ -lcapnp_c
#    INCLUDEPATH += $$PWD/../../../cereal/messaging
#    DEPENDPATH += $$PWD/../../../cereal/messaging
#    ANDROID_EXTRA_LIBS += $$PWD/../../../cereal/libcereal_shared.so
#    ANDROID_EXTRA_LIBS += $$PWD/../../../cereal/libmessaging_shared.so
}

HEADERS +=
