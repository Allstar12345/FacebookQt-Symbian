import QtQuick 1.1
import com.nokia.symbian 1.1
import "Component"
Rectangle {
    anchors.fill: parent
    color: platformInverted? "white": "black"
    id: imageviewer
    z: 5
    visible: true
    opacity: 0
    MouseArea{anchors.fill: parent;enabled: true}
    Behavior on opacity{NumberAnimation{}}
    property string url: web_view1.url
    Timer{id:killtimer; interval:200; onTriggered:{imageviewer.destroy()}}
    Component.onCompleted: {imageviewer.opacity=1}
    BottomBar{id: bar
        SenseToolButton{anchors.left: parent.left; onClicked: {imageviewer.opacity=0; killtimer.start();} imgsource: "toolbar-back"}
        SenseToolButton{anchors.centerIn: parent; imgsource:"toolbar-refresh"; onClicked:{img.source=""; img.source=url; bind.running=true}}
        SenseToolButton{imgsource: "images/save.svg";anchors.right: parent.right; onClicked: {  var filePath = QMLUtils.saveImage(img)
                if (filePath) QMLUtils.caKnLong(qsTr("Image saved in %1").arg(filePath))
                else QMLUtils.caKnLong(qsTr("Failed to save image"))}}
    }
    BusyIndicator{id: bind; running: true; Behavior on opacity {NumberAnimation{}}anchors.centerIn: parent; height: 60;width: 60;}
     Flickable{id: flick;contentHeight: img.height
         contentWidth: img.width;boundsBehavior: "DragOverBounds"
         flickableDirection: Flickable.AutoFlickDirection;anchors{top: parent.top;bottom: bar.top;right: parent.right; left: parent.left;}

    Image{
        id: img
        source: url
        anchors.centerIn: parent
        smooth: !flick.moving
        cache: false
        asynchronous: true
        fillMode: Image.PreserveAspectFit
        onSourceChanged: {console.debug("Source Changed"); console.log(img.source); }
        onStatusChanged: {if (img.status == Image.Ready) {bind.running=false;bind.opacity=0}}
    }
         }

}
