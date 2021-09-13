import QtQuick 1.1
import com.nokia.symbian 1.1
import "Component"

Rectangle {
    id: settingsbasepage
    anchors.fill: parent
    color: platformInverted? "white": "black"
    QtObject { id: creator; property Component com: null;function createComponent (qmlfile){com = Qt.createComponent(qmlfile);com.createObject(settingsbasepage)} }

    function autoload(){
    creator.createComponent("Component/AutoReloadPopup.qml")
    }
    function fontSizer(){
    creator.createComponent("Component/FontSizeChooser.qml")
    }

    function userAgent(){
        creator.createComponent("Component/UserAgentPicker.qml")
    }

    function openCustomUADialog(){
        creator.createComponent("Component/CustomUA.qml")

    }

    HelpBaseDialog{
        z: 1
        anchors.fill: parent
        id: quickhelp
        function infotext(text) {
          quickhelp.text = text
            quickhelp.open()
        }
    }

   BottomBar{
       id: toolBar
            SenseToolButton {
                id: btnBack
                anchors.left: parent.left
                anchors.leftMargin: 2
                imgsource: "images/back.svg"
                tiptext: "Back"
                onClicked: { pageStack.pop()
                    settingsbasepage.destroy()}
            }
   }

   ListHead {
       id: sectionHeading
       text: "Settings"
   }
Flickable{
 id: flickable1
  contentWidth: parent.width
  contentHeight: rect1.height * 15 + sectionHeading.height * 2

 anchors{
     right: parent.right
     left: parent.left
     top: sectionHeading.bottom
     bottom: toolBar.top
 }
 Decorator{
     flickableItem: flickable1
 }
     ListItemSenseSettings{
         id: rect1
         height: 70
         text: "Pinch To Zoom Enabled"
         onClicked: { quickhelp.infotext ("This option enables and disables\nthe Pinch to zoom across the board.")}
         Switch {
              anchors.right: parent.right
              anchors.rightMargin: 10
              anchors.verticalCenter: parent.verticalCenter
              checked: set_pinch
              onClicked: {
                  if(appSettings.getSystemSetting("pinch", "") === "false"){
                      appSettings.saveSystemSetting("pinch", "")
                      set_pinch = true;
                  }
                  else{
                      appSettings.saveSystemSetting("pinch", "false");
                      set_pinch = false;
                  }
              }
          }
 }
     ListItemSenseSettings{
         id: rect2
         anchors.top: rect1.bottom
         anchors.topMargin: 2
         height: 70
         text: "Show/Hide Images"
         onClicked:{ quickhelp.infotext ("This option enables and disables\nthe Images across the board.")}
         Switch {
              anchors.right: parent.right
              anchors.rightMargin: 10
              anchors.verticalCenter: parent.verticalCenter
              checked: set_img
              onClicked: {
                  if(appSettings.getSystemSetting("img", "") === "false"){
                      appSettings.saveSystemSetting("img", "")
                      set_img = true;
                  }
                  else{
                      appSettings.saveSystemSetting("img","false")
                      set_img = false;
                  }
              }
          }
 }
     ListItemSenseSettings{
         id: rect3
         anchors.top: rect2.bottom
         anchors.topMargin: 2
         height: 70
         text: "Show/Hide StatusBar"
         onClicked:{ quickhelp.infotext("This option shows and hides the top\nStatusBar.")}

         Switch {
              anchors.right: parent.right
              anchors.rightMargin: 10
              anchors.verticalCenter: parent.verticalCenter
              checked: set_status
              onClicked: {
                  if(appSettings.getSystemSetting("status", "") === "false"){
                      appSettings.saveSystemSetting("status", "")
                      set_status = true;
                  }
                  else{
                      appSettings.saveSystemSetting("status", "false")
                      set_status = false;
                  }
              }
          }
 }
     ListItemSenseSettings{
         id: rect4
         anchors.top: rect3.bottom
         anchors.topMargin: 2
         height: 70
         text: "Interactive StatusBar"
         onClicked:{
             quickhelp.infotext("This option enables and disables\nthe top StatusBar meaning it will\nnot respond to touch once disabled.")
         }

         Switch{
              anchors.right: parent.right
             anchors.rightMargin: 10
             anchors.verticalCenter: parent.verticalCenter
             checked: set_statuson
             onClicked: {
                 if(appSettings.getSystemSetting("statuson", "") === "false"){
                     appSettings.saveSystemSetting("statuson", "")
                     set_statuson = true;
                 }
                 else{
                     appSettings.saveSystemSetting("statuson", "false");
                     set_statuson = false;
                 }
             }
         }
 }

     ListItemSenseSettings{
         id: rect5
         anchors.top: rect4.bottom
         anchors.topMargin: 2
         height: 70
         text: "Battery % on StatusBar"
         onClicked:{
             quickhelp.infotext("This option enables and disables\nthe battery percentage meter\non the StatusBar")
         }
         Switch {
              anchors.right: parent.right
              anchors.rightMargin:10
              anchors.verticalCenter: parent.verticalCenter
              checked: set_battery
              onClicked: {
                  if(appSettings.getSystemSetting("battery", "") === "false"){
                      appSettings.saveSystemSetting("battery", "")
                      set_battery = true;
                  }
                  else{
                      appSettings.saveSystemSetting("battery", "false")
                      set_battery = false;
                  }
              }
          }
 }

     ListItemSenseSettings{
         id: rect6
         anchors.top: rect5.bottom
         anchors.topMargin: 2
         height: 70
         onClicked:{
             quickhelp.infotext("This option enables and disables the\nfullscreen page loading indication\n(Screen dims and a BusyCircle appears)")
         }
         text: "Show Loading Screen"
         Switch {
              anchors.right: parent.right
              anchors.rightMargin: 10
              anchors.verticalCenter: parent.verticalCenter
              checked: set_pgeload
              onClicked: {
                  if(appSettings.getSystemSetting("pgeload", "")=== "false"){
                      appSettings.saveSystemSetting("pgeload", "")
                      set_pgeload = true;
                  }
                  else{
                      appSettings.saveSystemSetting("pgeload", "false")
                      set_pgeload = false;
                  }
              }
          }
 }
     ListItemSenseSettings{
         id: rect7
         anchors.top: rect6.bottom
         anchors.topMargin: 2
         height: 70
         text: "Dark/Light Theme"
         onClicked:{
             quickhelp.infotext("This option enables and disables the\nLight and Dark UI types")
         }

         Switch{
              id: themeswitch
              enabled: nightMode?false: true
              anchors.right: parent.right
              anchors.rightMargin: 10
              anchors.verticalCenter: parent.verticalCenter
              checked: set_theme
              onClicked: {
                  if(appSettings.getSystemSetting("themee", "")===""){
                      appSettings.saveSystemSetting("themee", "light")
                      set_theme = true;
                  }
                  else{
                      appSettings.saveSystemSetting("themee", "")
                      set_theme = false;
                  }

                  console.log(appSettings.getSystemSetting("themee", ""))
             }
         }
 }
     ListItemSenseSettings{
         id: rect8
         anchors.top: rect7.bottom
         anchors.topMargin: 2
         height: 70
             onClicked:{
                 quickhelp.infotext("This option enables and disables the\nfloating Page ScrollButtons")}
             text: "Scroll Buttons"


         Switch {
              anchors.right: parent.right
              anchors.rightMargin: 10
              anchors.verticalCenter: parent.verticalCenter
              checked: set_scrollbut
              onClicked: {

                  if(appSettings.getSystemSetting("scrollbut", "") === "false"){
                      appSettings.saveSystemSetting("scrollbut", "")
                      set_scrollbut = true;
                  }
                  else{
                      appSettings.saveSystemSetting("scrollbut", "false");
                      set_scrollbut = false;
                  }              }
          }
 }
     ListItemSenseSettings{
         id: rect12
         anchors.top: rect8.bottom
         anchors.topMargin: 2
         height: 70
         onClicked:{quickhelp.infotext("This option allows you to hide the App from\nthe system Task manager.")}
         text: "Hide from Task Switcher"


         Switch {
              anchors.right: parent.right
              anchors.rightMargin: 10
              anchors.verticalCenter: parent.verticalCenter
              checked: appSettings.getSystemSetting("hidden", "")===""? false: true
              onClicked: {
                  if (appSettings.getSystemSetting("hidden", "")=== ""){appSettings.saveSystemSetting("hidden", "true");  QMLUtils.hideFromSight(); QMLUtils.shortpopup_dynamic("Facebook Qt", "App Hidden")}
                  else {appSettings.saveSystemSetting ("hidden", ""); QMLUtils.showToTask();QMLUtils.shortpopup_dynamic("Facebook Qt", "App Showing")}
              }
          }
 }
     ListItemSenseSettings{
         id: rect14
         anchors.top: rect12.bottom
         anchors.topMargin: 2
         height: 70
         onClicked:{quickhelp.infotext("This option enables the Night Colours")}

         text: "Night Mode"
         Switch {
              anchors.right: parent.right
              anchors.rightMargin: 10
              anchors.verticalCenter: parent.verticalCenter
              checked: appSettings.saveSystemSetting("nightmodee", "")==="true"? true : false
              onClicked: {
                  if (appSettings.getSystemSetting("nightmodee", "")=== ""){

                      appSettings.saveSystemSetting("nightmodee", "true");
                      activateNightMode();
                      appSettings.saveSystemSetting("themee", "");
                      set_theme = false;
                      themeswitch.checked = false
                  }

                  else {appSettings.saveSystemSetting ("nightmodee", ""); deactivateNightMode()}
              }
          }
 }
     ListItemSenseSettings{
         id: rect9
         anchors.top: rect14.bottom
         anchors.topMargin: 2
         height: 60
             onClicked:{
                 creator.createComponent("CookieClearDialog.qml")
             }
             text: "Clear Cookies"


 }
     ListItemSenseSettings{
         id: rect10
         anchors.top: rect9.bottom
         anchors.topMargin: 2
         height: 60
             onClicked:{
                creator.createComponent("MediaKeysDialog.qml")
             }
             text: "Volume Keys Scrolling Settings"

 }
    ListItemSenseSettings{
         id: rect11
         anchors.top: rect10.bottom
         anchors.topMargin: 2
         height: 60
             onClicked:{
                 autoload()
             }
             text: "Auto Reload Settings"

 }
     ListItemSenseSettings{
         id: rect13
         anchors.top: rect11.bottom
         anchors.topMargin: 2
         height: 60
             onClicked:{fontSizer();}
             text: "Font Size"
 }
     ListItemSenseSettings{
         id: rect15
         anchors.top: rect13.bottom
         anchors.topMargin: 2
         height: 60
         onClicked:{userAgent();}
             text: "User Agent"
 }
     ListItemSenseSettings{
         id: rect16
         anchors.top: rect15.bottom
         anchors.topMargin: 2
         height: 60
         onClicked:{pageStack.push(Qt.resolvedUrl("NetworkProxyPage.qml"))}
             text: "Network Proxy"
 }
}
  }
