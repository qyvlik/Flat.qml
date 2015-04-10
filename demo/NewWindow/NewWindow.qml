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
    title: qsTr("new Flat window")
    width: 640
    height: 480

    GridLayout{
        rows: 4
        anchors.centerIn: parent
        FlatButton{ text:"open a dialog"; onClicked: dialog.show()}
        FlatDialog{
            id:dialog
            title:"error message"
            property string errorText
            content: Item{ // use item to load use element is better
                Text{
                    anchors.margins: 10
                    anchors.fill: parent
                    wrapMode: Text.WordWrap
                    text: dialog.errorText
                    font:FlatGlobal.font
                    color:"red"
                }
            }
        }

        FlatButton{
            text:"new a window"
            property int newWindowCount:0
            onClicked: {
                var e;
                var mainwindow =
                        FlatGlobal.createFlatElement("FlatMainWindow",0);
                newWindowCount+=1;
                try{
                    mainwindow.title ="Number: " + newWindowCount;

                    // note content is a component* type
                    // may meet some error
                    //! [error] Error: Cannot assign QObject* to QQmlComponent*
                    mainwindow.content = Qt.createComponent("../../Modules/FlatUI/element/FlatButton.qml");
                    mainwindow.show();
                }catch(e){
                    console.debug(e)
                }
            }
        }

        FlatTextField{
            id:input;
            placeholderText:"input Flat element name";
            width: 400;
            Keys.onPressed: {
                if(event.key == Qt.Key_Return) {
                    event.accepted = true;
                    var e;
                    console.debug("will create ",input.text," element");
                    var o =  FlatGlobal.createFlatElement(input.text,dialog);
                    try{
                        o.show()
                    }catch(e){
                        dialog.errorText=e.toString()+input.text+" is not a window type";
                        dialog.show();
                        console.debug(e)
                    }
                }
            }
        }
    }
}


