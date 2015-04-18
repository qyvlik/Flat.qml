/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FLatUI element FlatIcon
 *
*/
import QtQuick 2.3
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import FlatUI 2.0
import FlatUI.Private 2.0

Button {
    id: iconButton
    property int size : FlatGlobal.sizeDefault
    property FlatIconName icon
    implicitHeight: size;
    implicitWidth: size;
    iconSource: icon.defaultIcon
    style: ButtonStyle{ background: Rectangle { color: "transparent" } }
    MouseArea{
        anchors.fill: iconButton
        hoverEnabled: true
        onClicked: iconButton.clicked();
        onEntered: iconButton.iconSource =
                   Qt.binding(function(){return  icon.hoverIcon;});
        onExited: iconButton.iconSource =
                  Qt.binding(function(){return  icon.defaultIcon;});
    }
}
