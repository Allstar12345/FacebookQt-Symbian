/****************************************************************************
** Meta object code from reading C++ file 'aditem.h'
**
** Created: Thu 30. Apr 13:36:50 2015
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../AdAPI/aditem.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'aditem.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_AdAPI__AdItem[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
      11,   14, // methods
       7,   69, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: signature, parameters, type, tag, flags
      25,   15,   14,   14, 0x05,
      48,   14,   14,   14, 0x05,
      65,   14,   14,   14, 0x05,

 // slots: signature, parameters, type, tag, flags
      77,   14,   14,   14, 0x0a,
      89,   14,   14,   14, 0x0a,
     107,   14,   14,   14, 0x0a,
     134,  125,   14,   14, 0x08,
     163,   14,   14,   14, 0x08,
     183,   14,   14,   14, 0x08,

 // methods: signature, parameters, type, tag, flags
     204,   14,  196,   14, 0x02,
     223,   14,  218,   14, 0x02,

 // properties: name, type, flags
     244,  237, 0x06095103,
     285,  251, 0x0009510b,
     318,  299, 0x0009510b,
     327,  218, 0x01095103,
     335,  218, 0x01095103,
     349,  218, 0x01095103,
     368,  218, 0x01095103,

       0        // eod
};

static const char qt_meta_stringdata_AdAPI__AdItem[] = {
    "AdAPI::AdItem\0\0errorCode\0"
    "comunicationError(int)\0newAdAvailable()\0"
    "adClicked()\0loadNewAd()\0displayCachedAd()\0"
    "openLandingPage()\0response\0"
    "finished(AdAPI::AdResponse*)\0"
    "animationFinished()\0updateItem()\0"
    "QString\0errorString()\0bool\0hasCachedAd()\0"
    "double\0factor\0AdAPI::AdConstants::AnimationType\0"
    "animationType\0AdAPI::AdUserData*\0"
    "userData\0autoGPS\0autoReloadAds\0"
    "autoReloadInterval\0autoShowNewAds\0"
};

#ifdef Q_NO_DATA_RELOCATION
static const QMetaObjectAccessor qt_meta_extradata_AdAPI__AdItem[] = {
        AdAPI::AdConstants::getStaticMetaObject,
#else
static const QMetaObject *qt_meta_extradata_AdAPI__AdItem[] = {
        &AdAPI::AdConstants::staticMetaObject,
#endif //Q_NO_DATA_RELOCATION
    0
};

static const QMetaObjectExtraData qt_meta_extradata2_AdAPI__AdItem = {
    qt_meta_extradata_AdAPI__AdItem, 0 
};

const QMetaObject AdAPI::AdItem::staticMetaObject = {
    { &QDeclarativeItem::staticMetaObject, qt_meta_stringdata_AdAPI__AdItem,
      qt_meta_data_AdAPI__AdItem, &qt_meta_extradata2_AdAPI__AdItem }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &AdAPI::AdItem::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *AdAPI::AdItem::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *AdAPI::AdItem::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_AdAPI__AdItem))
        return static_cast<void*>(const_cast< AdItem*>(this));
    return QDeclarativeItem::qt_metacast(_clname);
}

int AdAPI::AdItem::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDeclarativeItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: comunicationError((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 1: newAdAvailable(); break;
        case 2: adClicked(); break;
        case 3: loadNewAd(); break;
        case 4: displayCachedAd(); break;
        case 5: openLandingPage(); break;
        case 6: finished((*reinterpret_cast< AdAPI::AdResponse*(*)>(_a[1]))); break;
        case 7: animationFinished(); break;
        case 8: updateItem(); break;
        case 9: { QString _r = errorString();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 10: { bool _r = hasCachedAd();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        default: ;
        }
        _id -= 11;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< double*>(_v) = factor(); break;
        case 1: *reinterpret_cast< AdAPI::AdConstants::AnimationType*>(_v) = animationType(); break;
        case 2: *reinterpret_cast< AdAPI::AdUserData**>(_v) = userData(); break;
        case 3: *reinterpret_cast< bool*>(_v) = autoGPS(); break;
        case 4: *reinterpret_cast< bool*>(_v) = autoReloadAds(); break;
        case 5: *reinterpret_cast< bool*>(_v) = autoReloadInterval(); break;
        case 6: *reinterpret_cast< bool*>(_v) = autoShowNewAds(); break;
        }
        _id -= 7;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setFactor(*reinterpret_cast< double*>(_v)); break;
        case 1: setAnimationType(*reinterpret_cast< AdAPI::AdConstants::AnimationType*>(_v)); break;
        case 2: setUserData(*reinterpret_cast< AdAPI::AdUserData**>(_v)); break;
        case 3: setAutoGPS(*reinterpret_cast< bool*>(_v)); break;
        case 4: setAutoReloadAds(*reinterpret_cast< bool*>(_v)); break;
        case 5: setAutoReloadInterval(*reinterpret_cast< bool*>(_v)); break;
        case 6: setAutoShowNewAds(*reinterpret_cast< bool*>(_v)); break;
        }
        _id -= 7;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 7;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void AdAPI::AdItem::comunicationError(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void AdAPI::AdItem::newAdAvailable()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void AdAPI::AdItem::adClicked()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}
QT_END_MOC_NAMESPACE
