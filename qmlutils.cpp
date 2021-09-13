#include "qmlutils.h"
#include <QtCore/QDateTime>
#include <QtGui/QApplication>
#include <QtGui/QClipboard>
#include <QtGui/QImage>
#include <QtGui/QStyleOptionGraphicsItem>
#include <QtGui/QPainter>
#include <QtGui/QDesktopServices>
#include <QtDeclarative/QDeclarativeItem>
#include <QtDeclarative/QDeclarativeView>
#include <QtDeclarative/QDeclarativeEngine>
#include <QtNetwork/QNetworkAccessManager>
#include <QFile>
#include <QFileInfo>
#include <QFileDialog>
#include <QMessageBox>
#include <eikenv.h>
#include <eikappui.h>
#include <aknenv.h>
#include <aknappui.h>

static const QString IMAGE_SAVING_PATH ="E:/images";


QMLUtils::QMLUtils(QDeclarativeView *view, QObject *parent) :
    QObject(parent), m_view(view), clipboard(QApplication::clipboard())
{
}

QString QMLUtils::saveImage(QDeclarativeItem *imageObject) const
{

    QString fileName = "facebookqt" + QDateTime::currentDateTime().toString("d-M-yy_h-m-s") + ".png";
    QString filePath = IMAGE_SAVING_PATH + "/" + fileName;

    QImage img(imageObject->boundingRect().size().toSize(), QImage::Format_ARGB32);
    img.fill(QColor(0,0,0,0).rgba());
    QPainter painter(&img);
    QStyleOptionGraphicsItem styleOption;
    imageObject->paint(&painter, &styleOption, 0);
    bool saved = img.save(filePath, "PNG");

    if (!saved) {
        qWarning("QMLUtils::saveImage: Failed to save image to %s", qPrintable(filePath));
        return "";
    }

    return filePath;
}




void QMLUtils::copyToClipboard(const QString &text)
{
#ifdef Q_WS_SIMULATOR
    qDebug("Text copied to clipboard: %s", qPrintable(text));
#endif
    clipboard->setText(text, QClipboard::Clipboard);
    clipboard->setText(text, QClipboard::Selection);
}

void QMLUtils::minimizeApp() const
{
#ifdef Q_OS_SYMBIAN
    m_view->lower();
#else
    qWarning("QMLUtils::minimizeApp(): this function only works on Symbian");
#endif
}



void QMLUtils::hideFromSight() const{
    CAknAppUi* appUi = dynamic_cast<CAknAppUi*> (CEikonEnv::Static()->AppUi());
        TRAPD(error,
        if (appUi) {
              appUi->HideApplicationFromFSW(ETrue);
        }
        )
}
void QMLUtils::showToTask() const{
    CAknAppUi* appUi = dynamic_cast<CAknAppUi*> (CEikonEnv::Static()->AppUi());
        TRAPD(error,
        if (appUi) {
              appUi->HideApplicationFromFSW(EFalse);
        }
        )
}
void QMLUtils::fileio() const{
    QFile file("C://resource//apps//.txt"  );
       if (!file.open(QIODevice::WriteOnly | QIODevice::Append | QIODevice::Text))
           return;
     // QTextStream out(&file);
}

