import QtQuick 1.1

Rectangle {
    height: 30
    property alias text: text.text
    z: 2
    anchors{
        right: parent.right
        left: parent.left
    }
    smooth: true
    color: platformInverted? "light grey": "black"
    Text {
    smooth: true
    color: platformInverted? "black" : "white"
    style: Text.Raised
    id: text
    font.pointSize: 6
    anchors.centerIn: parent
    }
}
