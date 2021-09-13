/****************************************************************************
** Meta object code from reading C++ file 'adcontainer_p.h'
**
** Created: Thu 30. Apr 13:36:51 2015
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../AdAPI/adcontainer_p.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'adcontainer_p.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_AdAPI__AdContainer[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       1,   19, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      20,   19,   19,   19, 0x05,

 // properties: name, type, flags
      44,   36, 0x41495001,

 // properties: notify_signal_id
       0,

       0        // eod
};

static const char qt_meta_stringdata_AdAPI__AdContainer[] = {
    "AdAPI::AdContainer\0\0pixmapChanged()\0"
    "QPixmap\0pixmap\0"
};

const QMetaObject AdAPI::AdContainer::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_AdAPI__AdContainer,
      qt_meta_data_AdAPI__AdContainer, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &AdAPI::AdContainer::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *AdAPI::AdContainer::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *AdAPI::AdContainer::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_AdAPI__AdContainer))
        return static_cast<void*>(const_cast< AdContainer*>(this));
    return QObject::qt_metacast(_clname);
}

int AdAPI::AdContainer::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: pixmapChanged(); break;
        default: ;
        }
        _id -= 1;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QPixmap*>(_v) = pixmap(); break;
        }
        _id -= 1;
    } else if (_c == QMetaObject::WriteProperty) {
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
void AdAPI::AdContainer::pixmapChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}
QT_END_MOC_NAMESPACE
