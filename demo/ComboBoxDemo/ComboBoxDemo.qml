/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.0
import QtQuick.Controls 1.3
import FlatUI 2.0

FlatMainWindow{
    content: GroupBox{
        title:"history search"
        anchors.centerIn: parent
        Column{
            FlatComboBox {
                id:comboBox
                size:FlatGlobal.sizeExtraSmall
                width: 200
                onCurrentIndexChanged: console.debug(model.get(currentIndex).text + ", " + model.get(currentIndex).color);
            }
            FlatButton{
                text:"增加model"
                type:FlatGlobal.typeDanger
                onClicked: {
                    tip.show();
                    try{
                       comboBox.textRole = "text";
                       comboBox.model = Qt.binding(function(){return cbItems;});
                    } catch(e){
                        console.debug("error : ",e);
                    }
                }
            }
        }
    }
    ListModel {
        id: cbItems
        ListElement { text: "Banana"; color: "Yellow" }
        ListElement { text: "Apple"; color: "Green" }
        ListElement { text: "Coconut"; color: "Brown" }
    }
    FlatDialog{
        title:"提示"
        id:tip
        content:Item{
            Text{
                id:text
                width: parent.width
                wrapMode: Text.WordWrap
                text:"本文件通过Component的incubateObject函数构造时，不能直接让combobox的model直接指向一个数据，否则会发生异常"
                onHeightChanged: {
                        tip.setHeight(text.height * 4);
                }
            }
        }
    }
}

//ComboBox{
//    model:ListModel {
//        id: cbItems
//        ListElement { text: "Banana"; color: "Yellow" }
//        ListElement { text: "Apple"; color: "Green" }
//        ListElement { text: "Coconut"; color: "Brown" }
//    }
//}
