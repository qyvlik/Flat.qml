/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FLatUI element FlatCheckBox
 *
*/
import QtQuick 2.3
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import FlatUI 2.0
import FlatUI.Private 2.0

CheckBox {
    text: "Check Box"
    property ActiveColor type : FlatGlobal.typePrimary
    property int size:FlatGlobal.sizeDefault
    style: CheckBoxStyle {
        indicator: Rectangle {
            implicitWidth: size*2
            implicitHeight: size*2
            radius: FlatGlobal.radius;
            border.color:  control.checked ?type.activeColor:type.disableColor
            border.width: size / 8
            Rectangle {
                anchors.fill: parent
                color: (control.hovered && !control.checked)?
                           type.disableColor:
                           ( control.checked ?type.activeColor:"white")
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
