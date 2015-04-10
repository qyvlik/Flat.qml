/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import FlatUI 2.0

FlatMainWindow {
    width: 640;
    height: 400;
    content: Rectangle {
        ListView {
            id: view;
            currentIndex: 1;
            focus: true;
            anchors.fill: parent;
            preferredHighlightBegin: 0;
            preferredHighlightEnd: 0;
            highlightMoveDuration: 250;
            highlightRangeMode: ListView.StrictlyEnforceRange;
            snapMode: ListView.SnapOneItem;
            boundsBehavior: ListView.StopAtBounds;
            //orientation: ListView.Horizontal;
            model: itemModel;
            spacing:10

            Component.onCompleted: positionViewAtIndex(0, ListView.Center);
        }

        // The content of view.
        VisualItemModel {
            id: itemModel
            // Settings UI
            Rectangle{
                width: view.width
                height:view.height
                color:"yellow"
                border.width: 1
                border.color: "black"
            }
            Rectangle{
                width: view.width
                height:view.height
                color:"yellow"
                border.width: 1
                border.color: "black"
            }
            Rectangle{
                width: view.width
                height:view.height
                color:"yellow"
                border.width: 1
                border.color: "black"
            }
        }

    }

}

