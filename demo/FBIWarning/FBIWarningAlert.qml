/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/

import FlatUI 2.0
import FlatUI.Private 2.0 // to use private element AbstructWindow
import QtQuick 2.4
import QtQuick.Controls.Styles 1.3

AbstractWindow{
    id:window
    width: 500
    height: 250
    // @disable-check M16
    style:ApplicationWindowStyle{ background: Rectangle{ color:"black" } }

    toolBar:Rectangle{
        id:titleBar
        width: window.width
        height:60
        color:"black"
        FlatButton{
            anchors.centerIn: parent
            type:FlatGlobal.typeDanger
            text:"FBI WARNING"
        }

        MouseArea {
            // 鼠标拖拽窗口移动
            id:__titlebarArea
            anchors.fill: titleBar
            property point previousPosition
            onPressed:  previousPosition = Qt.point(mouseX, mouseY);
            onPositionChanged: {
                if (pressedButtons == Qt.LeftButton) {
                    var dx = mouseX - previousPosition.x;
                    var dy = mouseY - previousPosition.y;
                    window.x = window.x + dx;
                    window.y = window.y + dy;
                }
            }
        }
        focus:true;
        Keys.onPressed: {
            if(event.key == Qt.Key_Escape) {
                event.accepted= true;
                window.showState = FlatGlobal.close;
            }
        }
    }

    contentControl.anchors.margins: 10
    content: Text{
        font.family: FlatGlobal.font.family
        font.pointSize: FlatGlobal.sizeDefault
        color:"white"
        wrapMode: Text.WordWrap
        text:"Federal law provides severe civil and criminal penalties for the unauthorized reproduction,distribution ,or exhibition of copyrighted motion pictures (title 17,united states code,sections 501 and 508),the federal bureau of investigation investigates allegations of criminal copyright infringement \n(title 17,united states code,section 506)"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}

