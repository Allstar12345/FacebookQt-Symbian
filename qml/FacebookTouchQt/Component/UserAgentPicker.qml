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
        height: root.height/ 1.2
        Flickable{
            clip: true
            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.StopAtBounds
            anchors.fill: parent
            contentWidth: parent.width
            contentHeight: column.height
Column{
    id: column
    width: parent.width
            ListItemSense{
                height: 75
                text: "Default (IOS)"
                onClicked:{
                    appSettings.saveUserAgent("Default");UserAgent.update();
                QMLUtils.longpopup_dynamic("", "Default UA Set")}
            }

            ListItemSense{
                height: 75
                text: "Android"
                onClicked:{appSettings.saveUserAgent("Android");UserAgent.update();
                QMLUtils.longpopup_dynamic("", "Android UA Set")}
            }
            ListItemSense{
                height: 75
                text: "FireFox"
                onClicked:{appSettings.saveUserAgent("FireFox");UserAgent.update();
                QMLUtils.longpopup_dynamic("", "FireFox UA Set")}
            }
            ListItemSense{
                height: 75
                text: "BlackBerry 10"
                onClicked:{appSettings.saveUserAgent("BlackBerry10");UserAgent.update();
                QMLUtils.longpopup_dynamic("", "BB10 UA Set")}
            }
            ListItemSense{
                height: 75
                text: "Kai OS"
                onClicked:{appSettings.saveUserAgent("KaiOS");UserAgent.update();
                QMLUtils.longpopup_dynamic("", "Kai OS UA Set")}
            }
            ListItemSense{
                height: 75
                text: "Sailfish"
                onClicked:{appSettings.saveUserAgent("SailFish");UserAgent.update();
                QMLUtils.longpopup_dynamic("", "Sailfish OS UA Set")}
            }

            ListItemSense{
                height: 75
                text: "Custom"
                onClicked:{
                    openCustomUADialog();
                }
            }

}
            }

        }

        }


