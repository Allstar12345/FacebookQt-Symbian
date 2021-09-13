/****************************************************************************
** Meta object code from reading C++ file 'adresponse_p.h'
**
** Created: Thu 30. Apr 13:36:52 2015
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../AdAPI/adresponse_p.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'adresponse_p.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_AdAPI__AdResponse[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       0,    0, // properties
       1,   19, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      19,   18,   18,   18, 0x05,

 // enums: name, flags, count, data
      30, 0x0,    5,   23,

 // enum data: key, value
      37, uint(AdAPI::AdResponse::ReceiveAdHeader),
      53, uint(AdAPI::AdResponse::ReceiveAdContent),
      70, uint(AdAPI::AdResponse::Finished),
      79, uint(AdAPI::AdResponse::Canceled),
      88, uint(AdAPI::AdResponse::Error),

       0        // eod
};

static const char qt_meta_stringdata_AdAPI__AdResponse[] = {
    "AdAPI::AdResponse\0\0finished()\0Status\0"
    "ReceiveAdHeader\0ReceiveAdContent\0"
    "Finished\0Canceled\0Error\0"
};

const QMetaObject AdAPI::AdResponse::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_AdAPI__AdResponse,
      qt_meta_data_AdAPI__AdResponse, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &AdAPI::AdResponse::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *AdAPI::AdResponse::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *AdAPI::AdResponse::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_AdAPI__AdResponse))
        return static_cast<void*>(const_cast< AdResponse*>(this));
    return QObject::qt_metacast(_clname);
}

int AdAPI::AdResponse::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: finished(); break;
        default: ;
        }
        _id -= 1;
    }
    return _id;
}

// SIGNAL 0
void AdAPI::AdResponse::finished()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}
QT_END_MOC_NAMESPACE
