#uncomment the 2 lines below to see .qml files, recomment when compiling


#folder_01.source = qml/FacebookTouchQt
#folder_01.target = qml

DEPLOYMENTFOLDERS = folder_01



symbian:TARGET.UID3 = 0xE0324339
#symbian:TARGET.UID3 = 0x2006c2ec

symbian {
    TARGET.CAPABILITY += NetworkServices WriteUserData Location
VERSION = 1.95

TARGET.EPOCHEAPSIZE = 0x50000 0x9000000
    LIBS += -L\epoc32\release\armv5\lib -lremconcoreapi
    LIBS += -L\epoc32\release\armv5\lib -lremconinterfacebase
LIBS += -letel3rdparty \
            -lapgrfx \
              -lfeatdiscovery \
              -lws32 \
             -lsysutil \
              -lefsrv \
               -lavkon\
               -lhal \
               -lapparc\
           -lCommonDialogs\
          -lPlatformEnv\
-leikcore\
-lMgFetch\
-lbafl


LIBS += -lhswidgetpublisher
LIBS += -lapgrfx -lcone -lws32
#Libs for CFbsBimap
LIBS += -lbitgdi -lfbscli -laknskins -laknskinsrv -leikcore


    my_deployment.pkg_prerules += vendorinfo

CONFIG += qt-components

    DEPLOYMENT += my_deployment

    vendorinfo += "%{\"Allstar Software\"}" ":\"Allstar Software\""

    DEPLOYMENT.display_name += Facebook Qt

QT += network
QT += webkit
}


CONFIG += qt-components
CONFIG += mobility
MOBILITY += systeminfo

SOURCES += main.cpp \
    networkaccessmanagerinteractor.cpp \
    qmlutils.cpp \
    qdeclarativewebview.cpp \
    mediakeysobserver.cpp\
    screenclass.cpp \
    useragent.cpp \
    settings.cpp

HEADERS += \
    networkaccessmanagerinteractor.h \
    qmlutils.h \
   mediakeysobserver.h \
    qdeclarativewebview.h\
    screenclass.h \
    cap.h \
    useragent.h \
    settings.h


# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

RESOURCES += \
    symbian-res.qrc

gccOption = "OPTION gcce -fpermissive" MMP_RULES += gccOption
