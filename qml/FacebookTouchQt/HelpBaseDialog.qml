// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
Rectangle{
    id: quickhelp
    color:platformInverted? "white": "black"
    opacity: 0
    property alias text: text.text
    Behavior on opacity {NumberAnimation{duration: 200}}
    function close(){
        quickhelp.opacity=0
    }
    function open(){
         quickhelp.opacity=0.8
    }

    MouseArea{
        anchors.fill: parent
        onClicked:{
            close()
        }
    }
Rectangle {
    z: 1
    smooth: true
    visible: true
    opacity: 1
    radius: 20
    color: "black"
    border.color: "white"
    border.width: 1
    anchors{
        left: quickhelp.left
        right: quickhelp.right
        top: quickhelp.top
        bottom: quickhelp.bottom
        leftMargin: 5
        rightMargin: 5
        topMargin: 100
        bottomMargin:100
    }
    MouseArea{
        anchors.fill: parent
    }

    Text{
        id: text
        text: ""
        anchors.centerIn: parent
        color: "white"
        styleColor: "#ffffff"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

    }

    Rectangle{
        width: 40
        height: 40
        smooth: true
        Behavior on color { ColorAnimation { duration: 100 }}
        color: mouseexit.pressed? "#0077ff":"black"
        anchors.top: parent.top
        anchors.topMargin: 1
        anchors.rightMargin: 1
        anchors.right: parent.right
        radius: 80
        Text{
            anchors.centerIn: parent
            text: "X"
            color: "white"
        }

        MouseArea{
            id: mouseexit
            anchors.fill: parent
            onClicked:{
                close()
            }
        }

    }
}
}
