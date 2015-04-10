/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import FlatUI 2.0

FlatMenu{
    size:FlatGlobal.sizeDefault
    MenuItem{text:"operation.............." }
    MenuItem{text:"More operation"}
    MenuSeparator { }
    Menu {
        title: "More Stuff"
        MenuItem {text: "Do Nothing"}
    }
}

