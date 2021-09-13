import Qt 4.7
Rectangle {
     id: root
     Behavior on scale{NumberAnimation{}}
     height: 40
     width: 80
     radius: 30
     scale: 0
     z: 10
     function open(){root.scale=1}
     function hide(){root.scale=0}
     property alias text: text.text
     anchors.bottom: parent.top
     anchors.bottomMargin: 4
     gradient: Gradient {
         GradientStop {
             position: 0.250
             color: "#0077ff"
         }

         GradientStop {
             position: 0.650
             color: "#0011ff"
         }
     }
     border.color: "#000000"
     smooth: true
     Text{
         id: text
         anchors.centerIn: parent
         text: ""
         color: "white"
     }
}
