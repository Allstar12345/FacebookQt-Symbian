/****************************************************************************
** Meta object code from reading C++ file 'addownloader_p.h'
**
** Created: Thu 30. Apr 13:36:50 2015
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../AdAPI/addownloader_p.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'addownloader_p.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_AdAPI__AdDownloader[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       1,   24, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      30,   21,   20,   20, 0x05,

 // slots: signature, parameters, type, tag, flags
      66,   59,   20,   20, 0x08,

 // properties: name, type, flags
     105,  100, 0x01095103,

       0        // eod
};

static const char qt_meta_stringdata_AdAPI__AdDownloader[] = {
    "AdAPI::AdDownloader\0\0response\0"
    "finished(AdAPI::AdResponse*)\0update\0"
    "positionUpdated(QGeoPositionInfo)\0"
    "bool\0autoGPS\0"
};

const QMetaObject AdAPI::AdDownloader::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_AdAPI__AdDownloader,
      qt_meta_data_AdAPI__AdDownloader, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &AdAPI::AdDownloader::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *AdAPI::AdDownloader::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *AdAPI::AdDownloader::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_AdAPI__AdDownloader))
        return static_cast<void*>(const_cast< AdDownloader*>(this));
    return QObject::qt_metacast(_clname);
}

int AdAPI::AdDownloader::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: finished((*reinterpret_cast< AdAPI::AdResponse*(*)>(_a[1]))); break;
        case 1: positionUpdated((*reinterpret_cast< const QGeoPositionInfo(*)>(_a[1]))); break;
        default: ;
        }
        _id -= 2;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bool*>(_v) = autoGPS(); break;
        }
        _id -= 1;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setAutoGPS(*reinterpret_cast< bool*>(_v)); break;
        }
        _id -= 1;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 1;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void AdAPI::AdDownloader::finished(AdAPI::AdResponse * _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
