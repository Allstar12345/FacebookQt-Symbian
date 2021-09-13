/********************************************************************************
** Form generated from reading UI file 'landingpage.ui'
**
** Created: Thu 30. Apr 13:36:51 2015
**      by: Qt User Interface Compiler version 4.7.4
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_LANDINGPAGE_H
#define UI_LANDINGPAGE_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QTextBrowser>
#include <QtGui/QVBoxLayout>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_LandingPage
{
public:
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout;
    QPushButton *backButton;
    QSpacerItem *horizontalSpacer;
    QTextBrowser *textBrowser;

    void setupUi(QWidget *LandingPage)
    {
        if (LandingPage->objectName().isEmpty())
            LandingPage->setObjectName(QString::fromUtf8("LandingPage"));
        LandingPage->resize(360, 469);
        verticalLayout = new QVBoxLayout(LandingPage);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        backButton = new QPushButton(LandingPage);
        backButton->setObjectName(QString::fromUtf8("backButton"));

        horizontalLayout->addWidget(backButton);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);


        verticalLayout->addLayout(horizontalLayout);

        textBrowser = new QTextBrowser(LandingPage);
        textBrowser->setObjectName(QString::fromUtf8("textBrowser"));
        textBrowser->setTextInteractionFlags(Qt::NoTextInteraction);

        verticalLayout->addWidget(textBrowser);


        retranslateUi(LandingPage);

        QMetaObject::connectSlotsByName(LandingPage);
    } // setupUi

    void retranslateUi(QWidget *LandingPage)
    {
        LandingPage->setWindowTitle(QApplication::translate("LandingPage", "Form", 0, QApplication::UnicodeUTF8));
        backButton->setText(QApplication::translate("LandingPage", "Back", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class LandingPage: public Ui_LandingPage {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_LANDINGPAGE_H
