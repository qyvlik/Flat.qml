/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FLatUI element FlatRadio
 *
*/
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import FlatUI 2.0
import FlatUI.Private 2.0

RadioButton {
    text: "Radio Button"
    property ActiveColor type : FlatGlobal.typePrimary
    property int size:FlatGlobal.sizeDefault
    style: RadioButtonStyle {
        indicator: Rectangle {
            implicitWidth: size*2
            implicitHeight: size*2
            radius: size
            border.color:  control.checked ?type.activeColor:type.disableColor
            border.width: size / 8
            Rectangle {
                anchors.fill: parent
                color: (control.hovered && !control.checked)
                       ? type.disableColor:
                         ( control.checked ? type.activeColor:"white")
                radius: size
                anchors.margins: size * 0.4
            }
        }
        background:Rectangle{
            color:"transparent"
        }
        label:Text{
            text:control.text;
            font.family: FlatGlobal.font.family;
            font.pointSize: size
        }
    }
}
