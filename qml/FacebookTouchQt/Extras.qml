import QtQuick 1.1
import com.nokia.symbian 1.1
import "Component"

Rectangle {
    id: extras
    anchors.fill: parent
    color: platformInverted? "white": "black"
    QtObject { id: creator; property Component com: null;function createComponent (qmlfile){com = Qt.createComponent(qmlfile);com.createObject(extras)} }

    function openprivacy(){
     creator.createComponent("Component/PrivacyDialog.qml")
    }

    function openchanges(){
    creator.createComponent("VersionChangesPopup.qml")
    }


    BottomBar{
    id: toolBar
        SenseToolButton{
            imgsource: "images/back.svg"
            anchors.left: parent.left
            anchors.leftMargin: 2
            onClicked: { pageStack.pop()
            extras.destroy();
        }
        }
    }

    ListHead {
    id: head
    z: 1
    text: "Extras"
    }
    Flickable{
        contentHeight: rect2.height * 2 + head.height
        contentWidth: parent.width
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: toolBar.top
        anchors.top: head.bottom


        Rectangle{
            id: rect2
            Behavior on color { ColorAnimation { duration: 100 } }
            color: mouse2.pressed? interfaceColourPressed:interfaceColour
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.rightMargin: 3
            anchors.leftMargin: 3
            height: 109


            MouseArea{
                id: mouse2
                anchors.fill: parent
                onClicked:{
                    openprivacy()
 }
            }

            Text{
                id: txt2
                x: 88
                y: 24
                width: 178
                height: 51
                color:  "white"
                anchors.centerIn: parent
                text: "Privacy"
                style: Text.Raised
                font.family: "Nokia Standard Light"
                font.pixelSize: 26
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

            }

        }

        Rectangle{
            id: rect4
            Behavior on color { ColorAnimation { duration: 100 } }
            color: mouse4.pressed?interfaceColourPressed:interfaceColour
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: rect2.bottom
            anchors.topMargin: 2
            anchors.rightMargin: 3
            anchors.leftMargin: 3
            height: 109


            MouseArea{
                id: mouse4
                anchors.fill: parent
                onClicked:{
                 pageStack.push(Qt.resolvedUrl("SignupPage.qml"))
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
                text: "Join Facebook"
                style: Text.Raised
                font.family: "Nokia Standard Light"
                font.pixelSize: 26
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

            }
        }


    }

}
