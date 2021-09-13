import QtQuick 1.1
import "Component"
Rectangle {
    id: menu
    QtObject { id: creator; property Component com: null;function createComponent (qmlfile){com = Qt.createComponent(qmlfile);com.createObject(menu)} }

    anchors.fill: parent
    color: platformInverted? "white": "black"

   BottomBar{
       id: toolBar
    SenseToolButton {
        id: btnBack
        anchors.left: parent.left
        anchors.leftMargin: 2
        imgsource: "images/back.svg"
        tiptext: "Back"
        onClicked: {
            pageStack.pop();
            menu.destroy();
        }
    }
   }
  ListHead{
        id: head
        z:1
        text: "Menu"
   }
   Flickable{
       contentHeight: rect1.height * 2 + head.height
       contentWidth: parent.width
       anchors.right: parent.right
       anchors.left: parent.left
       anchors.bottom: toolBar.top
       anchors.top: head.bottom

       Rectangle{
           id: rect1
           Behavior on color { ColorAnimation { duration: 100 } }
           color: mouse.pressed? interfaceColourPressed:interfaceColour
           anchors.right: parent.right
           anchors.left: parent.left
           anchors.rightMargin: 3
           anchors.leftMargin: 3
           height: 109


           MouseArea{
               id: mouse
               anchors.fill: parent
               onClicked:{
                pageStack.push(Qt.resolvedUrl("About.qml"))
}
           }

           Text{
               id: txt1
               x: 88
               y: 24
               width: 178
               height: 51
               color:  "white"
               anchors.centerIn: parent
               text: "About Facebook Qt"
               style: Text.Raised
               font.family: "Nokia Standard Light"
               font.pixelSize: 26
               verticalAlignment: Text.AlignVCenter
               horizontalAlignment: Text.AlignHCenter

           }
       }
       Rectangle{
           id: rect2
           Behavior on color { ColorAnimation { duration: 100 } }
           color: mouse2.pressed?interfaceColourPressed:interfaceColour
           anchors.right: parent.right
           anchors.left: parent.left
           anchors.top: rect1.bottom
           anchors.topMargin: 2
           anchors.rightMargin: 3
           anchors.leftMargin: 3
           height: 109


           MouseArea{
               id: mouse2
               anchors.fill: parent
                property Component __oad: null
               onClicked:{
                  creator.createComponent("OtherAppsDialog.qml")

}
           }

           Text{
               id: txt2
               x: 88
               y: 24
               width: 178
               height: 51
               color:  "white"
               anchors.centerIn: parent
               text: "Other Applications"
               style: Text.Raised
               font.family: "Nokia Standard Light"
               font.pixelSize: 26
               verticalAlignment: Text.AlignVCenter
               horizontalAlignment: Text.AlignHCenter

           }

       }


   }

}







