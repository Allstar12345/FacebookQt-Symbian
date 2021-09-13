#ifndef QMLUTILS_H
#define QMLUTILS_H

#include <QUrl>
#include <QDir>
#include <QFile>
#include <QtCore/QObject>
#ifdef Q_OS_SYMBIAN
#include <akndiscreetpopup.h>
#include <aknnotewrappers.h>
#endif

class QClipboard;
class QDeclarativeItem;
class QDeclarativeView;

class QMLUtils : public QObject
{
    Q_OBJECT
public:
    explicit QMLUtils(QDeclarativeView *view, QObject *parent = 0);
     Q_INVOKABLE void copyToClipboard(const QString &text);
    Q_INVOKABLE void minimizeApp() const;
   Q_INVOKABLE void fileio() const;
     Q_INVOKABLE QString saveImage(QDeclarativeItem *imageObject) const;

    Q_INVOKABLE void del()
    {
        QDir *myDir = new QDir;
        myDir->remove("C://data/.config/AsSoftware/FBQt.conf");
        qDebug("Removed 1");
        myDir->remove("E:/AllstarSoftware/FacebookQt/LocalStorage");
        myDir->remove("E:/AllstarSoftware/FacebookQt/IconDatabase/");
        myDir->remove("E:/AllstarSoftware/FacebookQt/OfflineStorage");
        myDir->remove("E:/AllstarSoftware/FacebookQt/WebStorage");
    }

    QMLUtils(QObject *parent = 0) : QObject(parent){ }
#ifdef Q_OS_SYMBIAN

    Q_INVOKABLE void longpopup_dynamic(const QString title, QString content){
        TPtrC16 stitle(reinterpret_cast<const TUint16*>(title.utf16()));
        TPtrC16 scontent(reinterpret_cast<const TUint16*>(content.utf16()));
        TRAP_IGNORE(CAknDiscreetPopup::ShowGlobalPopupL(stitle, scontent,KAknsIIDNone, KNullDesC, 0, 0, KAknDiscreetPopupDurationLong));
    }
    Q_INVOKABLE void shortpopup_dynamic(QString title, QString content){
        TPtrC16 stitle(reinterpret_cast<const TUint16*>(title.utf16()));
        TPtrC16 scontent(reinterpret_cast<const TUint16*>(content.utf16()));
        TRAP_IGNORE(CAknDiscreetPopup::ShowGlobalPopupL(stitle, scontent,KAknsIIDNone, KNullDesC));
    }
    Q_INVOKABLE void caKnLong(QString title){
        TPtrC16 stitle(reinterpret_cast<const TUint16*>(title.utf16()));
        TRAP_IGNORE(CAknDiscreetPopup::ShowGlobalPopupL(stitle, (_L("")),KAknsIIDNone, KNullDesC, 0, 0, KAknDiscreetPopupDurationLong));
    }

#endif

    Q_INVOKABLE void hideFromSight() const;
    Q_INVOKABLE void showToTask() const;

private:
    QDeclarativeView *m_view;
        QClipboard *clipboard;

};

#endif // QMLUTILS_H
