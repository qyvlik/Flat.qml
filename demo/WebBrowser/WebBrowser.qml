/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtWebKit 3.0
import FlatUI 2.0
import FlatUI.Private 2.0

ApplicationWindow {
    id:window
    title: "Nano Browser"
    flags: Qt.FramelessWindowHint | Qt.WindowSystemMenuHint| Qt.WindowMinimizeButtonHint| Qt.Window
    width:700
    height:400
    visible:true
    // @disable-check M16
    style: ApplicationWindowStyle{
        background: Rectangle{ color:window.color;border.width: 1;border.color: "#ccc"; }
    }

    statusBar: Item{
        width: window.width
        height: 4
        FlatProgressBar{
            anchors.margins: 1
            height: 2
            anchors.right: parent.right
            anchors.left: parent.left
            value:webview.loadProgress
            onValueChanged: {
                if(value >= 100) {
                    parent.visible = false;
                } else {
                    parent.visible = true;
                }
            }
        }
    }
    //*
    ScrollView {
        anchors.fill:parent
        anchors.margins: 1
        WebView {
            id: webview
            url: "http://www.baidu.com"
            anchors.fill: parent
            //canGoBack:true
            onNavigationRequested: {
                // detect URL scheme prefix, most likely an external link
                var schemaRE = /^\w+:/;
                if (schemaRE.test(request.url)) {
                    request.action = WebView.AcceptRequest;
                } else {
                    request.action = WebView.IgnoreRequest;
                    // delegate request.url here
                }
            }
        }
    }
    //*/
    function setUrl(url){
        webview.url = url;
        console.debug("url : ",webview.url)
    }
    toolBar: Rectangle{
        id: titleBar;
        width: window.width;   height: FlatGlobal.sizeExtraHuge + FlatGlobal.sizeDefault

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
        GridLayout {
            id: windowButtonSystem
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 10
            columns: 4



            FlatTextField{
                placeholderText:"input url"
                size: FlatGlobal.sizeExtraSmall
                anchors.left: parent.left
                anchors.right: minimizeButton.left
                focus:true
                Keys.onPressed: {
                    if(event.key == Qt.Key_Enter || event.key == Qt.Key_Return) {
                        event.accepted = true;
                        setUrl(text);
                    }
                }
            }

            FlatIcon {
                id: minimizeButton
                icon: FlatGlobal.iconTypeShowMin
                onClicked : window.showMinimized();
            }

            FlatIcon {
                id: colseButton
                icon: FlatGlobal.iconTypeClose
                onClicked : window.close();
            }
            focus:true
            Keys.onPressed: {
                if(event.key == Qt.Key_F11){
                    event.accepted = true;
                    window.showFullScreen()
                }
                if(event.key == Qt.Key_Escape){
                    event.accepted = true;
                    window.showNormal();
                }
            }
        }
    }

}
