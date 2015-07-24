/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import QtQuick.Controls 1.3
import FlatUI 2.0

FlatMainWindow {
    id:window;
    title: qsTr("code editor")
    width: 640
    height: 480

    TextArea {
        id:text;
        font:FlatGlobal.font
        anchors.fill: parent
        anchors.margins: 5
        textFormat:TextEdit.RichText
        // @disable-check M16
        menu:FlatMenu{
            MenuItem{ text:"Copy"; onTriggered: copy(); }
            MenuItem{ text:"Cut"; onTriggered: cut(); }
            MenuItem{ text:"Paste"; onTriggered: paste();}
            MenuItem{ text:"About"; onTriggered: showDialog();}
        }
    }

    FlatDialog{
        id:dialog;
        title:"about note pad flat demo"
        content:Item{
            Text{
                anchors.fill: parent
                anchors.margins: 10
                font:FlatGlobal.font
                wrapMode: Text.WordWrap
                text:"I'm sorry, you can't save text and haven't any Syntax highlighting"
                color:FlatGlobal.typeWarning.activeColor
            }
        }
    }

    function cut(){ text.cut(); }
    function copy(){text.copy(); }
    function paste(){ text.paste();}
    function showDialog(){ dialog.show();}
}
