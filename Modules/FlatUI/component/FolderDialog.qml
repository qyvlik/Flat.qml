/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import FlatUI 2.0
import Qt.labs.folderlistmodel 2.1

FlatDialog {
    id:window;
    title: folderModel.folder
    width: 640
    height: 480

    property alias rootFolder:folderModel.rootFolder
    property alias nameFilters : folderModel.nameFilters
    property alias folder: folderModel.folder
    property url selectFile
    signal select(bool isFile)

    titleBarIcons : GridLayout {
        id: windowButtonSystem
        FlatTextField{
            id:hard
            text:"c"
            size:FlatGlobal.sizeExtraSmall
            placeholderText:"input hard name : c"
            validator:RegExpValidator{
                regExp : /[A-Za-z]/
            }
            onTextChanged: {
                folderModel.folder = Qt.binding(function(){return "file:/"+text+":/";});
            }
        }

        FlatIcon {
            id: colseButton
            icon: FlatGlobal.iconTypeClose
            onClicked : {
                window.close();
            }
        }

        // at begin of window load, the key focus was in window
        focus:true;
        Keys.onPressed: {
            if(event.key == Qt.Key_Escape) {
                event.accepted= true;
                window.close();
            }
        }
    }

    FolderListModel {
        id: folderModel
        folder: "file:/f:/"
        sortField:FolderListModel.Type
        showDotAndDotDot:true
        showHidden:true;
    }

    content: ScrollView{
        GridView{
            add: Transition {
                NumberAnimation { properties: "x,y"; from: 100; duration: 500 }
            }
            move: Transition {
                NumberAnimation { properties: "x,y"; duration: 500 }
            }
            displaced: Transition {
                NumberAnimation { properties: "x,y"; duration: 1000 }
            }
            model: folderModel
            delegate:textArea
        }
    }
    Component{
        id:textArea;
        Rectangle{
            implicitHeight: 100
            implicitWidth: 100
            color:mouse.pressed?afterPressColor:beforePressColor
            border.color: "#ccc"
            border.width: 1
            radius: FlatGlobal.radius
            readonly property color beforePressColor: FlatGlobal.colorPeterRiver
            readonly property color afterPressColor: FlatGlobal.colorBelizeHole
            Text {
                id:showFile;
                width: parent.width
                anchors.top:parent.top
                wrapMode: Text.WordWrap
                text: fileName
                font.family: FlatGlobal.font.family
                font.pointSize: FlatGlobal.sizeExtraSmall
            }
            MouseArea{
                id:mouse
                anchors.fill: parent;
                onClicked: {
                    var isDir = folderModel.get(index,"fileIsDir");
                    if(isDir){
                        folderModel.folder = folderModel.get(index,"fileURL");
                        select(false);
                    } else {
                        selectFile = folderModel.get(index,"fileURL");
                        // console.debug("selectFile:",selectFile)
                        select(true);
                    }
                }
            }
        }
    }
}
