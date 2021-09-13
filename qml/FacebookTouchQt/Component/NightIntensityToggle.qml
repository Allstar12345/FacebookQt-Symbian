import QtQuick 1.1
import com.nokia.symbian 1.1

    Rectangle{
        z:5
        id: root
        Behavior on opacity {NumberAnimation{duration: 200}}
        function close(){
            root.opacity=0
            kill.start()
        }
        Timer{
            id: kill
            interval: 200
            onTriggered:{
                root.destroy()
            }
        }
        Component.onCompleted: {
            root.opacity=0.9
            if(nightcover.visible===false){nightcover.visible=true}
        }
        MouseArea{anchors.fill:parent;enabled: true}
        visible: true
        anchors.centerIn: parent
        color:  nightMode?interfaceColourPressed:interfaceColour
        radius: 10
        width: 300
        height: 125
        Slider{id: slider;anchors{right:parent.right;left:parent.left;horizontalCenter: parent.horizontalCenter;verticalCenter: parent.verticalCenter;verticalCenterOffset: -17;rightMargin: 5;leftMargin: 5}
            minimumValue: 0.500
            maximumValue: 0.940
            valueIndicatorVisible: true
            valueIndicatorText: Math.round(value*100)
            onValueChanged: {
                if (pressed) nightcover.opacity= value
            }
        }
        Binding {
                    when: !slider.pressed
                    target: slider
                    property: "value"
                    value: nightcover.opacity
                }
        Rectangle{
            radius: 10
            height: 40
            Behavior on color {ColorAnimation {duration: 200 }}
            color: mousesave.pressed? interfaceColourPressed:interfaceColour
            anchors{
            bottom: parent.bottom
            left: parent.left
            right:parent.right
            }
            Text{
                anchors.centerIn: parent
                color: "white"
                text: "Save"
            }
            MouseArea{
                id: mousesave
                anchors.fill: parent
                onClicked: {
                    appSettings.saveSystemSetting("nightcoveropa", nightcover.opacity);
                    close();
                }
            }
        }
    }

