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
        width: 340
        height: 100
        Text{
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: if(screen.width===480){17} else{20}
            text: "No data is saved by this Application.\n All data is yours and yours only."
        }


        }

}
