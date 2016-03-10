/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
/*
 * when window funscreen show
 * menu can show
*/
import QtQuick 2.4
import QtQuick.Controls 1.3
import FlatUI 2.0

FlatMainWindow {
    id:window;
    title: qsTr("press mouse right button")
    width: 640
    height: 480
    visible:true

    MouseArea{
        anchors.fill: parent;
        acceptedButtons: Qt.RightButton
        onClicked:{
            menu.popup();
        }
    }

    // 注意 菜单的root必须为 FlatMenu 才可以有样式
    // 内嵌的二级或者子级菜单必须为 Menu！
    FlatMenu{
        id:menu
        MenuItem{
            text:"what's this ?"
            onTriggered: dialog.show();
        }

        Menu {
            title: "Second Menu"

            Menu {
                title: "Thrid Menu"

                MenuItem {
                    text: "Do Nothing"
                }
            }
        }
    }

    FlatDialog{
        id:dialog;
        title:qsTr("about");
        Text{
            wrapMode: Text.WordWrap
            anchors.fill: parent
            anchors.margins: 10
            font:FlatGlobal.font
            text:"tell you how to show a menu in a window\n"
                    +"can use in video player"
        }
    }

}
