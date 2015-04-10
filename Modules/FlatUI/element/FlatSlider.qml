/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FLatUI element FlatSlider
 *
*/
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import FlatUI 2.0
import FlatUI.Private 2.0

Slider {
    id:slider;
    property ActiveColor type : FlatGlobal.typePrimary;
    property int size:FlatGlobal.sizeExtraSmall;

    implicitWidth:size*20;
    implicitHeight:size;
    height:size;
    width:size*20;

    style: SliderStyle {
        groove: Rectangle {
            implicitWidth: 200
            implicitHeight: size
            color: FlatGlobal.colorSilver
            radius: implicitHeight
            Rectangle{
                height: parent.height
                radius:size
                implicitWidth:size
                width: styleData.handlePosition + size * 0.5 // 进度条
                color:type.defaultColor
            }
        }
        handle: Rectangle {
            anchors.centerIn: parent
            color: control.pressed ? type.activeColor : type.inactiveColor
            implicitWidth: size
            implicitHeight: size
            radius: size
            border.width: 1;
            border.color: type.activeColor
        }
    }
}

