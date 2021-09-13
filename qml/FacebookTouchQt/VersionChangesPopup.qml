import QtQuick 1.1

Rectangle {
    id: root
    z:2
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
    onWidthChanged: {
        if (screen.width=== 640){
            base.height= 320
        }
        else{
            base.height= 500
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
        id: base
        clip: true
        visible: true
        anchors.centerIn: parent
        color:  nightMode? interfaceColourPressed:interfaceColour
        width: 345
        height: if (screen.width=== 640){
                    base.height= 320
                }
                else{
                    base.height= 500
                }
        Flickable{
            flickableDirection: Flickable.VerticalFlick
            anchors.fill: parent
            contentWidth: parent.width
            contentHeight: 432
        Text{
            anchors.top: parent.top
            anchors.topMargin: 1
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
             font.pixelSize: if(screen.width===480){17} else{20}
            text: "Changelog for Facebook Qt v1.93 INT\n\nRebooting on Font size change fixed\nFile Picker changed"
        }
        }
    }
}
