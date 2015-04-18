/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FLatUI element FlatButton
 *
*/
import QtQuick 2.3
import FlatUI 2.0

ListView {
    id:siderBar
    width: 200
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.margins: 2
    x : -width
    property bool isShow:false

    Rectangle{
        anchors.fill: parent
        color:FlatGlobal.colorWetAsphalt
        z:parent.z-2
    }

    function show(){
        siderBar.state = "showState";
        isShow = true;
    }

    function close(){
        siderBar.state = "closeState";
        isShow = false;
    }

    states: [
        State {
            name: "showState"
            PropertyChanges { target: siderBar; z:parent.z+1;  x: 0}
        },
        State {
            name: "closeState"
            PropertyChanges { target: siderBar; z:parent.z;  x: -width}
        }
    ]

    transitions: Transition {
        NumberAnimation { property: "x"; easing.type: Easing.InOutQuad }
    }
}

