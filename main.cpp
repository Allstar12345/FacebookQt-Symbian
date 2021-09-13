#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include <QtGui/QPixmap>
#include <QDeclarativeProperty>
#include <QWebSettings>
#include <QSettings>
#include <QDir>
#include <QDebug>
#include <QObject>
#include <QtGui/QSplashScreen>
#include <QtGui/QPixmap>
#include <QtNetwork/QNetworkAccessManager>
#include <QtNetwork/QNetworkCookieJar>
#include <QtNetwork/QNetworkDiskCache>
#include <QtDeclarative/QDeclarativeContext>
#include <QtDeclarative/QDeclarativeNetworkAccessManagerFactory>
#include <QtDeclarative/QDeclarativeEngine>
#include <QMutex>
#include <QMutexLocker>
#include "networkaccessmanagerinteractor.h"
#include <QtDeclarative/qdeclarative.h>
#include <QtDeclarative/qdeclarativeextensionplugin.h>
#include "qmlutils.h"
#include "mediakeysobserver.h"
#include "qdeclarativewebview.h"
#include "customnetworkmanagerfactory.h"
#include "screenclass.h"
#include "settings.h"
#include "useragent.h"
#include <QNetworkProxy>



class PersistentCookieJar : public QNetworkCookieJar {
public:
    PersistentCookieJar(QObject *parent) : QNetworkCookieJar(parent) { load(); }
    ~PersistentCookieJar() { save(); }

    virtual QList<QNetworkCookie> cookiesForUrl(const QUrl &url) const
    {
        QMutexLocker lock(&mutex);
        return QNetworkCookieJar::cookiesForUrl(url);
    }

    virtual bool setCookiesFromUrl(const QList<QNetworkCookie> &cookieList, const QUrl &url)
    {
        QMutexLocker lock(&mutex);
        return QNetworkCookieJar::setCookiesFromUrl(cookieList, url);
    }

private:
    void save()
    {
        QMutexLocker lock(&mutex);
        QList<QNetworkCookie> list = allCookies();
        QByteArray data;
        foreach (QNetworkCookie cookie, list) {
            if (!cookie.isSessionCookie()) {
                data.append(cookie.toRawForm());
                data.append("\n");
            }
        }
        QSettings settings("AsSoftware", "FBQt");
        settings.setValue("Cookies",data);
    }

    void load()
    {
        QMutexLocker lock(&mutex);
        QSettings settings("AsSoftware", "FBQt");
        QByteArray data = settings.value("Cookies").toByteArray();
        setAllCookies(QNetworkCookie::parseCookies(data));
    }

    mutable QMutex mutex;
};

class NetworkAccessManagerFactory : public QDeclarativeNetworkAccessManagerFactory
{
public:
    NetworkAccessManagerFactory() {}
    ~NetworkAccessManagerFactory() {}

    QNetworkAccessManager *create(QObject *parent);
    static PersistentCookieJar *cookieJar;
    QMutex mutex;
};

PersistentCookieJar *NetworkAccessManagerFactory::cookieJar = 0;

static void cleanup_cookieJar()
{
    delete NetworkAccessManagerFactory::cookieJar;
    NetworkAccessManagerFactory::cookieJar = 0;
}

QNetworkAccessManager *NetworkAccessManagerFactory::create(QObject *parent)
{
    QMutexLocker lock(&mutex);
    QNetworkAccessManager *manager = new QNetworkAccessManager(parent);
    if (!cookieJar) {
        qAddPostRoutine(cleanup_cookieJar);
        cookieJar = new PersistentCookieJar(0);
    }
    manager->setCookieJar(cookieJar);
    cookieJar->setParent(0);


    QNetworkDiskCache *cache = new QNetworkDiskCache;
    cache->setCacheDirectory(QDir::tempPath()+QLatin1String("/qml-webview-network-cache-fbtouchqtfull"));
    cache->setMaximumCacheSize(500000);
    manager->setCache(cache);

    qDebug() << "created new network access manager for" << parent;
    return manager;
}
Setting* set = new Setting;

int main(int argc, char **argv)

{

    if(set->getSystemSetting("proxyEnabled", "false")== "true"){
     QNetworkProxy proxy;
     proxy.setType(QNetworkProxy::HttpProxy);
     proxy.setHostName(set->getSystemSetting("proxyHostName", ""));
     proxy.setPort(set->getnetworkProxyPort());
     proxy.setUser(set->getSystemSetting("proxyUser", ""));
     proxy.setPassword(set->getSystemSetting("proxyPassword", "null"));
     QNetworkProxy::setApplicationProxy(proxy);
     delete set;
    }
QCoreApplication::setAttribute(Qt::AA_S60DisablePartialScreenInputMode, false);


    QApplication app(argc, argv);
    QSplashScreen *splash = new QSplashScreen(QPixmap(":/splash/splash.png"));
    splash->showMessage(QSplashScreen::tr("Allstar Software \nFacebook Qt v1.95 EOL"), Qt::AlignHCenter | Qt::AlignBottom, Qt::white);
    splash->show();
    QWebSettings::enablePersistentStorage();
    app.setApplicationName("Mozilla/5.0 (iPhone; U; CPU iPhone OS 7_03 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) FacebookQt /4.0 Mobile/7A341 Safari/528.16");
    app.setOrganizationName("Allstar Software");

    QDeclarativeView view;
    UserAgent userAgent;
    view.rootContext()->setContextProperty("UserAgent", &userAgent);
    ScreenClass screenClass(&view);
           view.rootContext()->setContextProperty("screenObject", &screenClass);
    qmlRegisterType<QDeclarativeWebSettings>();
    qmlRegisterType<Setting> ("AppSettings", 1, 0, "AppSettings");
    qmlRegisterType<QDeclarativeWebView>("WebViewCustom", 1, 0, "WebViewCustom");
    qmlRegisterType<MediaKeysObserver>("MediaKeysObserver", 1, 0, "MediaKeysObserver");
    view.setAttribute(Qt::WA_OpaquePaintEvent);
    view.setAttribute(Qt::WA_NoSystemBackground);
    view.viewport()->setAttribute(Qt::WA_OpaquePaintEvent);
    view.viewport()->setAttribute(Qt::WA_NoSystemBackground);
    NetworkAccessManagerFactory *namFactory = new NetworkAccessManagerFactory;
    view.engine()->setNetworkAccessManagerFactory(namFactory);


    NetworkAccessManagerInteractor* nami = new NetworkAccessManagerInteractor(view.engine(), &view);
        view.rootContext()->setContextProperty("nami", nami);

   QMLUtils qmlUtils(&view);
         view.rootContext()->setContextProperty("QMLUtils", &qmlUtils);
view.setProperty("orientationMethod", 1);
    view.setSource(QUrl("qrc:/qml/FacebookTouchQt/main.qml"));
    view.showFullScreen();


    splash->finish(&view);
    splash->deleteLater();
    return app.exec();

}





