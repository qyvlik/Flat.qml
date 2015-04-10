/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FLatUI element FlatMainWindow
 *
 * you can try to completed it
*/
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import FlatUI 2.0
import FlatUI.Private 2.0

Item{
    id:tip;

    height: tipArea.height + (sharp.width / 2) * 0.414
    width: 100
    anchors.margins: 0
    property int size : FlatGlobal.sizeDefault
    property ActiveColor type:FlatGlobal.typeInverse
    property alias text : tipText.text
    property point pos;

    MouseArea{
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XAndYAxis
    }

    Rectangle{
        id:tipArea;
        height: tipText.height + size
        width: tip.width
        color: type.activeColor
        radius: FlatGlobal.radius
        Text{
            id:tipText
            anchors.centerIn: tipArea;
            width: tipArea.width - size
            color:"white"
            wrapMode: Text.WrapAnywhere
            verticalAlignment: Text.AlignVCenter
            font.family: FlatGlobal.font.family
            font.pointSize: size
        }
        Rectangle{
            id:sharp
            height: 25
            width: 25
            rotation: 45
            color: type.activeColor
            z:parent.z - 1
            transformOrigin:Item.Center
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    function showOnTop(){
        tip.anchors.bottom = tip.parent.top;
    }

    function showOnBottom(){
        tip.anchors.top = tip.parent.bottom;
    }

    function showOnLeft(){
       tip.anchors.right = tip.parent.left;
    }

    function showOnRight(){
        tip.anchors.right = tip.parent.right;
    }
    function close(){
        tip.visible = false;
    }
}

