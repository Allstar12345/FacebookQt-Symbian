// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../Component"

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
                text: "Stop"
                onClicked:{web_view1.stop.trigger()}
            }
            ListItemSense{
                height: 75
                id: item2
                anchors.top: item1.bottom
                text: "Reload"
                onClicked:{web_view1.reload.trigger()}
            }
            ListItemSense{
                height: 75
                id: item3
                anchors.top: item2.bottom
                text: "Back"
                onClicked: {web_view1.back.trigger()}
            }
            ListItemSense{
                height: 75
                id: item4
                anchors.top: item3.bottom
                text: "Forward"
                onClicked:{web_view1.forward.trigger()}
            }

        }

        }
}

