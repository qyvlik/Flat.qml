/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.0
import Qt.labs.folderlistmodel 2.1

GridView {
    id:root;
    width: 400; height: 300
    add: Transition {
        NumberAnimation { properties: "x,y"; from: 100; duration: 500 }
    }
    move: Transition {
        NumberAnimation { properties: "x,y"; duration: 500 }
    }

    FolderListModel {
        id: folderModel
        folder: "file:/"
        rootFolder: "file:/"
        sortField:FolderListModel.Type
        showDotAndDotDot:true
        showHidden:true;
    }

    model: folderModel
    delegate: Item{
        width: 120
        height: 120
        Rectangle{
            anchors.centerIn: parent;
            width: 80
            height: 80
            color:folderModel.isFolder(index) ? "yellow":"white"
            border.color: "#ccc"
            border.width: 1
            Text {
                id:showFile;
                width: parent.width
                anchors.bottom:parent.bottom
                wrapMode: Text.WordWrap
                text: fileName
                font.pointSize: 10
            }
            MouseArea{
                id:mouse;
                anchors.fill: parent;
                onDoubleClicked: {
                    var isDir = folderModel.get(index,"fileIsDir");
                    if(isDir){
                        folderModel.folder = folderModel.get(index,"fileURL");
                    } else {
                        Qt.openUrlExternally(folderModel.get(index,"fileURL"));
                    }
                }
            }
        }
    }
}
