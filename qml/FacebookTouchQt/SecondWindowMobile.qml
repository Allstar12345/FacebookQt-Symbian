import QtQuick 1.1
import WebViewCustom 1.0
import "./js/settings.js" as Setting
import "Component"
Rectangle {
    anchors.fill: parent
    color: platformInverted? "white": "black"
    id: mobilepage
    visible: true
    z: 5
    MouseArea{anchors.fill:parent;enabled:true}

    property bool applicationActive: Qt.application.active
    onApplicationActiveChanged: {
            if(applicationActive) {
                console.debug ("logged")
            } else {
                if(autoreload.running===true){
                 QMLUtils.longpopup_dynamic("Warning", "Auto Reload is enabled")}
            }
    }
     property Component __zoom: null
     property Component __hide: null
    property Component __menu: null
    property Component __input: null
    property Component __test: null
    property Component __nci: null
    function openNCI(){
        if (!__nci) __nci = Qt.createComponent("Component/NightIntensityToggle.qml")
            __nci.createObject(mobilepage)
    }

    function openzoom(){
        if (!__zoom) __zoom = Qt.createComponent("Component/ZoomPopup.qml")
            __zoom.createObject(mobilepage)
    }
    function openhideview(){

        if (!__hide) __hide = Qt.createComponent("HideView.qml")
            __hide.createObject(mobilepage)
    }
    function openmenu(){

        if (!__menu) __menu = Qt.createComponent("Component/SecondWindowMenu.qml")
            __menu.createObject(mobilepage)
    }
    function openurlinput(){
        if (!__input) __input = Qt.createComponent("UrlInput.qml")
            __input.createObject(mobilepage)
    }

  Timer {
      id: longpress
      interval: 5
      repeat: true
      onTriggered: {
          if (mediakeysobserver.key == MediaKeysObserver.EVolIncKey) {
              if (flickable1.contentY===0){} else{scrollTo(1,-300)}
          }
          else if (mediakeysobserver.key == MediaKeysObserver.EVolDecKey) {
               scrollTo(1,300)

          }
      }
  }


  function scrollTo(velocity, distance)
  {
      if(flickable1.contentY+distance>=0 && flickable1.contentY+distance<=flickable1.contentHeight)
      {
          scrollanimation.from = flickable1.contentY;
          scrollanimation.to = flickable1.contentY+distance
          scrollanimation.start()
      }
      if(flickable1.contentY+distance<0)
      {
          scrollanimation.from = flickable1.contentY;
          scrollanimation.to = 0
          scrollanimation.start()
      }
      if(flickable1.contentY+distance>flickable1.contentHeight - flickable1.height)
      {
          scrollanimation.from = flickable1.contentY;
          scrollanimation.to = flickable1.contentHeight - flickable1.height
          scrollanimation.start()
      }
  }

 SmoothedAnimation {id: scrollanimation; target: flickable1; property: "contentY"; duration: 800; easing.type: Easing.InOutQuart }

    function checkForAnchor(scrollObject,webOject,url){
            var a = new String(url);
            if (a.split("#").length > 1){
                var textPosition = webOject.evaluateJavaScript("document.getElementById('"+a.split("#")[1]+"').getClientRects()");
                if (textPosition == 'undefined'){
                    evaluateJavaScript('function getElementsByAttribute(oElm, strTagName, strAttributeName, strAttributeValue){\
                                           var arrElements = (strTagName == "*" && oElm.all)? oElm.all : oElm.getElementsByTagName(strTagName);\
                                           var arrReturnElements = new Array();\
                                           var oAttributeValue = (typeof strAttributeValue != "undefined")? new RegExp("(^|\\s)" + strAttributeValue + "(\\s|$)", "i") : null;\
                                           var oCurrent;\
                                           var oAttribute;\
                                           for(var i=0; i<arrElements.length; i++){\
                                           oCurrent = arrElements[i];\
                                           oAttribute = oCurrent.getAttribute && oCurrent.getAttribute(strAttributeName);\
                                           if(typeof oAttribute == "string" && oAttribute.length > 0){\
                                           if(typeof strAttributeValue == "undefined" || (oAttributeValue && oAttributeValue.test(oAttribute))){\
                                           arrReturnElements.push(oCurrent);\
                                           }\
                                           }\
                                           }\
                                           return arrReturnElements;\
                                      }')
                    textPosition = webOject.evaluateJavaScript('getElementsByAttribute(document,"*", "title", "'+a.split("#")[1]+'")[0].getClientRects()')
                }
                if (textPosition != undefined){
                    scrollObject.contentY = textPosition[0]["top"];
                }
            }
        }
    Timer {
        id: autoreload
        interval: appSettings.getSystemSetting("timerduration", ""); running: false; repeat: true
             onTriggered: {
                 web_view1.reload.trigger();
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
        onWidthChanged : {
                 // Expand (but not above 1:1) if otherwise would be smaller that available width.
                 if (width > web_view1.width*web_view1.contentsScale && web_view1.contentsScale < 1.0)
                     web_view1.contentsScale = width / web_view1.width * web_view1.contentsScale;
             }
             onFocusChanged: { if ( focus ) web_view1.focus = true; }
             onMovementStarted: web_view1.renderingEnabled = false;
             onMovementEnded: web_view1.renderingEnabled = true;


        PinchArea{
            enabled: set_pinch
            id: pinchArea
            anchors.fill: parent
            property bool pinchDragged:false
            pinch.minimumScale: 0.0
            pinch.maximumScale: 2.0
                      onPinchStarted: {
                       web_view1.renderingEnabled=false
                       flickable1.zoomActive=true
                    }
                    onPinchUpdated: {
                        if (web_view1.contentsScale<1.0){web_view1.contentsScale= 1.0
                        flickable1.contentY= 0
                        flickable1.contentX= 0}
                               web_view1.doPinchZoom(pinch.scale/pinch.previousScale,pinch.center,pinch.previousCenter)
                            }
                    onPinchFinished: {
                              if(contentX<0 || contentY<0){
                                 var sc = web_view1.contentsScale
                                 if(web_view1.contentsScale*web_view1.width<flickable1.width){
                                    sc=flickable1.width/(web_view1.width/web_view1.contentsScale)
                                 }
                                 var vx=Math.max(0,contentX)+(flickable.width/1.3)
                                 var vy=Math.max(0,contentY)+(flickable.height/1.3)

                                 web_view1.doZoom(sc,vx,vy);
                              }else{
                                 web_view1.renderingEnabled=true;
                                 flickable1.zoomActive=false;
                              }

                           }
        Decorator {
             platformInverted: set_theme
             flickableItem: flickable1
         }
        WebViewCustom {
            id: web_view1
            smooth: false
            url: "http://mbasic.facebook.com"
            settings.offlineStorageDatabaseEnabled : false
            settings.offlineWebApplicationCacheEnabled : false
            settings.localStorageDatabaseEnabled : true
            settings.javascriptCanAccessClipboard : true
            settings.autoLoadImages: set_img
            preferredHeight: flickable1.height
            preferredWidth: flickable1.width
            visible: true
            javaScriptWindowObjects: QtObject {
                       WebViewCustom.windowObjectName: "qml"

                       function showKeyboard() {
                           console.log("Show the keyboard");
                           scrollup.anchors.bottomMargin=400
                       }
                       function hideKeyboard() {
                           console.log("Hide the keyboard");
                       }
                   }
            function fixbackground (){
                web_view1.evaluateJavaScript("\
                        if (!document.body.style.backgroundColor)  { \
                            document.body.style.backgroundColor='white';\
                        }\
                    ");
            }

            onLoadStarted: { web_view1.evaluateJavaScript("var inputs = document.getElementsByTagName('INPUT');var index;for(index=0; index < inputs.length; index++){inputs[index].onfocus = function() {window.qml.showKeyboard()};inputs[index].onblur = function() {window.qml.hideKeyboard()}}");appSettings.saveSystemSetting("url", web_view1.url);fadingloader.start() }
            onLoadFinished: {
                 web_view1.evaluateJavaScript("var inputs = document.getElementsByTagName('INPUT');var index;for(index=0; index < inputs.length; index++){inputs[index].onfocus = function() {window.qml.showKeyboard()};inputs[index].onblur = function() {window.qml.hideKeyboard()}}")
                checkForAnchor(flickable1,web_view1,url)
                fixbackground ();

            }

             onLoadFailed: {
                  web_view1.evaluateJavaScript("var inputs = document.getElementsByTagName('INPUT');var index;for(index=0; index < inputs.length; index++){inputs[index].onfocus = function() {window.qml.showKeyboard()};inputs[index].onblur = function() {window.qml.hideKeyboard()}}")
                 if(applicationActive == false){QMLUtils.longpopup_dynamic("Facebook Qt", "Loading Error !")}
                 fadingloader.stop()
                 web_view1.url=  appSettings.getSystemSetting("url", "")
                 console.log ("LOADING FAILED "+ web_view1.url)}
                 function doZoom(zoom,centerX,centerY)

                     {

                if (centerX) {
                    var sc = zoom/contentsScale;
                    scaleAnim.to = zoom;
                    flickVX.from = flickable1.contentX
                    flickVX.to = Math.max(0,Math.min(centerX-flickable1.width/1.3,web_view1.width*sc-flickable1.width))
                    finalX.value = flickVX.to
                    flickVY.from = flickable1.contentY
                    flickVY.to = Math.max(0,Math.min(centerY-flickable1.height/1.3,web_view1.height*sc-flickable1.height))
                    finalY.value = flickVY.to
                  quickZoom.start()
                 }
             }

                     function doPinchZoom(zoom,center,centerPrev)
                     {
                        var sc=zoom*contentsScale
                        if(sc<=10 ){

                           flickable1.contentX=(center.x*zoom)-(center.x-flickable1.contentX)+(centerPrev.x-center.x)
                           flickable1.contentY=(center.y*zoom)-(center.y-flickable1.contentY)+(centerPrev.y-center.y)
                           contentsScale=sc
                        }

        }
    }

        }
}
    BottomBar{
        id: toolbar

        SenseToolButton{
            id: toolbuttonHome
            anchors.left: parent.left
            anchors.leftMargin: 1
            imgsource: "toolbar-back"
            onClicked: {
             loader.visible=false;
            }
            onPlatformPressAndHold: {
              web_view1.url= "http://mbasic.facebook.com"
            }
        }
        SenseToolButton {
            id: toolbuttonPrevious
            anchors.left: parent.left
            anchors.leftMargin: 75
            tiptext: "Back"
            imgsource: "toolbar-previous"
            onClicked: {
                web_view1.back.trigger();
            }
        }

        SenseToolButton {
            id: toolbuttonStop
            tiptext: web_view1.progress < 1.0 ? "Stop" : "Reload"
            anchors.left: parent.left
            anchors.leftMargin: 135
            anchors.right: parent.right
            anchors.rightMargin: 135
            imgsource: web_view1.progress < 1.0 ? "toolbar-mediacontrol-stop" : "toolbar-refresh"
            onClicked: {
                web_view1.progress < 1.0 ? web_view1.stop.trigger() : web_view1.reload.trigger()
            }
        }

        SenseToolButton {
            id: toolbuttonNext
            tiptext: "Forward"
            anchors.right: parent.right
            anchors.rightMargin: 75
            imgsource: "toolbar-next"
            onClicked: {
                   web_view1.forward.trigger();
            }
        }


        SenseToolButton {
            tiptext: "Menu"
            id: toolbuttonBottomMenu
            anchors.right: parent.right
            anchors.rightMargin: 1
            imgsource: "toolbar-menu"
            onClicked: {
                openmenu()
            }
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

    SenseButton {
         id: scrolldown
         height: 53
         width: 55
         anchors.bottom: parent.bottom
         anchors.bottomMargin: 79
         border.color: "white"
         border.width: 2
         visible: set_scrollbut
         anchors.right: parent.right
         anchors.rightMargin: 6
         text: "^"
         rotation: 180
         opacity: 0.435
         onClicked: {
    flickable1.contentY += 45
 }

 }
     SenseButton {
          id: scrollup
          height: 53
          width: 55
          anchors.bottom: parent.bottom
          anchors.bottomMargin: 138
          border.color: "white"
          border.width: 2
          visible: set_scrollbut
          anchors.right: parent.right
          anchors.rightMargin: 6
          text: "^"
          opacity: 0.435
          onClicked: {
     flickable1.contentY -= 45
  }
      onHold: {
          flickable1.contentY = 0
      }
  }

}

