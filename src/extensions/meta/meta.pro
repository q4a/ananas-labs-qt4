include(../../lib/lib.pri)
TARGET    = aext_meta
SOURCES	+= aext_meta.cpp 
HEADERS	+= aext_meta.h 
include ( ../../ananas.pri )
shared {
win32:DEFINES+= ANANAS_DLL
} else {
win32:DEFINES   += ANANAS_NO_DLL
}
TEMPLATE	=lib
LIBS	+= -L../../../lib -lananas
CONFIG		+= plugin
INCLUDEPATH	+= ../../lib 
LANGUAGE	= C++
win32:DESTDIR = ..

unix{
        target.path = $$(LIBDIR)/ananas
#        libmeta.files = libaext_meta.so
        INSTALLS += libmeta
}

