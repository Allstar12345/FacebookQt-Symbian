// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
Rectangle{
    Component.onCompleted: {
        toolap.start()
    }
    z:2
    id: toolBar
    opacity: 0.800
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
    MouseArea{
        anchors.fill: parent
    }
}
