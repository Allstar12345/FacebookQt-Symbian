import QtQuick 1.1

Rectangle{
    id: root
    height: if (screen.width=== 640){
                46
            }
            else{
                48
            }
    width: 50
    smooth: true
    signal clicked
    signal pressed
    signal platformReleased
    signal platformPressAndHold
    anchors.verticalCenter: parent.verticalCenter
    property alias colour: root.color
    property url imgsource
    property alias buttonText: text.text
    property alias tiptext: tip.text
    property alias imagerotation: image.rotation
    radius: 50
    Behavior on color {ColorAnimation {duration: 80 }}
    color: mouseArea.pressed? "blue":"black"
    onWidthChanged: {
        if (screen.width=== 640){
            root.height= 46
        }
        else{
            root.height= 48
        }
    }

    Image{
        anchors.centerIn: parent
        id: image
        source: privateStyle.toolBarIconPath(imgsource)
        smooth: true
    }
    Text{id: text; color:"white";anchors.centerIn: parent;font.pointSize: 12}
    MouseArea{
        id: mouseArea
        onPressed: root.pressed()
        onClicked: root.clicked()
        anchors.fill: parent
        onPressAndHold:  if(tip.text=== ""){root.platformPressAndHold()}
                         else{
                             tip.open()
                         }
        onReleased:if(tip.text=== ""){root.platformReleased()}
                   else{
                       tip.hide()
                   }
    } 

    ButtonTip{
        id: tip
    }
}
