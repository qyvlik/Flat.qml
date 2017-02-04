/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FLatUI element FlatMainWindow
 *
*/
import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Layouts 1.1
import FlatUI 2.0
import FlatUI.Private 2.0

AbstractWindow{
    id:window
    // 使用Component.incubateObject() 加载根类型为Window的控件时
    // 务必设置控件的根对象的visiblle属性为true
    visible: true
    // 0,1,2,3,4 show, showNormal, showFullScreen, showMaxmized, showMinmized;
    onShowStateChanged: {
        switch(window.showState)
        {
        case FlatGlobal.showMaxmized:
            window.showMaximized();
            break;
        case FlatGlobal.showFullScreen:
            window.showFullScreen();
            break;
        case FlatGlobal.showNormal:
            window.showNormal();
            break;
/*
  这里有个逻辑错误，当某种原因窗口变小后，showstatus不会自动更新的
*/
        case FlatGlobal.showMinmized:
            window.showMinimized();
            break;

        default:
            break;
        }
    }
    titleBarIcons: GridLayout {
        id: windowButtonSystem
        columns: 3

        FlatIcon {
            id: minimizeButton
            icon: FlatGlobal.iconTypeShowMin
            onClicked : window.showState = FlatGlobal.showMinmized;
        }

        FlatIcon {
            id: maxButton
            icon: (window.showState > FlatGlobal.showNormal) ?
                      FlatGlobal.iconTypeShowMax : FlatGlobal.iconTypeShowRestore
            onClicked : {
                switch(window.showState){
                case FlatGlobal.showMaxmized:
                    window.showState = FlatGlobal.showNormal;
                    maxButton.icon = FlatGlobal.iconTypeShowRestore;
                    break;
                case FlatGlobal.showFullScreen:
                    window.showState = FlatGlobal.showNormal;
                    maxButton.icon = FlatGlobal.iconTypeShowRestore;
                    break;
                case FlatGlobal.showNormal:
                    window.showState = FlatGlobal.showMaxmized;
                    maxButton.icon = FlatGlobal.iconTypeShowMax;
                    break;
                default:
                    window.showState = FlatGlobal.showMaxmized;
                    maxButton.icon = FlatGlobal.iconTypeShowMax;
                    break;
                }
            }
        }

        FlatIcon {
            id: colseButton
            icon: FlatGlobal.iconTypeClose
            onClicked : {
                window.showState = FlatGlobal.close;
            }
        }
        focus:true
        Keys.onPressed: {
            if(event.key == Qt.Key_F11){
                event.accepted = true;
                window.showState = FlatGlobal.showFullScreen;
            }
            if(event.key == Qt.Key_Escape){
                event.accepted = true;
                window.showState = FlatGlobal.showNormal;
            }
        }
    }

    titleBarArea.onDoubleClicked: {
        if(window.showState > FlatGlobal.showNormal) {
            window.showState = FlatGlobal.showNormal;
        } else {
            window.showState = FlatGlobal.showMaxmized;
        }
    }
}
