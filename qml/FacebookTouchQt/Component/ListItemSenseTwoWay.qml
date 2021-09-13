import QtQuick 1.1
Rectangle{
    id: root
    property alias slot1text: text1.text
    property alias slot2text: text2.text
    signal slot1clicked
    signal slot2clicked
    height: 80
    color:nightMode?  interfaceColourPressed:interfaceColour
    anchors{left: parent.left;right: parent.right}
    Rectangle{id:rect1;anchors{left: parent.left;top:parent.top;bottom:parent.bottom}width:screen.width===360? 180:320;color: mouseArea1.pressed?interfaceColourPressed:interfaceColour;Behavior on color {ColorAnimation {duration: 90}}Text{id: text1;anchors.centerIn: parent;color:"white";font.pointSize: if(screen.height===480){5} else{7}} MouseArea{id: mouseArea1;anchors.fill: parent;onClicked:{root.slot1clicked();close()}}}
    Rectangle{id: rect2;anchors{right: parent.right;top:parent.top;bottom:parent.bottom}width:screen.width===360? 180:320;color: mouseArea2.pressed?interfaceColourPressed:interfaceColour;Behavior on color {ColorAnimation { duration: 90}}Text{id: text2;anchors.centerIn: parent;color:"white";font.pointSize: if(screen.height===480){5} else{7}}MouseArea{id: mouseArea2;anchors.fill: parent;onClicked:{root.slot2clicked();close()}}}
}
