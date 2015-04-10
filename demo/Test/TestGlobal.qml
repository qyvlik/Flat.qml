/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.0
pragma Singleton

QtObject {
    objectName:"TestGlobal"
    // 0,1 ,2
    // wait login, login success , record success
    property int pageStatus: 0
    Component.onCompleted: {
        console.debug("just to show, use singleton object to share data and use singleton data.")
    }
}

