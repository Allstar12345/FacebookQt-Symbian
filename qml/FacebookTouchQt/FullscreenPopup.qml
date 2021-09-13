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
        width: 300
        height: 201

            Rectangle{
                height: 100
                anchors{
                    top: parent.top
                    left: parent.left
                    right: parent.right
                }

                Behavior on color { ColorAnimation { duration: 100 } }
                id: rect1
                color: mouse1.pressed?interfaceColourPressed:interfaceColour
                Text{
                    anchors.centerIn: parent
                    text: "Touch"
                    color: "white"
                }
                MouseArea{
                    id: mouse1
                    anchors.fill: parent
                    onClicked:{
                        pageStack.push (Qt.resolvedUrl("FullscreenTouch.qml"))
                        close()
                    }
                }
            }
            Rectangle{
                height: 100
                anchors{
                    top: rect1.bottom
                    topMargin: 1
                    left: parent.left
                    right: parent.right
                }

                Behavior on color { ColorAnimation { duration: 100 } }
                id: rect2
                color: mouse2.pressed?interfaceColourPressed:interfaceColour
                Text{
                    anchors.centerIn: parent
                    text: "Mobile Basic"
                    color: "white"
                }

                MouseArea{
                    id: mouse2
                    anchors.fill: parent
                    onClicked:{
                        pageStack.push (Qt.resolvedUrl("FullscreenMobile.qml"))
                        close()
                    }
                }
            }
        }

}
