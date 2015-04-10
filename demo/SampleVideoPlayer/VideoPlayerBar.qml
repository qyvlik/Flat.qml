/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import FlatUI.Private 2.0
import FlatUI 2.0
import QtQuick.Layouts 1.1

// status bar
//__playIcons: [ "Next","Pause","Stop","Play","Previous","Rewind","Speed"]
Rectangle {

    color:FlatGlobal.colorAsbestos

    property string __playIconsPath : "../../modules/FlatUI/resource/playerIcon/"
    property variant
    __playIcons: ["Rewind","Pause","Stop","Play","Speed"]

    signal playAction(var action)
    function __playAction(type){ playAction(type); }

    RowLayout{
        anchors.centerIn: parent
        spacing: 20
        FlatIcon {
            icon:FlatGlobal.iconTypeOpenFile
            onClicked: __playAction("OpenFile")
        }

        Repeater{
            model:__playIcons.length
            FlatIcon{
                icon:FlatIconName{
                    defaultIcon:__playIconsPath+__playIcons[index]+".png"
                    pressIcon:__playIconsPath+__playIcons[index]+"Pressed.png"
                    hoverIcon:pressIcon
                }
                onClicked: __playAction(__playIcons[index]);
            }
        }

    }
}

