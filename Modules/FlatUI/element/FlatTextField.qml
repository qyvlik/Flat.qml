/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FLatUI element FlatTextField
 *
*/
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import FlatUI 2.0
import FlatUI.Private 2.0

TextField {
    id:textField;
    placeholderText:"TextField";
    property alias size :showText.font.pointSize;
    property ActiveColor type:FlatGlobal.typePrimary;

    implicitWidth: 200;
    implicitHeight: showText.height+10;
    height: showText.height+10;

    style: TextFieldStyle {
        textColor: showText.color;
        background: Rectangle {
            radius: FlatGlobal.radius
            implicitWidth: 100
            implicitHeight: 24
            border.color: textField.focus?type.activeColor:type.inactiveColor
            border.width: textField.focus?2:1
        }
        placeholderTextColor:"#ccc";
        font:showText.font;

    }
    Text{
        id:showText;
        text:"hello world";
        opacity: 0;
        font.family: FlatGlobal.font.family;
        font.pointSize: FlatGlobal.sizeDefault;
        color:type.activeColor;
    }
}
