/****************************************************************************
** Meta object code from reading C++ file 'httpcomunicator_p.h'
**
** Created: Thu 30. Apr 13:36:50 2015
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../AdAPI/httpcomunicator_p.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'httpcomunicator_p.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_AdAPI__HttpComunicator[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: signature, parameters, type, tag, flags
      35,   24,   23,   23, 0x05,
      74,   64,   23,   23, 0x05,

 // slots: signature, parameters, type, tag, flags
     103,   97,   23,   23, 0x08,
     135,  128,   23,   23, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_AdAPI__HttpComunicator[] = {
    "AdAPI::HttpComunicator\0\0adResponse\0"
    "finished(AdAPI::AdResponse*)\0errorCode\0"
    "comunicationError(int)\0reply\0"
    "finished(QNetworkReply*)\0object\0"
    "timeout(QObject*)\0"
};

const QMetaObject AdAPI::HttpComunicator::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_AdAPI__HttpComunicator,
      qt_meta_data_AdAPI__HttpComunicator, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &AdAPI::HttpComunicator::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *AdAPI::HttpComunicator::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *AdAPI::HttpComunicator::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_AdAPI__HttpComunicator))
        return static_cast<void*>(const_cast< HttpComunicator*>(this));
    return QObject::qt_metacast(_clname);
}

int AdAPI::HttpComunicator::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: finished((*reinterpret_cast< AdAPI::AdResponse*(*)>(_a[1]))); break;
        case 1: comunicationError((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: finished((*reinterpret_cast< QNetworkReply*(*)>(_a[1]))); break;
        case 3: timeout((*reinterpret_cast< QObject*(*)>(_a[1]))); break;
        default: ;
        }
        _id -= 4;
    }
    return _id;
}

// SIGNAL 0
void AdAPI::HttpComunicator::finished(AdAPI::AdResponse * _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void AdAPI::HttpComunicator::comunicationError(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_END_MOC_NAMESPACE
