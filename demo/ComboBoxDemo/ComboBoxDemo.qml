/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import FlatUI 2.0

FlatMainWindow{
    content:Item{
        FlatComboBox {
            anchors.centerIn: parent
            currentIndex: 2
            width: 200
            editable:true
            model: ListModel {
                id: cbItems
                ListElement { text: "Banana"; color: "Yellow" }
                ListElement { text: "Apple"; color: "Green" }
                ListElement { text: "Coconut"; color: "Brown" }
            }
            onCurrentIndexChanged: console.debug(cbItems.get(currentIndex).text + ", " + cbItems.get(currentIndex).color)
        }
    }
}
