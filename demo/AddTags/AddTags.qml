/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import FlatUI 2.0

FlatMainWindow {
    id:window;
    title: qsTr("add tags")
    width: 640
    height: 480

    GridLayout {
        anchors.centerIn: parent
        columns: 2
        columnSpacing: 20
        rowSpacing: 10

        FlatButton{
            text:"show a dialog"
            onClicked: dialog.show();
            TagsDialog{
                id:dialog;
            }
        }
    }
}
