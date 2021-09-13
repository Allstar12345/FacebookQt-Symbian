#include "settings.h"
#include <QSettings>
#include <Qstring>
#include <QDebug>

Setting::Setting(QObject *parent):
 QObject(parent)
{
}

void Setting::dropSettings(){
    QSettings settings("C:/data/.config/AllstarSoftware/FacebookQtSystem.ini", QSettings::IniFormat);
    settings.remove("");
}

QString Setting::getSystemSetting(QString name, QString defaultValue){
    QSettings settings("C:/data/.config/AllstarSoftware/FacebookQtSystem.ini", QSettings::IniFormat);
    return settings.value(name, defaultValue).toString();
}
void Setting::saveSystemSetting(QString name,QString data){
     QSettings settings("C:/data/.config/AllstarSoftware/FacebookQtSystem.ini", QSettings::IniFormat);
     settings.setValue(name, data);
}

QString Setting::getUserAgent(){
    QSettings settings("C:/data/.config/AllstarSoftware/FacebookQtSystem.ini", QSettings::IniFormat);
    return settings.value("useragent", "Default").toString();
}
 void Setting::saveUserAgent(QString data){
     QSettings settings("C:/data/.config/AllstarSoftware/FacebookQtSystem.ini", QSettings::IniFormat);
     settings.setValue("useragent", data);
 }
 QString Setting::getCustomUserAgent(){
     QSettings settings("C:/data/.config/AllstarSoftware/FacebookQtSystem.ini", QSettings::IniFormat);
     return settings.value("useragentcustomstring", "").toString();
 }
 void Setting::saveCustomUserAgent(QString data){
     QSettings settings("C:/data/.config/AllstarSoftware/FacebookQtSystem.ini", QSettings::IniFormat);
     settings.setValue("useragentcustomstring", data);
 }
 void Setting::setNetworkProxyPort(quint16 port) {
     QSettings settings("C:/data/.config/AllstarSoftware/StarBrowserSystem.ini", QSettings::IniFormat);
      settings.setValue("proxyPort", port);
 }
 quint16 Setting::getnetworkProxyPort() const {
        QSettings settings("C:/data/.config/AllstarSoftware/StarBrowserSystem.ini", QSettings::IniFormat);
     return settings.value("proxyPort", 80).toLongLong();
 }


