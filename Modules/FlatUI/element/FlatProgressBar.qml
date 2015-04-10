/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FLatUI element FlatProgressBar
 *
*/
import QtQuick 2.3
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import FlatUI 2.0
import FlatUI.Private 2.0

ProgressBar {
    maximumValue : 100;
    minimumValue :0;
    implicitHeight:FlatGlobal.sizeSmall;
    height:FlatGlobal.sizeSmall;
    property ActiveColor type : FlatGlobal.typePrimary;

    style: ProgressBarStyle {
        background: Rectangle {
            radius: FlatGlobal.radius
            color: FlatGlobal.colorClouds;
            implicitWidth: 200
            implicitHeight: 24
        }
        progress: Rectangle {
            radius: FlatGlobal.radius
            color: type.activeColor;
            border.color: "steelblue"
        }
    }
}
