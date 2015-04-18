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
import "./DoubanAPI"

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

    Component{
        id:wellCome
        Item{
            FlatButton{
                anchors.centerIn: parent
                text:"进入应用"
                onClicked: {
                    stack.push(getAccessPage);
                }
            }
        }
    }

    Component{
        id:getAccessPage
        GetAccessPage{
            url:DoubanAPI.doubanAuthorizeUrl
            onFinished: {
                whenFinished();
            }
        }
    }

    Component{
        id:successPage
        Item{
            Text{
                text:"access_token : "+DoubanAPI.doubanAccessToken + '\n'
                     +"refresh_token : "+ DoubanAPI.doubanRefreshToken  + '\n'
                     +"douban_user_name : "+ DoubanAPI.doubanUserName +'\n'
                     +"douban_user_id : "+DoubanAPI.doubanUserId;
            }
        }
    }

    function whenFinished(){
        stack.pop();
        stack.push(successPage);
    }
}

