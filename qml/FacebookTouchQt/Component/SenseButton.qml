import QtQuick 1.1

Rectangle{
    id: root
    height: 48
    width: 50
    smooth: true
    signal clicked
    signal platformReleased
    signal hold
    signal pressed
    property alias colour: root.color
    property alias text: text.text
    property alias textsize: text.font.pointSize
    property url imgsource
    radius: 50
    Behavior on color {ColorAnimation {duration: 90 }}
    color: mouseArea.pressed? "red":"black"
    Text{
        id: text
        visible: true
        anchors.centerIn: parent
        color: "white"
        font.pointSize: 9
    }
    Image{
        anchors.centerIn: parent
        id: image
        source: privateStyle.toolBarIconPath(imgsource)
        smooth: true
    }


    MouseArea{
        id: mouseArea
        onClicked: root.clicked()
        anchors.fill: parent
        onPressed: root.pressed()
        onPressAndHold: root.hold()
    }

}
