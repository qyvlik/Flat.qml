import QtQuick 2.3
import QtQuick.Layouts 1.1
import QtMultimedia 5.4
import FlatUI 2.0
import FlatUI.Private 2.0

AbstractWindow{
    id:window
    MouseArea {
        z:window.z + 1
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        // 缩放
        width: 10
        height: 10
        property point previousPosition
        onPressed:  previousPosition = Qt.point(mouseX, mouseY);
        onPositionChanged: {
            if (pressedButtons == Qt.LeftButton) {
                var dx = mouseX - previousPosition.x;
                var dy = mouseY - previousPosition.y;
                var w = window.width+dx;
                var h = window.height+dy;
                if(w >= 400) window.width = w;
                if(h >= 200) window.height = h;
            }
        }
    }

    signal controlSiderBar()

    toolBar:Rectangle{
        id: titleBar;
        width: window.width;
        height: FlatGlobal.sizeExtraHuge

        Separator{orientation:Qt.Horizontal;length:titleBar.width;color:"#ccc"; }
        Separator{orientation:Qt.Vertical; length:titleBar.height; color:"#ccc"; anchors.right: titleBar.right; }
        Separator{ orientation: Qt.Vertical; length: titleBar.height; color:"#ccc"; anchors.left: titleBar.left; }
        Separator{ orientation: Qt.Horizontal; length: titleBar.width; color:"#ccc"; anchors.bottom: titleBar.bottom; }
        MouseArea {
            // 鼠标拖拽窗口移动
            id:__titlebarArea;
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
            onDoubleClicked: {
                window.showState <= FlatGlobal.showNormal ?
                            window.showState = FlatGlobal.showMaxmized :
                            window.showState = FlatGlobal.showNormal
            }
        }

        // menu
        RowLayout {
            spacing:10
            anchors.verticalCenter: titleBar.verticalCenter
            anchors.left: titleBar.left
            anchors.leftMargin: 10

            FlatIcon{
                icon:FlatGlobal.iconTypeMenu
                onClicked: controlSiderBar();
            }

            Text{
                font.family: FlatGlobal.font.family
                font.pointSize: FlatGlobal.sizeExtraSmall
                text:window.title
            }
        }

        // icon
        RowLayout {
            spacing:10
            anchors.verticalCenter: titleBar.verticalCenter
            anchors.right: titleBar.right
            anchors.rightMargin: 10
            FlatIcon{
                icon:FlatGlobal.iconTypeShowMin
                onClicked: window.showState = FlatGlobal.showMinmized;
            }
            FlatIcon{
                icon:FlatGlobal.iconTypeClose
                onClicked: window.showState = FlatGlobal.close;
            }
        }

    }

    onShowStateChanged: {
        switch(window.showState)
        {
        case FlatGlobal.showMaxmized:
            window.toolBar.visible = true;
            window.showMaximized();
            break;
        case FlatGlobal.showFullScreen:
            window.toolBar.visible = false;
            window.showFullScreen();
            break;
        case FlatGlobal.showNormal:
            window.toolBar.visible = true;
            window.showNormal();
            break;
            /* 这里有个逻辑错误，当某种原因窗口变小后，showstatus不会自动更新的 */
        case FlatGlobal.showMinmized:
            window.toolBar.visible = true;
            window.showMinimized();
            break;

        default:
            break;
        }
    }
    Component.onCompleted: window.requestActivate();
}

