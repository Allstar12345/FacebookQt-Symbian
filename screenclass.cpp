#include "screenclass.h"

ScreenClass::ScreenClass(QDeclarativeView *currentView){
    this->currentView = currentView;
}
void ScreenClass::capture(){
    QPixmap::grabWidget(currentView).save("E:/Images/" +  QDateTime::currentDateTime().toString("d-M-yy_h-m-s") +"FacebookQt" + ".png");
    qDebug("Screen Captured");
}
