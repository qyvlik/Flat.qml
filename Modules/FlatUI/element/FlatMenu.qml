/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FLatUI element FlatMenu
 *
 *
 error
 \qml
    FlatMainWindow{

        FlatMenu{
            FlatMenu{} // error !
        }
    }
  \qmlend

 default
 \qml
    FlatMainWindow{

        FlatMenu{
            Menu{}
            Menu{}
            Menu{}
            MenuItem{}
        }
    }
  \qmlend

*/
import QtQuick 2.3
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import FlatUI 2.0
import FlatUI.Private 2.0

Menu {
    property int size: FlatGlobal.sizeDefault
    property ActiveColor type : FlatGlobal.typeDefault;

    // because the frame color is same as typeInverse.color;
    onTypeChanged:{
        if(type.objectName == FlatGlobal.typeInverse.objectName){
            type = Qt.binding(function(){
              return FlatGlobal.typeDefault;
            });
        }
    }

    style:MenuStyle {
        frame:Rectangle{
            color:FlatGlobal.typeInverse.inactiveColor;
            //radius: FlatGlobal.radius;
        }
        itemDelegate.background : Rectangle {
            color:FlatGlobal.typeInverse.inactiveColor;
            //radius: FlatGlobal.radius;
        }
        itemDelegate.label: Label {
            font.family: FlatGlobal.font.family;
            font.pointSize: size;
            text:styleData.text
            color:styleData.selected ? type.activeColor :type.inactiveColor
        }
    }
}

