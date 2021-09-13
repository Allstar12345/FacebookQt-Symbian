import QtQuick 1.1
import "Component"

Rectangle{
    id: about
    anchors.fill: parent
    color: platformInverted? "white": "black"
    Component.onCompleted: {
        logo.scale= 1.1
        logo.opacity= 1
        logo.scale=1
        panetimer.start()
    }
    onWidthChanged: {
        if (screen.width=== 640){logo.visible=false; pane1.height= 289}
        else{
            pane1.height= 360
            logo.visible=true
        }
    }

Timer{
    id: panetimer; interval: 900; onTriggered:{pane1appear.start()
        logoopacityshift.start()
        appearagaindelay.start()}
}
Timer{
    id: appearagaindelay; interval: 1500
    onTriggered:{
        logoappearagain.start()
        logo.opacity= 1
    }
}
   BottomBar{
        visible: true
        SenseToolButton {
            tiptext: "Back"
            id: btnBack
            anchors.left: parent.left
            anchors.leftMargin: 2
            imgsource: "toolbar-back"
            onClicked: { pageStack.pop()
                about.destroy()}
        }
    }
   SmoothedAnimation{
       to:0
       target: pane1
       property: "anchors.topMargin"
       id: pane1appear
   }
   SmoothedAnimation{
       target: logo
       property: "anchors.verticalCenterOffset"
       to: 150
       id: logoappearagain
   }

   PropertyAnimation{
       to: 0
       target: logo
       property: "opacity"
       duration: 800
       id: logoopacityshift
   }
   Rectangle{
       id: pane1
       z: 1
       color: nightMode? interfaceColourPressed:interfaceColour
       height: if (screen.width=== 640){289} else{360}
       clip: true
       anchors.right: parent.right
       anchors.left: parent.left
       anchors.top: parent.top
       anchors.topMargin: -360
       Flickable{
           anchors.fill: parent
           contentWidth: parent.width
           contentHeight: 360
         ListItemSense{
               enabled: false
               height: 60
               id: item1
               text: "Facebook Qt v1.95 EOL By Allstar Software"
               onClicked: {Qt.openUrlExternally("https://allstarsoftware.co.uk")}
           }

           ListItemSense{
               height: 60
               id: item2
               anchors.top: item1.bottom
               text: "Find Me On Facebook"
               onClicked:{
                   Qt.openUrlExternally ("http://facebook.com/Allstarsoftware")
               }
           }
           ListItemSense{
               height: 60
               id: item3
               anchors.top: item2.bottom
               text: "Find Me On Twitter"
               onClicked:{
                   Qt.openUrlExternally ("http://twitter.com/paulwallace1234")
               }
           }
           ListItemSense{
               height: 60
               id: item4
               anchors.top: item3.bottom
               text: "Email Me"
               onClicked:{
                    Qt.openUrlExternally('mailto:contact@allstarsoftware.co.uk')
               }
           }
           ListItemSense{
               height: 60
               id: item5
               anchors.top: item4.bottom
               text: "Graphics By Blade Designs"
               onClicked:{
                   Qt.openUrlExternally("http://www.facebook.com/BladexDesigns")
               }
           }
           ListItemSense{
               height: 60
               id: item6
               anchors.top: item5.bottom
               text: "Special Thanks To Huellif"
               onClicked:{
                   Qt.openUrlExternally("https://github.com/huellif")
               }
           }

       }
   }

   Image {
       id: logo
       width: 200
       height: 200
       opacity: 0
       scale: 0
       Behavior on scale {NumberAnimation{duration: 900; easing.type: Easing.OutElastic}}
       Behavior on opacity {NumberAnimation{duration: 900}}
       anchors.verticalCenter: parent.verticalCenter
       anchors.horizontalCenter: parent.horizontalCenter
       fillMode: Image.PreserveAspectFit
       sourceSize.height: 200
       sourceSize.width: 200
       source: "images/icon.svg"
   }

}
