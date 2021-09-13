// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import com.nokia.extras 1.1
import QtMobility.systeminfo 1.2
import AppSettings 1.0

PSW {
    id: window
    AppSettings{id: appSettings}
    initialPage: MainPage{}
    showStatusBar: set_status
    platformInverted: set_theme
    property bool set_pinch : appSettings.getSystemSetting("pinch", "") === "" ? true : false;
    property bool set_scrollbut : appSettings.getSystemSetting("scrollbut", "") === "" ? true : false
    property bool set_status : appSettings.getSystemSetting("status", "") === "" ? true: false
    property bool set_img : appSettings.getSystemSetting("img", "") === "" ? true : false
    property bool set_battery : appSettings.getSystemSetting("battery", "") === "" ? true : false
    property bool set_pgeload : appSettings.getSystemSetting("pgeload", "") === "" ? true : false
    property bool set_theme : appSettings.getSystemSetting("themee", "") === "" ? false : true
    property bool set_statuson : appSettings.getSystemSetting("statuson", "") === "" ? true: false
    property string mediakeys : appSettings.getSystemSetting("mediakeys", "") === "" ? false : true
    property string interfaceColour: "#0011ff"
    property string interfaceColourPressed: "#0077ff"
    property bool applicationActive: Qt.application.active
    property bool nightMode: false
    property string checkStatus: ""

    //onApplicationActiveChanged: {if(applicationActive){QMLUtils.normalPriority();}else{QMLUtils.backgroundPriority();}}

    function snapscreen(){
        snapdelay.start();
    }

Loader{id: loader; visible:false; anchors.fill: parent; z:5}

function switchWindow(){if(loader.source==="SecondWindowMobile.qml"){loader.visible=true}else{loader.visible=true; loader.source="SecondWindowMobile.qml"}}

function activateNightMode(){nightMode=true; interfaceColour="black"; interfaceColourPressed="#040D11"}

function deactivateNightMode(){nightMode=false; interfaceColour="#0011ff"; interfaceColourPressed="#0077ff"}

Timer{interval: 400; id:snapdelay; onTriggered:{screenObject.capture();QMLUtils.longpopup_dynamic("Snap Saved", "E:/Images")}}

NightCover{
        id: nightcover
        visible: false
        anchors.fill: parent
        z: 5
    }
        StatusBar {
            id: statusBar
            visible: set_status
            enabled: set_statuson
            anchors.top: parent.top
            DeviceInfo {
                     id: deviceinfo
                     monitorBatteryLevelChanges: set_battery
                 }
            Text {
                     id: batterytext
                     x: 1
                     width: 30
                     height: 26
                     color: "white"
                     text: qsTr("Batt: %1%").arg(deviceinfo.batteryLevel)
                     visible: set_battery
                     anchors.topMargin: 2
                     font.pixelSize: 16
                 }
        }
        InfoBanner {
                id: infoBanner
                timeout: 1250
                 platformInverted: set_theme
                function showText(text) {
                    infoBanner.text = text
                    infoBanner.open()
                }
        }
        function taskVisibilityCheck(){if(appSettings.getSystemSetting("hidden", "")===false){QMLUtils.hideFromSight();}else{QMLUtils.showToTask();}}

        Component.onCompleted: {
            if(appSettings.getSystemSetting("nightmodee", "")===""){}else{activateNightMode();}
           }
    }

