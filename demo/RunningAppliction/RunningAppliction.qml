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
    title: qsTr("running appliction")
    width: 300
    height:100
    visible:true
    GridLayout {
        anchors.centerIn: parent
        rows: 2
        columnSpacing: 20
        rowSpacing: 10

        FlatTextField{
            id:input; placeholderText:"running...."
            focus:true;
            Keys.onPressed:{
                if(event.key == Qt.Key_Return ||event.key == Qt.Key_Enter )
                    if (!Qt.openUrlExternally(input.text)) error.show();
            }
        }
        FlatButton{
            text:"about";
            onClicked : about.show();
        }
        FlatDialog{
            id:about;
            title: "how to"
            Text{
                anchors.fill: parent;
                wrapMode: Text.WordWrap;
                font:FlatGlobal.font;
                anchors.margins: 10
                textFormat: Text.RichText
                text:"input the applicton full path to running"+ "\n"+
                     "<p color='red'>"+"don't input \\"+"</p>"
            }
        }
        FlatDialog{
            id:error;
            title: "error"
            Text{
                id:errorText;
                anchors.fill: parent;
                wrapMode: Text.WordWrap;
                font:FlatGlobal.font;
                anchors.margins: 10
                color:FlatGlobal.colorPomegranate
                text:"ShellExecute : "+input.text + "   failed";
            }
        }
    }
}
