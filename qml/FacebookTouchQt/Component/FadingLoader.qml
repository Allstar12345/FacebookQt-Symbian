import QtQuick 1.1
Rectangle {
     id: root
     Behavior on opacity {NumberAnimation{duration: 900}}
     height: 100
     width: 100
     radius: 60
     scale: 1
     z: 1
     Timer{id: repeat;repeat: true; interval: 600; onTriggered: {flash()}}
     Timer{id:timer;interval:600;repeat: false; onTriggered: {root.opacity=1}}
     function start(){repeat.start()}
     function flash(){root.opacity=0; timer.start()}
     function stop(){timer.stop(); repeat.stop()}
     anchors.centerIn: parent
     gradient: Gradient {
         GradientStop {
             position: 0.250
             color: nightMode? interfaceColourPressed: "#0077ff"
         }

         GradientStop {
             position: 0.650
             color: nightMode? interfaceColour: "#0011ff"
         }
     }
     //
     border.color: "#FFFFFF"
     smooth: true
}
