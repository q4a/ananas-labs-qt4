include(../plugins/plugins.pri)
include(lib.pri)

QT += script
QT += scripttools


TARGET = ananas
TEMPLATE = lib 
shared:CONFIG += dll debug
unix:VERSION = 1.0.1

DESTDIR = ../../lib
DLLDESTDIR = ../../bin

INCLUDEPATH += ../lib ../plugins
LIBS += -L../../lib -lqdataschema

shared {
    win32:DEFINES += ANANAS_DLL
} else {
    win32:DEFINES += ANANAS_NO_DLL
}

win32 {
  CONFIG -= console
#  CONFIG += dll
}

unix{
    LIBS        +=  -L/usr/X11R6/lib/
}
win32 {
    #LIBS        += -L..\..\plugins -lananasplugin
}

include ( ../ananas.pri )

HEADERS = \
    acfg.h \
    acfgrc.h \
    acmanifest.h \
    acontainer.h \
    adataexchange.h \
    adatafield.h \
    aextension.h \
    aextensionplugin.h \
    aextensionfactory.h \
    afilter.h \
    alog.h \
    amenubar.h \
    amoney.h \
    ananas.h \
    ananasglobal.h \
    arole.h \
    aservice.h \
    asqlfield.h \
    asqltable.h \
    atests.h \
    atime.h \
    auser.h \
    rclistviewitem.h

SOURCES = \
    acfg.cpp \
    acfgrc.cpp \
    acmanifest.cpp \
    acontainer.cpp \
    adataexchange.cpp \
    adatafield.cpp \
    aextension.cpp \
    aextensionplugin.cpp \
    aextensionfactory.cpp \
    afilter.cpp \
    alog.cpp \
    amenubar.cpp \
    amoney.cpp \
    ananas.cpp \
    arole.cpp \
    aservice.cpp \
    asqlfield.cpp \
    asqltable.cpp \
    atests.cpp \
    atime.cpp \
    auser.cpp \
    rclistviewitem.cpp

#FORMS = \
#    deditrc.ui \
#    dhelpcfgform.ui \
#    dlogin.ui \
#    dselectdb.ui
    
RESOURCES += \
    lib.qrc

TRANSLATIONS = \
    ../../translations/ananas-lib-en.ts \
    ../../translations/ananas-lib-ru.ts 
    
unix{
    target.path = /$(LIBDIR)
    alibheader.path = /$(INCLUDEDIR)
    alibheader.files = $$HEADERS
    alibheader.files += .ui/*h
    }

win32 {
    alib.path = $$(QTDIR)\lib
    alib.files += ananas.dll
    alib.files += ananas.lib
#    alibheader.path = $(INCLUDEDIR)
#    alibheader.files = $$HEADERS
#    alibheader.files += tmp\ui\*h
    INSTALLS += alib
}

unix{
    INSTALLS += target
    INSTALLS += alibheader
}

include(metadata/metadata.pri)
include(dialogs/dialogs.pri)
include(objects/objects.pri)
include(widgets/widgets.pri)
include(report/report.pri)
include(sys/sys.pri)
