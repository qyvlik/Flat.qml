/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FlatUI.Private element
 *
 * this qml file (element type) just for build module
 * not allow used by user
 * private
*/
import QtQuick 2.4
import FlatUI 2.0
import FlatUI.Private 2.0

Item{
    property alias text: text.text
    property alias textColor: text.color
    property alias backgroundColor:area.color

    signal clicked(MouseEvent mouse)
    signal doubleClicked(MouseEvent mouse)
    signal entered
    signal exited
    signal pressAndHold(MouseEvent mouse)
    signal pressed(MouseEvent mouse)
    signal released(MouseEvent mouse)
    signal wheel(WheelEvent wheel)

    signal dropped(DragEvent drop)
    signal entered(DragEvent drag)
    signal positionChanged(DragEvent drag)

    Rectangle{
        id:area
        anchors.fill: parent
    }
    Text{
        id:text
        anchors.centerIn: parent
        font:FlatGlobal.font
    }

    MouseArea{
        anchors.fill: parent
    }

    DropArea{
        width: parent.width
        height: parent.height
        drag.source : parent
    }
}
