import QtQuick 1.1
import com.nokia.symbian 1.1

Page{
    id: privacy
    Component.onCompleted: {
        toolap.start()
    }

    Rectangle{
        z:2
        opacity: 0.800
        id: toolBar
        color: platformInverted? "light grey": "black"
        implicitHeight: (screen.width < screen.height)
            ? privateStyle.toolBarHeightPortrait
            : privateStyle.toolBarHeightLandscape

        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            bottomMargin: -60
        }
        PropertyAnimation{
        id: toolap
        duration: 600
        to: 0
        property : "anchors.bottomMargin"
        target: toolBar
        }

        ToolButton {
            id: toolbuttonback
             platformInverted: set_theme
            iconSource: "toolbar-back"
            onClicked: {
                pageStack.pop();
                privacy.destroy();
            }
        }

}


    TextArea {
        id: privacytext
        focus: true
        platformInverted: set_theme
        enabled: false
        text: "Privacy:

No data is saved by this Application, All data is yours and yours only."

        width: parent.width
        anchors{
            left: parent.left
            right: parent.right
            bottom: toolBar.top
            top: parent.top
        }
    }



}






