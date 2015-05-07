/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FLatUI element FlatDialog
 *
*/
/*
 * don't use Qt.createComponent to create this element
 * that meet dialog be a heap object
 * dialog be a stack object is better
 * call close() but don't call destroy()
*/

import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Layouts 1.1
import FlatUI 2.0
import FlatUI.Private 2.0

AbstractWindow {
    id:dialog
    width: 300
    height: 200
    flags:Qt.Dialog | Qt.FramelessWindowHint | Qt.WindowSystemMenuHint

    // 0,1,2,3,4 show, showNormal, showFullScreen, showMaxmized, showMinmized;

    titleBarIcons : GridLayout {
        id: windowButtonSystem
        FlatIcon {
            id: colseButton
            icon: FlatGlobal.iconTypeClose
            onClicked : {
                dialog.close();
            }
        }

        // at begin of window load, the key focus was in window
        focus:true;
        Keys.onPressed: {
            if(event.key == Qt.Key_Escape) {
                event.accepted= true;
                dialog.close();
            }
        }
    }
    Component.onCompleted: {
        // at begin of window load, the key focus was in window
        dialog.requestActivate();
    }
}

