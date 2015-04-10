/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FLatUI element FlatTags
 *
*/
import FlatUI 2.0
import FlatUI.Private 2.0
import QtQuick 2.3

FlatButton {
    id:tags;
    text:"tags"
    property FlatIconName icon:FlatGlobal.iconTypeClose;
    iconOnLeft:false;
    iconSource: icon.defaultIcon;
    onClicked: close();

    function close(){
        tags.destroy(100)
    }
}
