// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../"

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
    onWidthChanged: {
        if(screen.width === 640){base.height= 360}
        if (screen.width === 360){base.height= 400}
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
        color: nightMode? interfaceColourPressed:interfaceColour
        width: 300
        height:  if (screen.width === 640){
                     360
                 }
                 else{400}
        Flickable{
            id: flick
            clip: true
            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.StopAtBounds
            anchors.fill: parent
            contentWidth: parent.width
            contentHeight: 550
            Decorator{flickableItem: flick}

            ListItemSense{
                height: 50
                id: item1
                anchors.top: parent.top
                text: "Home"
                onClicked:{web_view1.url="http://mbasic.facebook.com/home.php";close();}
            }
            ListItemSense{
                height: 50
                id: item2
                anchors.top: item1.bottom
                text: "Friends"
                onClicked:{web_view1.url="http://mbasic.facebook.com/friends/";close();}
            }
            ListItemSense{
                height: 50
                id: item3
                anchors.top: item2.bottom
                text: "Messages"
                onClicked: {web_view1.url="http://mbasic.facebook.com/messages";close();}
            }
            ListItemSense{
                height: 50
                id: item4
                anchors.top: item3.bottom
                text: "Notifications"
                onClicked:{web_view1.url="http://mbasic.facebook.com/notifications.php";close();}
            }
            ListItemSense{
                height: 50
                id: item5
                anchors.top: item4.bottom
                text: "Chat"
                onClicked: {web_view1.url="http://mbasic.facebook.com/buddylist.php";close();}
            }
            ListItemSense{
                height: 50
                id: item6
                anchors.top: item5.bottom
                text: "Groups"
                onClicked: {web_view1.url="http://mbasic.facebook.com/groups/";close();}
            }
            ListItemSense{
                height: 50
                id: item7
                anchors.top: item6.bottom
                text: "Upload Photo"
                onClicked: {web_view1.url="http://mbasic.facebook.com/photos/upload/?upload_source=composer";close();}
            }
            ListItemSense{
                height: 50
                id: item8
                anchors.top: item7.bottom
                text: "Events"
                onClicked: {web_view1.url="http://mbasic.facebook.com/events";close();}
            }
            ListItemSense{
                height: 50
                id: item9
                anchors.top: item8.bottom
                text: "Pokes"
                onClicked: {web_view1.url="http://mbasic.facebook.com/pokes";close();}
            }
            ListItemSense{
                height: 50
                id: item10
                anchors.top: item9.bottom
                text: "Places"
                onClicked: {web_view1.url="http://mbasic.facebook.com/places/nearbyfriends.php";close();}
            }
            ListItemSense{
                height: 50
                id: item11
                anchors.top: item10.bottom
                text: "Facebook Settings"
                onClicked: {web_view1.url="http://mbasic.facebook.com/settings/";close();}
            }
        }
        }
}
