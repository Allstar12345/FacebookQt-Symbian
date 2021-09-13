import QtQuick 1.1
import com.nokia.symbian 1.1
import "Component"

Rectangle {
    anchors.fill: parent
    color: platformInverted? "white": "black"
    id: mainpage

Component.onCompleted: {
   flick.opacity=1;
}
QtObject { id: creator; property Component com: null;function createComponent (qmlfile){com = Qt.createComponent(qmlfile);com.createObject(mainpage)} }

function exit(){
creator.createComponent("ExitDialog.qml")
}

function fullscreen(){
  creator.createComponent("FullscreenPopup.qml")
}

function normal(){
 creator.createComponent("NormalPopup.qml")
}

    ListHead {
    smooth: true
    id: head
    text: "Facebook Qt"
    z: 2
    }
    Flickable{
        Behavior on opacity {NumberAnimation{duration: 200}}
        id: flick
        opacity: 0
        contentHeight: rect1.height *6 + head.height
        contentWidth: parent.width
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.top: head.bottom
        anchors.topMargin: 3

        Rectangle{
            id: rect1
            Behavior on color { ColorAnimation { duration: 80 } }
            color: mouse.pressed? interfaceColourPressed:interfaceColour
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.rightMargin: 3
            anchors.leftMargin: 3
            height: 100

            MouseArea{
                id: mouse
                anchors.fill: parent
                onClicked:{
                    normal()
                }
            }

            Text{
                id: txt1
                x: 88
                y: 24
                width: 178
                height: 51
                color:  "white"
                anchors.centerIn: parent
                text: "Browse Facebook"
                style: Text.Raised
                font.family: "Nokia Standard Light"
                font.pixelSize: 26
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

            }
        }
        Rectangle{
            Behavior on color { ColorAnimation { duration: 100 } }
            id: rect2
            color: mouse2.pressed? interfaceColourPressed:interfaceColour
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: rect1.bottom
            anchors.topMargin: 2
            anchors.rightMargin: 3
            anchors.leftMargin: 3
            height: 100

            MouseArea{
                id: mouse2
                anchors.fill: parent
                onClicked:{
                    fullscreen()
                }
            }

            Text{
                id: txt2
                x: 88
                y: 24
                width: 178
                height: 51
                color:  "white"
                text: "Fullscreen Mode"
                style: Text.Raised
                 anchors.centerIn: parent
                font.family: "Nokia Standard Light"
                font.pixelSize: 26
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

            }
        }
        Rectangle{
            Behavior on color { ColorAnimation { duration: 100 } }
            id: rect3
            color: mouse3.pressed? interfaceColourPressed:interfaceColour
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: rect2.bottom
            anchors.topMargin: 2
            anchors.rightMargin: 3
            anchors.leftMargin: 3
            height: 100

            MouseArea{
                id: mouse3
                anchors.fill: parent
                onClicked:{
                    pageStack.push(Qt.resolvedUrl("MenuPage.qml"))

                }
            }

            Text{
                id: txt3
                x: 88
                y: 24
                width: 178
                 anchors.centerIn: parent
                height: 51
                color:  "white"
                text: "Menu"
                style: Text.Raised
                font.family: "Nokia Standard Light"
                font.pixelSize: 26
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
        Rectangle{
            Behavior on color { ColorAnimation { duration: 100 } }
            id: rect4
            color: mouse4.pressed? interfaceColourPressed:interfaceColour
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: rect3.bottom
            anchors.topMargin: 2
            anchors.rightMargin: 3
            anchors.leftMargin: 3
            height: 100

            MouseArea{
                id: mouse4
                anchors.fill: parent
                onClicked:{
                    pageStack.push(Qt.resolvedUrl("Extras.qml"))

                }
            }
            Text{
                id: txt4
                x: 88
                y: 24
                width: 178
                height: 51
                color:  "white"
                 anchors.centerIn: parent
                text: "Extras"
                style: Text.Raised
                font.family: "Nokia Standard Light"
                font.pixelSize: 26
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

            }

        }
        Rectangle{
            Behavior on color { ColorAnimation { duration: 100 } }
            id: rect5
            color: mouse5.pressed? interfaceColourPressed:interfaceColour
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: rect4.bottom
            anchors.topMargin: 2
            anchors.rightMargin: 3
            height: 100
            anchors.leftMargin: 3

            MouseArea{
                id: mouse5
                anchors.fill: parent
                onClicked:{
                    pageStack.push(Qt.resolvedUrl("SettingsBasePage.qml"))

                }
            }

            Text{
                id: txt5
                x: 88
                y: 24
                width: 178
                height: 51
                color:  "white"
                text: "Settings"
                 anchors.centerIn: parent
                style: Text.Raised
                font.family: "Nokia Standard Light"
                font.pixelSize: 26
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

            }

        }

        Rectangle{
            Behavior on color { ColorAnimation { duration: 100 } }
             id: rect6
             color: mouse6.pressed? interfaceColourPressed:interfaceColour
             anchors.right: parent.right
             anchors.left: parent.left
             anchors.top: rect5.bottom
             anchors.topMargin: 2
             height: 100
             anchors.rightMargin: 3
             anchors.leftMargin: 3
             MouseArea{
                 anchors.fill: parent
                 id: mouse6
                 onClicked:{
                     exit()

                 }
             }

             Text{
                 id: txt6
                 x: 88
                 y: 24
                 width: 178
                 height: 51
                 color:  "white"
                 anchors.centerIn: parent
                 text: "Close"
                 style: Text.Raised
                 font.family: "Nokia Standard Light"
                 font.pixelSize: 26
                 verticalAlignment: Text.AlignVCenter
                 horizontalAlignment: Text.AlignHCenter

             }

         }

    }
}
