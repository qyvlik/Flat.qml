/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FLatUI element FlatComboBox
 *
*/
import QtQuick 2.3
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import FlatUI 2.0
import FlatUI.Private 2.0

ComboBox {
    property ActiveColor type : FlatGlobal.typePrimary
    property int size:FlatGlobal.sizeDefault
    editable:true;
    implicitWidth: 200;
    implicitHeight: showText.height+10;
    height: showText.height+10;

    style: ComboBoxStyle {
        dropDownButtonWidth:size
        textColor: showText.color
        renderType:Text.NativeRendering
        background: Rectangle { // button background
            radius: FlatGlobal.radius
            border.color: control.focus?type.activeColor:type.inactiveColor
            border.width: 1
        }
        font:showText.font;
    }
    Text{
        id:showText;
        text:"hello world";
        opacity: 0;
        font.family: FlatGlobal.font.family;
        font.pointSize: size
        color:type.activeColor;
    }
}

