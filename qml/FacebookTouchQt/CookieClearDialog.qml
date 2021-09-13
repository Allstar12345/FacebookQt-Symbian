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
        color: nightMode?interfaceColourPressed:interfaceColour
        radius: 10
        width: 300
        height: 150
        Text{
            font.pixelSize: if(screen.width===480){18} else{20}
        text: "Are you sure you want to clear\nCookies ?"
        color: "white"
        anchors{
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
        verticalCenterOffset: -40

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
                text: "Yes"
            }

            MouseArea{
                id: mousequit
                anchors.fill: parent
                onClicked: {
                    nami.clearCookies()
                    QMLUtils.del()
                    QMLUtils.longpopup_dynamic("", "Cookies Cleared")
                    close()
                }
            }
        }
        Rectangle{
            height: 50
            radius: 10
            width: 150
            Behavior on color {ColorAnimation {duration: 200 }}
            color: mousemin.pressed? interfaceColourPressed:interfaceColour
            anchors{
                bottom: parent.bottom
                right: parent.right
            }
            Text{
                anchors.centerIn: parent
                color: "white"
                text: "Cancel"
            }
            MouseArea{
                id: mousemin
                anchors.fill: parent
                onClicked: {
                    close()
                }
            }
        }

        }

}



