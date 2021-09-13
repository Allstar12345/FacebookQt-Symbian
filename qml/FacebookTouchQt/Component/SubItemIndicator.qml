// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
Image{
        source:  privateStyle.imagePath("qtg_graf_drill_down_indicator")
        id: itemIndicator
        smooth: true
        mirror: LayoutMirroring.enabled
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 6
        sourceSize.width: platformStyle.graphicSizeSmall
        sourceSize.height: platformStyle.graphicSizeSmall
    }
