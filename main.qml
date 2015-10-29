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
    objectName:"MainWindow"
    title: qsTr("Flat Example Demo")
    width: 960
    height: 540
    visible:true

//    menuBar: MenuBar{
//        Menu{
//            title:"title"
//        }
//    }

    contentControl.anchors.margins: 20
    content: Flow{
        id:flow
        spacing: 10
        FlatButton{ text:"AddTags"; onClicked: { __createExample(text)} }
        FlatButton{ text:"CodeEditor"; onClicked: { __createExample(text)} }
        FlatButton{ text:"RunningAppliction"; onClicked: { __createExample(text)} }
        FlatButton{ text:"ShowMenuInWindow"; onClicked: { __createExample(text)} }
        FlatButton{ text:"SampleVideoPlayer"; onClicked: { __createExample(text)} }
        FlatButton{ text:"BaiduTranslate"; onClicked: { __createExample(text)} }
        FlatButton{ text:"FBIWarning"; onClicked: { __createExample(text)} }
        FlatButton{ text:"FloatingWindow"; onClicked: { __createExample(text)} }
        FlatButton{ text:"WebBrowser"; onClicked:{ __createExample(text)}}
        FlatButton{ text:"Test"; onClicked:{ __createExample(text)}}
        FlatButton{ text:"StackViewDemo"; onClicked:{ __createExample(text)}}
        FlatButton{ text:"WatchImageOnFullSceen"; onClicked:{ __createExample(text)}}
        FlatButton{ text:"GroupBoxDemo"; onClicked:{ __createExample(text)}}

        //![error ] Error - RtlWerpReportException failed with status code :-1073741823. Will try to launch the process directly
        FlatButton{ text:"ComboBoxDemo";type:FlatGlobal.typeDanger; onClicked:{ __createExample(text)}}
        //![error ] Error - RtlWerpReportException failed with status code :-1073741823. Will try to launch the process directly

        FlatButton{ text:"HistorySearchDemo"; onClicked:{ __createExample(text)}}
        FlatButton{ text:"ButtonType"; onClicked:{ __createExample(text)}}
        FlatButton{ text:"YouTuBe"; onClicked:{ __createExample(text)}}
        FlatButton{ text:"DoubanClient"; onClicked:{ __createExample(text)}}

        FlatButton{ text:"SampleErrorExample"; type:FlatGlobal.typeDanger; onClicked:{ __createExample(text)}}
        FlatButton{ text:"Engineering"; type:FlatGlobal.typeInverse; onClicked:{ __createExample(text)}}
        FlatButton{ text:"USBWebClient"; type:FlatGlobal.typeInverse; onClicked:{ __createExample(text)}}

        //USBWebClient
        FlatButton{ text:"about"; type: FlatGlobal.typeInfo; onClicked: aboutDialog.show()}
        FlatButton{ text:"get a image"; type: FlatGlobal.typeWarning; onClicked: FlatGlobal.saveImageToFile(flow,"flow.png")}
    }

    ErrorDialog{ id:errorDialog; }

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
                        onClicked: Qt.openUrlExternally("http://www.bootcss.com/p/flat-ui");
                    }
                    FlatButton{
                        text:"look QtQuick"
                        onClicked: Qt.openUrlExternally("http://www.qt.io");
                    }
                }
            }
        }
    }

    function __createExample(exampleName){
        var elementUrl = Qt.resolvedUrl(String("demo/"+exampleName+"/"+exampleName+".qml"));
        var e,object;
        console.debug("will create ",exampleName, " from :",elementUrl);
        // on Event
        FlatGlobal.createQmlObjectFromUrlFinished.connect(function(object,error){
            // connect once
            FlatGlobal.createQmlObjectFromUrlFinished.disconnect(arguments.callee);
            if(!FlatGlobal.objectIsNull(object)){
                object.x = window.x + 50;
                object.y = window.y + 50;
                object.show();
            } else{
                errorDialog.errorString = error;
                errorDialog.show();
            }
        });
        object = FlatGlobal.createQmlObjectFromUrl(elementUrl,0);
        // var object = FlatGlobal.createQmlObjectFromUrl(elementUrl,window);
    }


    Component.onCompleted: {
    }
}
