// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

Rectangle{
    id: hideview
    anchors.fill: parent
    visible: true
    color: "Black"
    opacity: 0
    Behavior on opacity {NumberAnimation{}}
    z: 5
    Component.onCompleted: {
        open()
    }
    function open(){
        hideview.opacity=1
    }
    function close(){
        hideview.opacity=0
        timer.start()
    }
    Timer{
        id: timer
        interval: 400
        onTriggered: {
            hideview.destroy();
        }
    }
    Text {
        id: hideviewclock
        text: symbian.currentTime
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        font.italic: false
        font.strikeout: false
        font.underline: false
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 100
        color:"white"
        visible: true
        wrapMode: Text.NoWrap
        maximumLineCount: 1
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.centerIn: parent
    }

    Image {
        id: batteryBackground
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 2
        sourceSize.height: 40
        sourceSize.width: 40
        fillMode: Image.PreserveAspectFit
        source: privateStyle.imagePath((privateBatteryInfo.powerSaveModeEnabled ?
            "qtg_graf_battery_level_psm_bg" :
            "qtg_graf_battery_level_bg"), root.platformInverted)

        Item {
            id: batteryLevel
            property int animatedLevel
            anchors.left: parent.left
            anchors.top: parent.top
            width: Math.round(privateStyle.statusBarHeight
                * ((privateBatteryInfo.charging ? Math.floor(animatedLevel / 100) :
                    privateBatteryInfo.batteryLevel) + 2) / 6)
            height: parent.height
            clip: true
            LayoutMirroring.enabled: false

            Image {
                anchors.fill: parent
                // Battery state mappings: Levels 0 and 1 are low, 2-4 are medium, 5-7 are full.
                // Currently all levels use same graphics with white color.

                source: privateStyle.imagePath((privateBatteryInfo.powerSaveModeEnabled ?
                    "qtg_graf_battery_level_psm_full" :
                    "qtg_graf_battery_level_full"), root.platformInverted)
            }
        }

        Image {
            // power save mode indicator
            anchors.fill: parent
            sourceSize.width: parent.sourceSize.width
            sourceSize.height: parent.sourceSize.height
            source: privateStyle.imagePath("qtg_graf_battery_psm")
            visible: privateBatteryInfo.powerSaveModeEnabled
        }

        NumberAnimation {
            id: batteryChargingAnimation
            loops: Animation.Infinite
            running: privateBatteryInfo.charging
            target: batteryLevel
            property: "animatedLevel"
            // Use bigger range (compared to 0-7) in order to make the animation smoother.
            from: 0
            to: 799
            duration: 3500
        }
    }



    MouseArea{
        anchors.fill: parent
        onClicked:{
            close()
        }
    }
}
