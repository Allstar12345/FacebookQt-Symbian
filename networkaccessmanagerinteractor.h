#ifndef NETWORKACCESSMANAGERINTERACTOR_H
#define NETWORKACCESSMANAGERINTERACTOR_H

#include <QObject>
#include <QDeclarativeEngine>
#include <QtNetwork/QNetworkAccessManager>
#include <QtNetwork/QNetworkCookieJar>
#include <QDebug>

class NetworkAccessManagerInteractor : public QObject
{
    Q_OBJECT
public:
    explicit NetworkAccessManagerInteractor(QDeclarativeEngine *declarativeEngine, QObject *parent = 0);
public slots:
    Q_INVOKABLE void clearCookies();

private:
    QDeclarativeEngine* m_declarativeEngine;

};

#endif // NETWORKACCESSMANAGERINTERACTOR_H
