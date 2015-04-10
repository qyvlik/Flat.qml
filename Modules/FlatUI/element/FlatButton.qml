/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FLatUI element FlatButton
 *
*/
import QtQuick 2.3
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import FlatUI 2.0
import FlatUI.Private 2.0

Button {
    id:button

    text:"Flat Button"

    property int size : FlatGlobal.sizeDefault
    property ActiveColor type:FlatGlobal.typePrimary

    readonly property color beforePressColor: type.inactiveColor
    readonly property color afterPressColor: type.activeColor

    property bool iconOnLeft:true;

    style: ButtonStyle {
        background:Rectangle{
            anchors.fill: parent;
            radius:FlatGlobal.radius;
            color:button.pressed?afterPressColor:beforePressColor
        }
        label:Row{
            spacing: size
            Image{
                width: size
                height: size
                source:button.iconSource
                visible: iconOnLeft ? ((button.iconSource == "") ? false : true ):false
                anchors.verticalCenter: parent.verticalCenter
            }
            Text{
                text:button.text
                font.pointSize: button.size
                font.family: FlatGlobal.font.family
                horizontalAlignment: Text.AlignHCenter
                color:"white";
                anchors.verticalCenter: parent.verticalCenter
            }
            Image{
                width: size
                height: size
                source:button.iconSource
                visible: !iconOnLeft ? ((button.iconSource == "") ? false : true ):false;
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

//    property bool __haveMenu:false;
//    onMenuChanged: {
//        if(button.menu != null)  __haveMenu = true;
//        else  __haveMenu = false;
//    }
}

