/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import FlatUI 2.0
import FlatUI.Private 2.0

FlatDialog{
    id:window
    width: 400
    height: 500
    visible:true
    StackView {
        anchors.fill: parent
        id: stack
        initialItem: view
        Component {
            id: view

            MouseArea {
                Text {
                    text: stack.depth
                    anchors.centerIn: parent
                }
                onClicked: stack.push(view)
            }
        }
    }

    statusBar:Rectangle {
        width: window.width
        height: layout.height + 4

        Separator{ orientation: Qt.Horizontal; length: parent.width;color:"#ccc";}
        Separator{ orientation: Qt.Horizontal; length: parent.width;color:"#ccc"; anchors.bottom: parent.bottom }
        Separator{ orientation: Qt.Vertical; length: parent.height; color:"#ccc"; anchors.right: parent.right; }
        Separator{ orientation: Qt.Vertical; length: parent.height; color:"#ccc"; anchors.left: parent.left; }

        RowLayout {
            id:layout
            FlatIcon{
                anchors.rightMargin: 2
                icon:FlatGlobal.iconTypeBack
                onClicked: stack.pop()
            }
        }
    }
}
