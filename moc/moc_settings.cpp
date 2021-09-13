/****************************************************************************
** Meta object code from reading C++ file 'settings.h'
**
** Created: Mon 13. Sep 19:15:24 2021
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../settings.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'settings.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Setting[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: signature, parameters, type, tag, flags
      35,   17,    9,    8, 0x02,
      79,   69,    8,    8, 0x02,
     119,  114,    8,    8, 0x02,
     142,    8,    9,    8, 0x02,
     157,    8,    9,    8, 0x02,
     178,  114,    8,    8, 0x02,
     207,    8,    8,    8, 0x02,
     230,    8,  222,    8, 0x02,
     257,  252,    8,    8, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_Setting[] = {
    "Setting\0\0QString\0name,defaultValue\0"
    "getSystemSetting(QString,QString)\0"
    "name,data\0saveSystemSetting(QString,QString)\0"
    "data\0saveUserAgent(QString)\0getUserAgent()\0"
    "getCustomUserAgent()\0saveCustomUserAgent(QString)\0"
    "dropSettings()\0quint16\0getnetworkProxyPort()\0"
    "port\0setNetworkProxyPort(quint16)\0"
};

const QMetaObject Setting::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Setting,
      qt_meta_data_Setting, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Setting::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Setting::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Setting::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Setting))
        return static_cast<void*>(const_cast< Setting*>(this));
    return QObject::qt_metacast(_clname);
}

int Setting::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: { QString _r = getSystemSetting((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 1: saveSystemSetting((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 2: saveUserAgent((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: { QString _r = getUserAgent();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 4: { QString _r = getCustomUserAgent();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 5: saveCustomUserAgent((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 6: dropSettings(); break;
        case 7: { quint16 _r = getnetworkProxyPort();
            if (_a[0]) *reinterpret_cast< quint16*>(_a[0]) = _r; }  break;
        case 8: setNetworkProxyPort((*reinterpret_cast< quint16(*)>(_a[1]))); break;
        default: ;
        }
        _id -= 9;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
