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
        root.opacity=0.8;
    }
    anchors.fill: parent
    opacity: 0
    visible: true
    z: 5
    color: platformInverted? "white": "black"
    MouseArea{
        anchors.fill: parent
        onClicked: {
            close()
        }
    }

    Rectangle{
        z: 5
        id: base
        visible: true
        anchors.centerIn: parent
        color:  nightMode?interfaceColourPressed:interfaceColour
        width: 300
        height:  300
        Flickable{
            clip: true
            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.StopAtBounds
            anchors.fill: parent
            contentWidth: parent.width
            contentHeight: 300

            ListItemSense{
                height: 75
                id: item1
                anchors.top: parent.top
                text: "30 Seconds"
                onClicked:{appSettings.saveSystemSetting("timerduration", "30000")
                QMLUtils.longpopup_dynamic("", "30 Seconds Set")}
            }

            ListItemSense{
                height: 75
                id: item2
                anchors.top: item1.bottom
                text: "1 Minute"
                onClicked:{appSettings.saveSystemSetting("timerduration", "600000")
                 QMLUtils.longpopup_dynamic("", "1 Minute Set")}
            }

            ListItemSense{
                height: 75
                id: item3
                anchors.top: item2.bottom
                text: "5 Minutes"
                onClicked: {appSettings.saveSystemSetting("timerduration", "300000")
                QMLUtils.longpopup_dynamic("", "5 Minutes Set")}
            }

            ListItemSense{
                height: 75
                id: item4
                anchors.top: item3.bottom
                text: "10 Minutes"
                onClicked:{appSettings.saveSystemSetting("timerdurtion", "600000")
                QMLUtils.longpopup_dynamic("", "10 Minutes Set")}
            }
            }

        }

        }


