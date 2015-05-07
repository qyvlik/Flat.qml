/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import FlatUI 2.0

FlatDialog{
    id: dialog;
    title:"dialog"
    onShowStateChanged: {
        if(dialog.showState < 0){
            inputTags.close();
        }
    }

    FlatDialog{
        id:inputTags
        title:"input tags"
        width: 220;
        height: 80;
        x:dialog.x + dialog.width * 0.5
        y:dialog.y + dialog.height * 0.8
        FlatTextField{
            anchors.centerIn: parent
            placeholderText:"input tags"
            focus:true;
            Keys.onPressed: {
                if(event.key == Qt.Key_Return || event.key == Qt.Key_Enter){
                    event.accepted= true;
                    console.debug("create tags:",text);
                    __createTags(text);
                    text = "";
                }
                if(event.key == Qt.Key_Escape){
                    event.accepted = true;
                    inputTags.close();
                }
            }
        }
    }
    Flow {
        id:flow
        anchors.fill: parent
        anchors.margins: 4
        spacing:4
        move: Transition {
            NumberAnimation { properties: "x,y"; easing.type: Easing.OutBounce }
        }
        add: Transition {
            NumberAnimation { properties: "x,y"; easing.type: Easing.OutBounce }
        }
        populate: Transition {
            NumberAnimation { properties: "x,y"; from: 200; duration: 100; easing.type: Easing.OutBounce }
        }
        FlatButton{
            type:FlatGlobal.typeSuccess
            text:"add tags"
            onClicked: {
                inputTags.show();
            }
        }
        FlatTags{ text:"Qt" }
    }
    function __createTags(tagsName){
        FlatGlobal.createQmlObjectFromUrlFinished.connect(function(object,error){
            // connect once
            FlatGlobal.createQmlObjectFromUrlFinished.disconnect(arguments.callee);
            if(!FlatGlobal.objectIsNull(object)){
                object.text = tagsName;
            }
        });
        FlatGlobal.createQmlObjectFromUrl("../../modules/FlatUI/element/FlatTags.qml",flow);
    }
}


