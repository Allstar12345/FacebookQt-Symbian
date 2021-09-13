// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

Menu {
     platformInverted: set_theme
     id: mainMenu
     Component.onCompleted: {
         open()
     }
     property bool __isClosing: false
     onStatusChanged: {
         if (status === DialogStatus.Closing) __isClosing = true
         else if (status === DialogStatus.Closed && __isClosing) mainMenu.destroy()
     }

     content: MenuLayout {
         MenuItem{
             platformInverted: set_theme
             text: autoreload.running == false? "Enable Auto Reload (30)": "Disable Auto Reload"
             onClicked:{
                 if(autoreload.running == true) {
                     autoreload.stop();
                     infoBanner.showText ("Auto Reload Disabled")
                 } else {
                     autoreload.start();
                     infoBanner.showText ("Auto Reload Enabled")
                 }
             }
         }
         MenuItem{
             platformInverted: set_theme
             text: "Hide Page"
                  onClicked: {
                      openhideview()
              }
         }
         MenuItem{
             platformInverted: set_theme
             text: web_view1.enabled == false ? "Disable Content Lock " : "Enable Content Lock"
             onClicked: {
                 if(web_view1.enabled == true) {
                   web_view1.enabled = false;
                 } else {
                  web_view1.enabled = true;
                 }

             }

         }
         MenuItem {
             platformInverted: set_theme
             text: "Enter External URL"
             onClicked: {openurlinput()}

     }
         MenuItem {
             platformInverted: set_theme
             text: "Settings"
             platformSubItemIndicator: true
             onClicked: pageStack.push(Qt.resolvedUrl("SettingsBasePage.qml"))

     }
         MenuItem{
             platformInverted: set_theme
             text: "Zoom"
             onClicked: openzoom()
         }
 }
}
