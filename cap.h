#include <QtGui/QPixmap>

class Capturer : public QObject
{

public:
    explicit Capturer(QObject *parent = 0);
    Q_INVOKABLE void save(QDeclarativeItem *obj);
};

void Capturer::save(QDeclarativeItem *item)
{
    QPixmap pix(item->width(), item->height());
    QPainter painter(&pix);
   // QStyleOptionGraphicsItem option;
   // item->paint(&painter, &option, NULL);
    pix.save("/path/to/output.png");
}
