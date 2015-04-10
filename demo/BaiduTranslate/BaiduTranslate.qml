/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import FlatUI 2.0

/*
 * select select translate action
textarea textarea
translate api
*/

FlatMainWindow {
    title:"baidu translate"
    width: 400;
    height: 400;
    content: Item {
        id:root;
        BaiduTranslateAPI{
            id:tr;
            translateSource: input.text;
            onHasErrorChanged: {
                if(tr.hasError){
                    show.text = tr.error_code + '\n'+tr.error_msg;
                }
            }
        }

        Column{
            spacing: 10
            TextArea {
                id:input;
                width: root.width;
                style: TextAreaStyle {
                    textColor: "#333"
                    selectionColor: "steelblue"
                    selectedTextColor: "#eee"
                    backgroundColor: "#eee"
                }
            }
            Row{
                spacing: 10
                DropDownButton{ tr:tr;flag:true; }
                FlatButton{ text:"翻译==>"; onClicked: tr.startTranslater(); }
                DropDownButton{ tr:tr; flag:false; }
            }
            TextArea {
                id:show;
                width: root.width;
                height: root.width*0.3;
                text:tr.translateResult;
                readOnly:true;
                style: TextAreaStyle {
                    textColor: "#333"
                    selectionColor: "steelblue"
                    selectedTextColor: "#eee"
                    backgroundColor: "#eee"
                }
            }
        }
    }
}
