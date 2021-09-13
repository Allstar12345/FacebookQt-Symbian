import QtQuick 1.1
import WebViewCustom 1.0
import "Component"

Rectangle {
    id: signup
    anchors.fill: parent
    color: platformInverted? "white": "black"
    property Component __zoom: null
    function openzoom(){
        if (!__zoom) __zoom = Qt.createComponent("Component/ZoomPopup.qml")
            __zoom.createObject(signup)
    }
    BottomBar{
        id: toolbar
        SenseToolButton {
            anchors.left: parent.left
            anchors.leftMargin: 1
            id: toolbuttonExit
            imgsource: "toolbar-home"
            onClicked: {
               pageStack.pop();
               signup.destroy();

        }
        }
        SenseToolButton {
            anchors.left: toolbuttonExit.right
            anchors.leftMargin: 50
            id: toolbuttonPrevious
            imgsource: "toolbar-previous"
            onClicked: {
                web_view1.back.trigger();
            }
        }

        SenseToolButton {
            id: toolbuttonReload
            anchors.right: zoom.left
            anchors.rightMargin: 50
            imgsource: "toolbar-refresh"
            onClicked: {
                   web_view1.reload.trigger();
            }
        }
        SenseToolButton {
            anchors.right: parent.right
            anchors.rightMargin: 1
            id: zoom
            imgsource: "toolbar-search"
            imagerotation: 90
            onClicked: {
                openzoom()
            }
        }
    }


    Flickable {
        id: flickable1
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: toolbar.top
        anchors.top: parent.top
        contentHeight: web_view1.height
        contentWidth: web_view1.width
        maximumFlickVelocity: 3000
        flickDeceleration: 1750
        boundsBehavior: "DragOverBounds"
        flickableDirection: Flickable.AutoFlickDirection
        //flickDeceleration: 01
        //maximumFlickVelocity: 1000
        onWidthChanged : {
                 // Expand (but not above 1:1) if otherwise would be smaller that available width.
                 if (width > web_view1.width*web_view1.contentsScale && web_view1.contentsScale < 1.0)
                     web_view1.contentsScale = width / web_view1.width * web_view1.contentsScale;
             }
             onFocusChanged: { if ( focus ) web_view1.focus = true; }
             onMovementStarted: web_view1.renderingEnabled = false;

             onMovementEnded: web_view1.renderingEnabled = true;



        Decorator {
             id: scrolldecorator
             platformInverted: set_theme
             flickableItem: flickable1
         }

        WebViewCustom {
            id: web_view1
            smooth: false
            url: "http://en-gb.facebook.com/r.php"
            settings.offlineStorageDatabaseEnabled : false
            settings.offlineWebApplicationCacheEnabled : false
            settings.localStorageDatabaseEnabled : false
            settings.javascriptCanAccessClipboard : true
            settings.autoLoadImages: set_img
            preferredHeight: flickable1.height
            preferredWidth: flickable1.width
            contentsScale: 1
            visible: true
            onLoadStarted: {fadingloader.start()}
            onLoadFailed: {fadingloader.stop()}
            onLoadFinished: {fadingloader.stop(); web_view1.evaluateJavaScript("\
                        if (!document.body.style.backgroundColor)  { \
                            document.body.style.backgroundColor='white';\
                        }\
                    ");}

    }
}
    Rectangle {
            id: loadingBG
            color: "#000000"
            opacity: 0.680
            visible: web_view1.progress < 1.0 ? set_pgeload : false
            anchors.fill: parent

            FadingLoader{
                id: fadingloader

            Text {
                    id: progtext
                    color: "#ffffff"
                    text: Math.round(web_view1.progress*100) + "%"
                    clip: true
                    visible: true
                    font.bold: true
                    styleColor: "#9e9e9e"
                    style: Text.Raised
                    anchors.centerIn: parent
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    z: 2
                    font.pixelSize: 40
                }
            }
        }

}

