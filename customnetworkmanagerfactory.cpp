#include "customnetworkmanagerfactory.h"

CustomNetworkManagerFactory::CustomNetworkManagerFactory(QObject *parent) :
    QObject(parent)
{
// nothing to be done on the constructor
}

 /**
this is a virtual method we need to implement this method , most important step
we will create our custom QNetworkAccessManager here and return that
the second important thing we need to do here is to connect the sslErrors signal from QNetworkAccessManager to our own slot
which will ignore the sslErrors
*/
QNetworkAccessManager* CustomNetworkManagerFactory::create(QObject *parent)
{
    m_networkManager = new QNetworkAccessManager(this);
    connect(m_networkManager,SIGNAL(sslErrors(QNetworkReply*,QList<QSslError>)),this,SLOT(onIgnoreSSLErrors(QNetworkReply*,QList<QSslError>)));

    return m_networkManager;
}

/**
Our own slot which is connected to the sslErrors signal of QNetworkAccessManager
When this slot is called using the QNetworkReply object in the parameter we need to call ignoreSslErrors method of QNetworkReply
*/
void CustomNetworkManagerFactory::onIgnoreSSLErrors(QNetworkReply *reply, QList<QSslError> error)
{
    reply->ignoreSslErrors(error);
}
