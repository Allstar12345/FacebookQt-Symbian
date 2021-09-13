// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "Component"

Rectangle {
    anchors.fill: parent
    color: platformInverted? "white": "black"
    QtObject { id: creator; property Component com: null;function createComponent (qmlfile){com = Qt.createComponent(qmlfile);com.createObject(proxset)} }

    Component.onDestruction: { console.debug ("Proxy Settings Destroyed")}

    function closePage(){
        appSettings.setNetworkProxyPort(portfield.text);
        appSettings.saveSystemSetting("proxyHostName", hostfield.text);
        appSettings.saveSystemSetting("proxyUser", userfield.text);
         appSettings.saveSystemSetting("proxyPassword", passwordfield.text);
        pageStack.pop();
    }
  /*  onWidthChanged: {if(screen.width===360) {
            if(portfield.focus===true){toolbar.appear()}}
        if(screen.width===640){
            if(portfield.focus===true){
            toolbar.disappear();}
        }
        if(screen.width===360) {
                    if(hostfield.focus===true){toolbar.appear()}}
                if(screen.width===640){
                    if(hostfield.focus===true){toolbar.disappear();}
                }
                if(screen.width===360) { if(userfield.focus===true){}}

    }*/

id: proxset
BottomBar{
    id: toolbar
    SenseToolButton {
        id: btnBac
        imgsource: "images/back.svg"
        tiptext: "Back"
        onClicked: {closePage();
     }
  }
}


ListHead {
    id: header
    z: 1
    anchors.top: parent.top
    text:"Network Proxy Settings"
}

Flickable {
    id: flickable
    anchors{top:header.bottom; bottom: toolbar.top;}
    width:parent.width
    contentHeight: parent.height
    flickableDirection: Flickable.VerticalFlick
    contentWidth: parent.width

   ListItemSense {
        enabled: false
        id: proxen
        text:"Network Proxy\n(restart needed)"

         Switch{
             id: proxCheck
             anchors.right: parent.right
             anchors.rightMargin: 1
             anchors.verticalCenter: parent.verticalCenter
             checked: appSettings.getSystemSetting("proxyEnabled", "false");
             onClicked: {
               if(appSettings.getSystemSetting("proxyEnabled", "false")==="true"){
                   appSettings.saveSystemSetting("proxyEnabled", "false"); appSettings.setNetworkProxyPort(portfield.text);
                   appSettings.saveSystemSetting("proxyHostName", hostfield.text);
                   appSettings.saveSystemSetting("proxyUser", userfield.text);
                    appSettings.saveSystemSetting("proxyPassword", passwordfield.text);
               }
               else{appSettings.saveSystemSetting("proxyEnabled", "true"); appSettings.setNetworkProxyPort(portfield.text);
                   appSettings.saveSystemSetting("proxyHostName", hostfield.text);
                   appSettings.saveSystemSetting("proxyUser", userfield.text);
                    appSettings.saveSystemSetting("proxyPassword", passwordfield.text);}
       }
    }
    }
   TextField{
       id:portfield
       anchors{ top:proxen.bottom;topMargin: 5;right:parent.right}
       placeholderText: "port";
       width: screen.width===640? 115:75
       errorHighlight: !text
       inputMethodHints: Qt.ImhDigitsOnly
       text: appSettings.getnetworkProxyPort();
       onActiveFocusChanged: {
           if(screen.height===480){}
           else{
           if(screen.height===360){
               if(portfield.focus===true){toolbar.disappear();}
               else if (portfield.focus===false){toolbar.appear();}
           }
           }
       }
   }
   TextField{
       id:hostfield
       width: screen.width===640? 510: 280
       anchors{top:proxen.bottom; topMargin: 5;  left:parent.left}
       placeholderText: "Host";
       errorHighlight: !text
       inputMethodHints: Qt.ImhNoPredictiveText
       text:appSettings.getSystemSetting("proxyHostName", "")
       onActiveFocusChanged: {
           if(screen.height===480){}
           else{         if(screen.height===360){
               if(hostfield.focus===true){toolbar.disappear();}
               else if (hostfield.focus===false){toolbar.appear();}
           }
           }
       }
   }
   TextField{
       id:userfield
       anchors{top:hostfield.bottom;topMargin: 5;  left:parent.left; }
       placeholderText: "User";
       inputMethodHints: Qt.ImhNoPredictiveText
       errorHighlight: !text
       width: screen.width===640? 320:180
       text:appSettings.getSystemSetting("proxyUser", "")
       onActiveFocusChanged: {
           if(screen.height===480){}
           else{
           if(screen.height===360){
               if(userfield.focus===true){toolbar.disappear();}
               else if (userfield.focus===false){toolbar.appear();}
           }
           }
       }

   }
   TextField{
       id:passwordfield
       inputMethodHints: Qt.ImhNoPredictiveText || Qt.ImhNoAutoUppercase
       anchors{top:hostfield.bottom; topMargin: 5; right:parent.right}
       placeholderText: "Password";
       echoMode: TextInput.Password
       errorHighlight: !text
       width: screen.width===640? 320:180
       text:appSettings.getSystemSetting("proxyPassword", "")
       onActiveFocusChanged: {
           if(screen.height===480){}
           else{
           if(screen.height===360){
               if(passwordfield.focus===true){toolbar.disappear();}
               else if (passwordfield.focus===false){toolbar.appear();}
           }
           }
       }
   }

   Item{
       id: bob
   }
}

}
