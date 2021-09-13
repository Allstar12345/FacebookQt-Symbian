import Qt 4.7
Rectangle {
    id: nightcover
    visible: false
    anchors.fill: parent
    color: "black"
    opacity: appSettings.getSystemSetting("nightcoveropa", "")===""? "0.700": appSettings.getSystemSetting("nightcoveropa", "")
    z: 5
}
