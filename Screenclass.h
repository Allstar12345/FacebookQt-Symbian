#ifndef SCRENCLASS_H
#define SCRENCLASS_H

#include <QDebug>
#include <QPixmap>
#include <QDir>
 #include <QDeclarativeView>

class ScreenClass : public QObject
{

public:
    ScreenClass(QDeclarativeView* currentView);

    Q_OBJECT public: Q_INVOKABLE void capture();

private:
    QDeclarativeView* currentView;
};

#endif // SCRENCLASS_H
