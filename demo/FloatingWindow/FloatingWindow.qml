/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
/*
 * 像360加速球
*/
import FlatUI 2.0
import QtQuick 2.4
import QtQuick.Controls.Styles 1.3
import QtQuick.Controls 1.3

ApplicationWindow{
    id:window
    width: 200
    height: 200
    flags: Qt.FramelessWindowHint | Qt.Popup // popup 屏幕上最高层次的窗体
    // @disable-check M16
    style:ApplicationWindowStyle{ background: Rectangle{ color:"transparent" } }
    color:"transparent"

    toolBar: Item{
        focus:true;
        Keys.onPressed: {
            if(event.key == Qt.Key_Escape) {
                event.accepted= true;
                window.destroy();
            }
        }
    }
    Rectangle{
        anchors.fill: parent
        color:"transparent"
        radius: window.width
        Text{
            CustomEmitter{ id:sys; anchors.fill: parent }
            anchors.fill: parent
            anchors.margins: 10
            font.family: FlatGlobal.font.family
            font.pointSize: FlatGlobal.sizeLarge
            color:"black"
            wrapMode: Text.WordWrap
            text:"360加速球"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

            MouseArea {
                // 鼠标拖拽窗口移动
                anchors.fill: parent
                hoverEnabled:true;
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
                onDoubleClicked: sys.running = true;
            }
        }
    }
}
