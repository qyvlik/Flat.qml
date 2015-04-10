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
    id:window;
    title: qsTr("Flat Example Demo")
    width: 640
    height: 480

    contentControl.anchors.margins: 20
    content: Flow{
        spacing: 10
        FlatButton{ text:"AddTags"; onClicked: { __createExample(text)} }
        FlatButton{ text:"CodeEditor"; onClicked: { __createExample(text)} }
        FlatButton{ text:"FolderDialog"; onClicked: { __createExample(text)} }
        FlatButton{ text:"NewWindow"; onClicked: { __createExample(text)} }
        FlatButton{ text:"RunningAppliction"; onClicked: { __createExample(text)} }
        FlatButton{ text:"ShowMenu"; onClicked: { __createExample(text)} }
        FlatButton{ text:"ShowMenuInWindow"; onClicked: { __createExample(text)} }
        FlatButton{ text:"SampleVideoPlayer"; onClicked: { __createExample(text)} }
        FlatButton{ text:"BaiduTranslate"; onClicked: { __createExample(text)} }
        FlatButton{ text:"ShowFlatComponent"; onClicked: { __createExample(text)} }
        FlatButton{ text:"FBIWarning"; onClicked: { __createExample(text)} }
        FlatButton{ text:"FloatingWindow"; onClicked: { __createExample(text)} }
        FlatButton{ text:"NotePad"; onClicked:{ __createExample(text)}}
        FlatButton{ text:"WebBrowser"; onClicked:{ __createExample(text)}}
        FlatButton{ text:"Test"; onClicked:{ __createExample(text)}}
        FlatButton{ text:"StackViewDemo"; onClicked:{ __createExample(text)}}
        FlatButton{ text:"WatchImageOnFullSceen"; onClicked:{ __createExample(text)}}
        FlatButton{ text:"GroupBoxDemo"; onClicked:{ __createExample(text)}}
        FlatButton{ text:"ComboBoxDemo"; onClicked:{ __createExample(text)}}
        FlatButton{ text:"HistorySearchDemo"; onClicked:{ __createExample(text)}}
        FlatButton{ text:"ButtonType"; onClicked:{ __createExample(text)}}

        //ButtonType
        FlatButton{ text:"about"; type: FlatGlobal.typeInfo; onClicked: aboutDialog.show()}
    }

    FlatDialog{
        id:aboutDialog
        width: 400
        height: 300
        title:"About FlatUI and QtQuick"
        content:Item{
            Column{
                spacing:10
                Text{
                    width: parent.width
                    anchors.margins: 10
                    wrapMode: Text.WordWrap
                    text:"look at http://www.bootcss.com/p/flat-ui/ and http://www.qt.io/"
                    font:FlatGlobal.font
                }
                Row{
                    spacing:10
                    FlatButton{
                        text:"look FlatUI"
                        onClicked: Qt.openUrlExternally("http://www.bootcss.com/p/flat-ui")
                    }
                    FlatButton{
                        text:"look QtQuick"
                        onClicked: Qt.openUrlExternally("http://www.qt.io")
                    }
                }
            }
        }

    }

    function __createExample(exampleName){
        var elementUrl = String("../../demo/"+exampleName+"/"+exampleName+".qml");
        console.debug("will create ",exampleName, " from :",elementUrl);
        var object = FlatGlobal.createQmlObjectFromUrl(elementUrl,0);
        var e;
        try{
            object.x = window.x + 50;
            object.y = window.y + 50;
            object.show();
        }catch(e){
            console.debug(e);
        }
    }
}
