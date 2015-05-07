/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import FlatUI 2.0

FlatDialog{
    id:errorDialog
    title:"Error"
    property string errorString
    content: Item{
        Text{
            id:text
            width: parent.width
            text:errorDialog.errorString;
            anchors.margins: 10
            wrapMode: Text.WordWrap
            font:FlatGlobal.font
            color:FlatGlobal.colorAlizarin
            onHeightChanged: {
                errorDialog.setHeight(text.height * 1.5);
            }
        }
    }
}
