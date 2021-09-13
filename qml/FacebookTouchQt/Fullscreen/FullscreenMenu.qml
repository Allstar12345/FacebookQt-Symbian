// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../"
import "../Component"

Rectangle {
    id: root
    Behavior on opacity {NumberAnimation{duration: 200}}
    function close(){
        root.opacity=0
        basedisappear.start()
        kill.start()
    }
    Timer{
        id: kill
        interval: 340
        onTriggered:{
            root.destroy()
        }
    }
    onWidthChanged: {
        if(screen.width === 640){base.height= 300}
        if (screen.width === 360){base.height= 350}
    }

    Component.onCompleted: {
        root.opacity=0.8
        baseappear.start()
    }
    SmoothedAnimation{
        to:0
        property: "anchors.bottomMargin"
        target: base
        duration: 330
        id: baseappear
    }
    SmoothedAnimation{
        to: -510
        property: "anchors.bottomMargin"
        target: base
        duration: 330
        id: basedisappear
    }
    anchors.fill: parent
    opacity: 0
    visible: true
    z: 5
    color: platformInverted? "white": "black"
    MouseArea{
        anchors.fill: parent
        onClicked: {
            close()
        }
    }

    Rectangle{
        z: 5
        id: base
        visible: true
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -510
        anchors.left: parent.left
        anchors.right: parent.right
        color: nightMode?interfaceColourPressed:interfaceColour
        height:  if (screen.width === 640){
                     300
                 }
                 else{350}
        Flickable{
            id: flick
            clip: true
            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.DragOverBounds
            anchors.fill: parent
            contentWidth: parent.width
            contentHeight: 630
            Decorator{
                flickableItem: flick
            }
            ListItemSenseTwoWay{
                height: 70
                id: item1
                anchors.top: parent.top
                slot2text: "Intensity"
                slot1text: nightcover.visible? "Hide NightCover":"Show NightCover"
                onSlot1clicked:{ if (nightcover.visible == true){
                        nightcover.visible=false
                        close()}
                        else{
                            nightcover.visible= true
                            close()
                        }}
                onSlot2clicked: {openNCI();close();}
            }
            ListItemSense{
                height: 70
                id: item2
                anchors.top: item1.bottom
                text: autoreload.running == false? "Enable Auto Reload": "Disable Auto Reload"
                onClicked:{  if(autoreload.running == true) {
                       QMLUtils.longpopup_dynamic("", "Auto Reload Disabled")
                        autoreload.stop();
                        close()
                    } else {
                         QMLUtils.longpopup_dynamic("", "Auto Reload Enabled")
                        autoreload.start();
                        close()
                    }}
            }
            ListItemSense{
                height: 70
                id: item3
                anchors.top: item2.bottom
                text: "Controls"
                onClicked:{ opencontrols(); close()}
            }
            ListItemSense{
                height: 70
                id: item4
                anchors.top: item3.bottom
                text:web_view1.enabled == false ? "Disable Content Lock " : "Enable Content Lock"
                onClicked:{ if(web_view1.enabled == true) {
                        QMLUtils.longpopup_dynamic("", "Content Lock Enabled")
                        web_view1.enabled = false
                        close();
                      } else {
                       web_view1.enabled = true
                       QMLUtils.longpopup_dynamic("", "Content Lock Enabled")
                       close();
                      }}
            }
            ListItemSense{
                height: 70
                id: item5
                anchors.top: item4.bottom
                text: "Back To Tiles"
                onClicked:{pageStack.pop(); fullscreen.destroy()}
            }
            ListItemSense{
                height: 70
                id: item6
                anchors.top: item5.bottom
                text: "Enter External URL"
                onClicked:{ openurlinput(); close()}
            }
            ListItemSense{
                height: 70
                id: item7
                anchors.top: item6.bottom
                text: "Settings"
                onClicked:{ pageStack.push(Qt.resolvedUrl("../SettingsBasePage.qml")); close()}
                SubItemIndicator{
                }
            }
            ListItemSense{
                height: 70
                id: item8
                anchors.top: item7.bottom
                text: "Zoom Options"
                onClicked:{ openzoom(); close()}
            }
            ListItemSense{
                height: 70
                id: item9
                anchors.top: item8.bottom
                text: "Snap Screen"
                onClicked:{ snapscreen(); close()}
            }

        }
        }
}
