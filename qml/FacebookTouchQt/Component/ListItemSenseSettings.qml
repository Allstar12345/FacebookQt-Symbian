// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
Rectangle{
    id: root
    property alias textcolour: text.color
    property alias text: text.text
    property alias enabled: mouseArea.enabled
    property alias textsize: text.font.pointSize
    signal clicked
    height: 80
    anchors{
        left: parent.left
        right: parent.right
        rightMargin: 3
        leftMargin: 3
    }

    Behavior on color { ColorAnimation { duration: 90 } }
    color: mouseArea.pressed? interfaceColourPressed:interfaceColour
    Text{
        id: text
        anchors{verticalCenter: parent.verticalCenter; left:parent.left;leftMargin: 10}
        font.pointSize: if(screen.height===480){7} else{9}
        color: "white"
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        onClicked:{
            root.clicked()}
    }
}
