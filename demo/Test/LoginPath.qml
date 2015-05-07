/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import FlatUI 2.0
import "./"

Column{
    spacing:10
    Row{
        spacing:10
        FlatButton { text:"账号" }
        FlatTextField{  id:name;placeholderText:"输入账号" }
    }
    Row{
        spacing:10
        FlatButton { text:"密码" }
        FlatTextField{
            placeholderText:"密码"
            echoMode: TextInput.Password
        }
    }
    FlatButton {
        text:"登陆"
        anchors.right: parent.right
        onClicked: {
            // todo
            if(name.text == "123") {
                TestGlobal.pageStatus = 1;
            }
        }
    }
}


