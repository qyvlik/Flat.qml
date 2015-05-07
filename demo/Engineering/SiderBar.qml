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
        id: shielding // 屏蔽层
        //anchors.fill: siderBar.parent
        width: siderBar.parent.width
        height: siderBar.parent.height
        opacity: 0 /*0.5*/
        z:parent.z-2
        color:"#ccc"
        state:"closeState"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                siderBar.state == "showState" ? siderBar.close() : siderBar.show();
            }
        }
        states: [
            State {
                name: "showState"
                PropertyChanges {
                    target: siderBar; z:parent.z+1;x: 0
                }
            },
            State {
                name: "closeState"
                PropertyChanges {
                    target: siderBar; z:parent.z;  x: -siderBar.parent.width - 1
                }
            }
        ]

        transitions: Transition {
            NumberAnimation { property: "x"; easing.type: Easing.InOutQuad }
        }
    }

    Rectangle{
        anchors.fill: parent
        color:FlatGlobal.colorWetAsphalt
        z:parent.z-2
    }

    function show(){
        siderBar.state = "showState";
        shielding.state = "showState"
        isShow = true;
    }

    function close(){
        siderBar.state = "closeState";
        shielding.state = "closeState";
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

