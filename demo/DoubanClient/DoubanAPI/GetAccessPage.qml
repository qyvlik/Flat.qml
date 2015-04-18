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
    property alias url: webview.url
    signal finished;
    WebView {
        id: webview
        anchors.fill: parent
        onUrlChanged: {
            console.debug("url: ",webview.url);
            var tempUrl = webview.url.toString();
            //if(tempUrl.match(/^http:\/\/qyvlik.sinaapp.com\/doubancallback.php/) )
            var reg = new RegExp("^"+DoubanAPI.doubanRedirectUrl.toString())
            if(tempUrl.match(reg)){
                var code = tempUrl.match(/code=\w+$/)[0]
                code = code.match(/=\w+$/)[0];
                code =  code.slice(1);
                console.log("yes i get authorization code : ",code);
                DoubanAPI.doubanAuthorizationCode = code;
                DoubanAPI.doubanClientState = DoubanAPI.needAccessToken;
                getAccessToken();
            }
        }
    }

    function getAccessToken(){
        var postData = "?client_id="+DoubanAPI.doubanClientId
                + "&client_secret=" + DoubanAPI.doubanClientSecret
                + "&redirect_uri=" + DoubanAPI.doubanRedirectUrl
                + "&grant_type=authorization_code"
                + "&code=" + DoubanAPI.doubanAuthorizationCode;
        var url = DoubanAPI.doubanTokenUrl+postData;
        console.debug("get access token url : ",url)
        var doc = new XMLHttpRequest();
        doc.onreadystatechange = function(){
            if(doc.readyState == XMLHttpRequest.DONE) {
                //console.debug(doc.responseText);
                DoubanAPI.doubanAPIArguments = doc.responseText;
                finished();
            }
        }
        doc.open("POST",url);
        doc.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        // POST 数据请添加头
        doc.send(null);
    }
}

