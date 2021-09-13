import QtQuick 1.1
import com.nokia.symbian 1.1

Rectangle {
    id: root
    property string fontsize: appSettings.getSystemSetting("fontsize", "")===""? "15": appSettings.getSystemSetting("fontsize", "")
    property int fontsizestring: fontsize
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
        root.opacity=0.8
    }
    anchors.fill: parent
    opacity: 0
    visible: true
    color: platformInverted? "white": "black"
    z:5
    MouseArea{
        anchors.fill: parent
        onClicked: {
            close()
        }
    }

    Rectangle{
        visible: true
        anchors.centerIn: parent
        color: nightMode? interfaceColourPressed:interfaceColour
        radius: 10
        width: 300
        height: 125
        Text{id: text; anchors.centerIn: parent; anchors.verticalCenterOffset: -20;color: "white";text:fontsizestring; font.pointSize: 15}
        SenseToolButton{buttonText: "+"; onClicked:{if(fontsizestring>34){QMLUtils.longpopup_dynamic("Error", "Cannot go Higher")}else{fontsizestring++} }anchors{right: parent.right; rightMargin: 10;verticalCenter: parent.verticalCenter; verticalCenterOffset: -20}}
        SenseToolButton{buttonText: "-"; onClicked:{if(fontsizestring<11){QMLUtils.longpopup_dynamic("Error", "Cannot go Lower")}else{fontsizestring--} }anchors{left: parent.left; leftMargin: 10;verticalCenter: parent.verticalCenter; verticalCenterOffset: -20}}
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
                    appSettings.saveSystemSetting("fontsize", fontsizestring);
                    close();
                    QMLUtils.caKnLong("App restart may be needed")
                }
            }
        }
    }
}
