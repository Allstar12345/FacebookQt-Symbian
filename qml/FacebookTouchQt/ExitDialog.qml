import QtQuick 1.1

Rectangle {
    id: root
    Behavior on opacity {NumberAnimation{duration: 200}}
    function close(){
        root.opacity=0
        kill.start()
    }
    Timer{
        id: kill
        interval: 200
        onTriggered:{
            root.destroy()
        }
    }

    //Timer{id: cd; interval: 400; onTriggered:{}}

    Component.onCompleted: {
        root.opacity=0.8
    }
    anchors.fill: parent
    opacity: 0
    visible: true
    color: platformInverted? "white": "black"
    MouseArea{
        anchors.fill: parent
        onClicked: {
            close()
        }
    }

    Rectangle{
        visible: true
        anchors.centerIn: parent
        color: nightMode? interfaceColourPressed:interfaceColour
        radius: 10
        width: 300
        height: 150
        Text{
        text: "Are You Sure You Want To Exit?"
        color: "white"
        font.pixelSize: if(screen.width===480){18} else{20}
        anchors{
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
        verticalCenterOffset: -50

         }
        }
        Rectangle{
            width: 150
            radius: 10
            height: 50
            Behavior on color {ColorAnimation {duration: 200 }}
            color: mousequit.pressed?interfaceColourPressed:interfaceColour
            anchors{
            bottom: parent.bottom
            left: parent.left
            }
            Text{
                anchors.centerIn: parent
                color: "white"
                text: "Exit"
            }

            MouseArea{
                id: mousequit
                anchors.fill: parent
                onClicked: {
                   // QMLUtils.backgroundPriority();
                    Qt.quit()
                }
            }
        }
        Rectangle{
            height: 50
            radius: 10
            width: 150
            Behavior on color {ColorAnimation {duration: 200 }}
            color: mousemin.pressed?interfaceColourPressed:interfaceColour
            anchors{
                bottom: parent.bottom
                right: parent.right
            }
            Text{
                anchors.centerIn: parent
                color: "white"
                text: "Minimize"
            }
            MouseArea{
                id: mousemin
                anchors.fill: parent
                onClicked: {
                    QMLUtils.minimizeApp()
                    close()
                }
            }
        }

        }

}
