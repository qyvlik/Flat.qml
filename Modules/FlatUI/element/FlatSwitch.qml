/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FLatUI element FlatSwitch
 *
*/
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import FlatUI 2.0
import FlatUI.Private 2.0

Switch {
    id:s;
    property ActiveColor type : FlatGlobal.typeInverse
    property int size: FlatGlobal.sizeDefault
    style: SwitchStyle {
        groove: Rectangle {
            implicitWidth: s.size *5;
            implicitHeight: s.size *2;
            radius: width;
            color:control.checked ? type.activeColor :type.disableColor
        }
        handle:Rectangle{
            radius: height;
            width: height;
            color: control.checked ? FlatGlobal.colorGreenSea : FlatGlobal.colorConcrete
            border.color: control.checked ? type.activeColor :type.disableColor;
            border.width: size / 4
            Text{
                anchors.right: parent.left
                anchors.verticalCenter: parent.verticalCenter
                text:"ON"
                font.family: FlatGlobal.font.family
                font.pointSize:  size - 5;
                color:"white"
                opacity: control.checked ? 1 : 0 ;
            }
            Text{
                anchors.left: parent.right
                anchors.verticalCenter: parent.verticalCenter
                text:"OFF"
                font.family: FlatGlobal.font.family
                font.pointSize: size - 5;
                color:"white"
                opacity: !control.checked ? 1 : 0 ;
            }
        }
    }
}
