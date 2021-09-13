#ifndef SETTING_H
#define SETTING_H

#include <QtCore/QObject>
#include <QtGui/QApplication>


class Setting : public QObject
{
    Q_OBJECT
public:
    explicit Setting(QObject *parent = 0);
   Q_INVOKABLE static QString getSystemSetting(QString name, QString defaultValue);
    Q_INVOKABLE void saveSystemSetting(QString name, QString data);
    Q_INVOKABLE void saveUserAgent(QString data);
    Q_INVOKABLE QString getUserAgent();
    Q_INVOKABLE QString getCustomUserAgent();
    Q_INVOKABLE void saveCustomUserAgent(QString data);
    Q_INVOKABLE void dropSettings();
    Q_INVOKABLE quint16 getnetworkProxyPort() const;
    Q_INVOKABLE void setNetworkProxyPort(quint16 port);

};

#endif
