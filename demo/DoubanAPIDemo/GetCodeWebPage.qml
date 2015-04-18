/*
 * 用来依次获取 authorization code, access_token, refresh_token
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtWebKit 3.0
import FlatUI 2.0
import "./"

ScrollView {
    anchors.fill:parent
    anchors.margins: 1
    property alias url: webview.url
    signal finished;
    WebView {
        id: webview
        anchors.fill: parent
        onUrlChanged: {
            DoubanGlobal;
            console.debug("url: ",webview.url);
            var tempUrl = webview.url.toString();
            //if(tempUrl.match(/^http:\/\/qyvlik.sinaapp.com\/doubancallback.php/) )
            var reg = new RegExp("^"+DoubanGlobal.redirect_url.toString())
            if(tempUrl.match(reg)){
                var code = tempUrl.match(/code=\w+$/)[0]
                code = code.match(/=\w+$/)[0];
                code =  code.slice(1);
                console.log("yes i get authorization code : ",code);
                DoubanGlobal.authorization_code = code;
                getAccessToken();
            }
        }
    }

    function getAccessToken(){
        var postData = "client_id="+DoubanGlobal.client_id
                + "&client_secret=" + DoubanGlobal.client_secret
                + "&redirect_uri=" + DoubanGlobal.redirect_url
                + "&grant_type=authorization_code"
                + "&code=" + DoubanGlobal.authorization_code;
        var url = "https://www.douban.com/service/auth2/token?"+postData;
        console.debug("get access token url : ",url)
        var doc = new XMLHttpRequest();
        doc.onreadystatechange = function(){
            if(doc.readyState == XMLHttpRequest.DONE) {
                //console.debug(doc.responseText);
                DoubanGlobal.getAccessTokenAndRefreshToken(doc.responseText);
                finished();
            }
        }
        doc.open("POST",url);
        doc.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        // POST 数据请添加头
        doc.send(null);
    }
}

