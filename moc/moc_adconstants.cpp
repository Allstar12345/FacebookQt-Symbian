/****************************************************************************
** Meta object code from reading C++ file 'adconstants.h'
**
** Created: Thu 30. Apr 13:36:50 2015
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../AdAPI/adconstants.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'adconstants.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_AdAPI__AdConstants[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       1,   14, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // enums: name, flags, count, data
      19, 0x0,    4,   18,

 // enum data: key, value
      33, uint(AdAPI::AdConstants::Random),
      40, uint(AdAPI::AdConstants::Fade),
      45, uint(AdAPI::AdConstants::HSwitch),
      53, uint(AdAPI::AdConstants::VSwitch),

       0        // eod
};

static const char qt_meta_stringdata_AdAPI__AdConstants[] = {
    "AdAPI::AdConstants\0AnimationType\0"
    "Random\0Fade\0HSwitch\0VSwitch\0"
};

const QMetaObject AdAPI::AdConstants::staticMetaObject = {
    { 0, qt_meta_stringdata_AdAPI__AdConstants,
      qt_meta_data_AdAPI__AdConstants, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &AdAPI::AdConstants::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION
QT_END_MOC_NAMESPACE
