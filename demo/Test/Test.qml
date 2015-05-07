/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import FlatUI 2.0
import "./"

FlatMainWindow {
    title:"登陆"
    width:400
    height: 500
    visible:true
    ScrollView{
        anchors.fill: parent
        anchors.margins: 10
        Loader {
            id:loader
            source:"./LoginPath.qml"
        }
    }
    Component.onCompleted: console.debug(TestGlobal.objectName)
    readonly property int pageStatus: TestGlobal.pageStatus
    onPageStatusChanged: {
        if(pageStatus == 1){
            console.debug(pageStatus);
            loader.source = "./RecordInfoPath.qml"
            title = "登记信息"
        }
    }
}


