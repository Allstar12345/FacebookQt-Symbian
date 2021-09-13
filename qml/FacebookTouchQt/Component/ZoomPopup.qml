import QtQuick 1.1

Rectangle {
    id: root
    z: 5
    Behavior on opacity {NumberAnimation{duration: 200}}
    function close(){
        zoomtxtdisappear.start()
        basedisappear.start()
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
    SmoothedAnimation{
        to: 60
        property: "anchors.bottomMargin"
        target: base
        duration: 320
        id: baseappear
    }
    SmoothedAnimation{
        to: -150
        property: "anchors.bottomMargin"
        target: base
        duration: 380
        id: basedisappear
    }
    SmoothedAnimation{
        to: -390
        property: "anchors.verticalCenterOffset"
        target: zoomtext
        duration: 320
        id: zoomtxtdisappear
    }
    SmoothedAnimation{
        to: -45
        property: "anchors.verticalCenterOffset"
        target: zoomtext
        duration: 380
        id: zoomtxtappear
    }
    Component.onCompleted: {
        root.opacity=0.7
        zoomtxtappear.start()
        baseappear.start()
    }
    Component.onDestruction: {console.debug("Zoom Destroyed")}
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
    Text{
        id: zoomtext
        text: Math.round(web_view1.contentsScale*1.0)
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -390
        anchors.horizontalCenter: parent.horizontalCenter
        color: platformInverted? "black" : "white"
        font.pointSize: 21
        maximumLineCount: 1
    }

    Rectangle{
        clip: true
        id: base
        z: 5
        visible: true
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -150
        anchors.horizontalCenter: parent.horizontalCenter
        color: nightMode? interfaceColourPressed:interfaceColour
        width: 280
        height: 130

    SenseButton{
        id: zoomout
        height: 58
        width: 58
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        text: "-"
        textsize: 10
        onClicked:{
            if(web_view1.contentsScale < 1.5){web_view1.contentsScale= 1.0
                QMLUtils.longpopup_dynamic("", "Cannot Zoom Any Lower")}
            else{
            web_view1.contentsScale -= 0.25
            }
        }
    }

        SenseButton{
            id: resetbutton
            width: 125
            text: "Reset"
            textsize: 7
            anchors.centerIn: parent
            onClicked:{
                web_view1.contentsScale= 1.0
                 QMLUtils.longpopup_dynamic("", "Zoom Reset")
            }
        }
        SenseButton{
            id: zoomin
            height: 58
            width: 58
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            text: "+"
            textsize: 10
            onClicked:{
                if(web_view1.contentsScale > 2.5){web_view1.contentsScale= 2.5
                    QMLUtils.longpopup_dynamic("", "Cannot Zoom Any Higher")}
                else{
                web_view1.contentsScale += 0.25
                }
            }
        }
        }
}
