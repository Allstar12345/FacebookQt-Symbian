// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "Component"

Rectangle{
    id: urlinput
    z: 5
    color: "black"
    visible: false
    height: 80
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    Component.onCompleted: {
        urlinput.visible=true
    }

    TextField{
        id: field1
        anchors.left: parent.left
        anchors.right: gobut.left
        anchors.top: parent.top
        anchors.topMargin: 3
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 3
        placeholderText: "Enter URL Here"
        onTextChanged:{
            if(field1.text == "") {
                gobut.imgsource= "images/close_stop.svg"
            } else {
                  gobut.imgsource= "toolbar-back"

            }

        }
    }

      SenseToolButton{
        id: gobut
        rotation: 180
        imgsource: "images/close_stop.svg"
        anchors.right: parent.right
        anchors.rightMargin: 1
        anchors.verticalCenter: parent.verticalCenter
        onClicked:{
            if (field1.text == ""){urlinput.destroy()}
            else{
                web_view1.url= field1.text;
                urlinput.visible= false
                urlinput.destroy()
            }

        }
    }
}
