/*
 * 展示了怎么使用豆瓣api
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import FlatUI 2.0
import "./" // to import DoubanGolbal

FlatMainWindow {
    id:window;
    title: qsTr("豆瓣 客户端")
    width: 640
    height: 480

    StackView {
        anchors.fill: parent
        anchors.margins: 10
        id: stack
        initialItem:wellCome
    }

    function getCode(){
        stack.push({
                       item:getCodeWebPage,
                       properties:{url:DoubanGlobal.getAuthorizationCodeUrl()}
                   });
    }

    Component{
        id:getCodeWebPage
        GetCodeWebPage{
            onFinished: {
                stack.pop();
                stack.push(successPage)
            }
        }
    }

    Component{
        id:successPage
        SuccessPage{ }
    }

    Component{
        id:wellCome
        Column{
            spacing:10
            FlatButton{
                text:"进入应用"
                onClicked: getCode();
            }
        }
    }

    Component {
        id: inputDoubanArguments
        Column{
            anchors.centerIn: parent
            spacing: 10
            GroupBox {
                title: "输入豆瓣参数"
                Column {
                    spacing: 10
                    FlatTextField {
                        id:client_id
                        placeholderText:"client_id"
                        text:"09b3afeff687101c1d1b0fcfe3953054"
                    }
                    FlatTextField {
                        id:client_secret
                        placeholderText: "client_secret"
                        text:"d314e4604673cb97"
                    }
                    FlatTextField {
                        id:redirect_url
                        placeholderText: "redirect_url"
                        text:"http://qyvlik.sinaapp.com/doubancallback.php"
                    }
                }
            }
            FlatButton{
                text:"获取access token"
                onClicked:{
                    DoubanGlobal.client_id = client_id.text;
                    DoubanGlobal.client_secret = client_secret.text;
                    DoubanGlobal.redirect_url = redirect_url.text;
                    getCode();
                }
            }
        }
    }

    //    readonly property QtObject __privateData : QtObject {
    //        id:privateData
    //        objectName: "readonly qtobject"
    //        onObjectNameChanged: {
    //            console.debug("on!!! readonly object ,innerdata can changed!!! : ",objectName)
    //        }
    //    }

    //    Component.onCompleted: {
    //        privateData.objectName = "fucketr"
    //    }
}

