/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FlatUI.Private element
 *
 * this qml file (element type) just for build module
 * not allow used by user
 * private
*/
import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Layouts 1.1
import FlatUI 2.0
import FlatUI.Private 2.0

ApplicationWindow {
    id:window;
    flags: Qt.FramelessWindowHint | Qt.WindowSystemMenuHint| Qt.WindowMinimizeButtonHint| Qt.Window

    width: 300
    height: 200
    minimumHeight:50
    minimumWidth:100
    color:"white"
    property color windowBorderColor : "#ccc"

    //    -1,0,1,2,3,4
    //    close, show, showNormal, showFullScreen, showMaxmized, showMinmized;
    //    readonly property int close:-1;
    //    readonly property int showMinmized : 1;
    //    readonly property int showNormal : 2;
    //    readonly property int showMaxmized : 3;
    //    readonly property int showFullScreen : 4;
    property int showState: 0
    onShowStateChanged: {
        if(showState == -1){
            var e;
            window.close();
            try{
                window.destroy(10);
            }catch(e){
                console.debug(window,"destroy has some error",e);
            }
        }
    }

    /*
 Qt::WindowNoState       0x00000000	The window has no state set (in normal state).
 Qt::WindowMinimized     0x00000001	The window is minimized (i.e. iconified).
 Qt::WindowMaximized     0x00000002	The window is maximized with a frame around it.
 Qt::WindowFullScreen	0x00000004	The window fills the entire screen without any frame around it.
 Qt::WindowActive        0x00000008	The window is the active window, i.e. it has keyboard focus.
 */
    // to fix showState
    onWindowStateChanged: {
        switch(windowState)
        {
        case 0x00000000:
            showState = 0;
            break;
        case 0x00000001:
            showState = FlatGlobal.showMinmized;
            break;
        case 0x00000002:
            showState = FlatGlobal.showMaxmized;
            break;
        case 0x00000004:
            showState = FlatGlobal.showFullScreen;
        }
    }

    // to loader title bar icons
    property alias titleBarIcons:__iconloader.sourceComponent

    // to set content item
    // note content is a component* type
    // may meet some error
    // Error: Cannot assign QObject* to QQmlComponent*
    property alias content:__content.sourceComponent
    property alias contentControl: __content
    Loader { id: __content; anchors.fill: parent; anchors.margins: 10 }


    readonly property alias titleBarArea:__titlebarArea

    // @disable-check M16
    style: ApplicationWindowStyle{
        background: Rectangle{ color:window.color;border.width: 1;border.color: windowBorderColor; }
    }

    toolBar : Rectangle {
        id: titleBar;
        width: window.width
        height: FlatGlobal.sizeExtraHuge

        Separator{ orientation: Qt.Horizontal; length: titleBar.width;color:"#ccc"; }
        Separator{ orientation: Qt.Vertical; length: titleBar.height; color:"#ccc"; anchors.right: titleBar.right; }
        Separator{ orientation: Qt.Vertical; length: titleBar.height; color:"#ccc"; anchors.left: titleBar.left; }

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
        }
        Text {
            id: textTitle
            anchors.left: titleBar.left
            anchors.verticalCenter: titleBar.verticalCenter
            anchors.leftMargin: 10
            text:window.title
            font.pixelSize: FlatGlobal.sizeDefault
            font.family: FlatGlobal.font.family
            color: "black"
        }

        // to loader title bar icons
        Loader {
            id:__iconloader
            anchors.right: titleBar.right
            anchors.rightMargin: FlatGlobal.sizeExtraSmall
            anchors.verticalCenter: titleBar.verticalCenter

            // at begin of window load, the key focus was in window
            focus:true
        }
    }
    //Component.onCompleted: console.debug("window was create :",window);
    //Component.onDestruction: console.debug("window was destroy :",window);
}
