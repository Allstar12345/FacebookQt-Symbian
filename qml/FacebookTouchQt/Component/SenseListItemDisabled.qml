// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
Rectangle{
    id: root
    property alias textcolour: text.color
    property alias text: text.text
    property alias textsize: text.font.pointSize
    signal clicked
    height: 80
    enabled: false
    anchors{
        left: parent.left
        right: parent.right
    }
    color:interfaceColour
    Text{
        id: text
        anchors.centerIn: parent
        text: ""
        color: "white"
    }

}
