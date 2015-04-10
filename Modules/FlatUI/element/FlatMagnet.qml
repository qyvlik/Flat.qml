/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FLatUI element FlatMagnet
 *
 * you can try to completed it
 *
*/
import QtQuick 2.4
import FlatUI 2.0
import FlatUI.Private 2.0

MouseArea {
    id:magnet

    property alias text: text.text
    property alias textColor: text.color
    property alias font: text.font
    property alias backgroundColor:area.color
    property alias border: area.border

    implicitHeight: 200
    implicitWidth: 200

    Rectangle{
        id:area
        anchors.fill: parent
    }
    Text{
        id:text
        anchors.centerIn: parent
        font:FlatGlobal.font
    }
}
