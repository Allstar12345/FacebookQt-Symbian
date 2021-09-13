// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "Component"

Rectangle {
    id: root
    Behavior on opacity {NumberAnimation{duration: 200}}
    function close(){
        root.opacity=0
        kill.start()
    }
    Timer{
        id: kill
        interval: 200
        onTriggered:{
            root.destroy()
        }
    }

    Component.onCompleted: {
        root.opacity=0.8
    }
    anchors.fill: parent
    opacity: 0
    visible: true
    z: 5
    color: platformInverted? "white": "black"
    MouseArea{
        anchors.fill: parent
        onClicked: {
            close()
        }
    }

    Rectangle{
        z: 5
        id: base
        visible: true
        anchors.centerIn: parent
        color:  nightMode? interfaceColourPressed:interfaceColour
        width: 300
        height:  350

        Flickable{
            clip: true
            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.StopAtBounds
            anchors.fill: parent
            contentWidth: parent.width
            contentHeight: item1.height * 8

            ListItemSense{
                height: 50
                id: item1
                anchors.top: parent.top
                text: "Star Browser"
                onClicked:{Qt.openUrlExternally('https://allstarsoftware.co.uk/StarBrowser.html')}
            }
            ListItemSense{
                height: 50
                id: item2
                anchors.top: item1.bottom
                text: "Quick Mail"
                onClicked:{Qt.openUrlExternally('https://allstarsoftware.co.uk/QuickMail.html')}
            }
            ListItemSense{
                height: 50
                id: item3
                anchors.top: item2.bottom
                text: "Easy StopWatch"
                onClicked: {Qt.openUrlExternally('https://allstarsoftware.co.uk/EasyStopWatch.html')}
            }
            ListItemSense{
                height: 50
                id: item4
                anchors.top: item3.bottom
                text: "Websearch Ultimate"
                onClicked:{Qt.openUrlExternally('https://allstarsoftware.co.uk/WebSearchUltimate.html')}
            }

            ListItemSense{
                height: 50
                id: item6
                anchors.top: item4.bottom
                text: "GTranslate"
                onClicked: {
                Qt.openUrlExternally('https://allstarsoftware.co.uk/GTranslate.html')
            }
            }
            ListItemSense{
                height: 50
                id: item7
                anchors.top: item6.bottom
                text: "Websearch Duo"
                onClicked: {
                Qt.openUrlExternally('https://allstarsoftware.co.uk/WebSearchDuo.html')
            }
            }
            ListItemSense{
                height: 50
                id: item8
                anchors.top: item7.bottom
                text: "Netsearch Qt"
                onClicked: {
                 Qt.openUrlExternally('https://allstarsoftware.co.uk/NetsearchQt.html')
            }
            }
            ListItemSense{
                height: 50
                anchors.top: item8.bottom
                text: "All Others"
                onClicked: {
                 Qt.openUrlExternally('https://allstarsoftware.co.uk/')
            }
            }

        }

        }
}
