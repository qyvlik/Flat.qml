/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FlatUI.Private element
 *
 * this qml file (element type) just for build module
 * not allow used by user
 * private
*/

import QtQuick 2.4

QtObject{
    /* active color mean a object was pressed, clicked, focused ....*/
    property color activeColor;

    /* inactiveColor and defaultColor may be same */
    property color inactiveColor;
    property color defaultColor;

    readonly property color disableColor:"#bdc3c7";

    /* one active state may  have 4 levels... */
    /* other color .... */
}
