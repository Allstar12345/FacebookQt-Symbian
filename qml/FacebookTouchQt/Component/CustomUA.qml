// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "../"

CommonDialog {
        id: root
        property bool __isClosing: false
            onStatusChanged: {
                if (status === DialogStatus.Closing) __isClosing = true
                else if (status === DialogStatus.Closed && __isClosing) root.destroy()
            }
        Component.onCompleted: {
            open()
        }
        titleText: "Custom User Agent"
        height: 50
        privateCloseIcon: true
        buttonTexts: ["Save"]
        onButtonClicked:{
            appSettings.saveUserAgent("Custom");
            appSettings.saveCustomUserAgent(urlua.text);
            UserAgent.update()
            QMLUtils.longpopup_dynamic("", "Custom User Agent Set")
        }
        content: Item {
            anchors.fill: parent
            TextField {
                focus: true
                objectName: "urltitle"
                id: urlua
                errorHighlight: urlua.text? false: true
                text: appSettings.getSystemSetting("customuastring", "") ===""? "": appSettings.getSystemSetting("customuastring", "")
                placeholderText: "Enter String Here"
                anchors.fill: parent
                width: parent.width - 20
}
}
}
