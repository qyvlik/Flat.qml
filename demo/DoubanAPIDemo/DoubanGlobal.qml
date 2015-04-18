/*
 * 豆瓣全局对象
 * 用来记录 client_id, client_secret,redirect_url
 * authorization_code,access_token,refresh_token
 *
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/

pragma Singleton
import QtQuick 2.0

QtObject {
    objectName: "DoubanGlobal"

    property string douban_user_name:""
    property string douban_user_id: ""
    property string client_id:"09b3afeff687101c1d1b0fcfe3953054"
    property string client_secret:"d314e4604673cb97"
    property string redirect_url:"http://qyvlik.sinaapp.com/doubancallback.php"
    property string authorization_code
    property string access_token
    property string refresh_token
    readonly property string authorizationCodeUrl:getAuthorizationCodeUrl();

    function getAuthorizationCodeUrl(){
        return "https://www.douban.com/service/auth2/auth?"+"client_id="+client_id
                +"&redirect_uri="+redirect_url
                +"&response_type=code&scope=shuo_basic_r,shuo_basic_w,douban_basic_common";
    }

    function getAccessTokenAndRefreshToken(resultString){
        var r = JSON.parse(resultString);
        //{"access_token":"857bcb21c22cde3e9073616546869aba","douban_user_name":"qyvlik","douban_user_id":"125134881","expires_in":604800,"refresh_token":"6bf059216d81a65643d10b644884f302"}
        // {"msg":"required_parameter_is_missing: client_id","code":113,"request":"POST \/auth2\/token"}

        if(r.hasOwnProperty("code")){
            console.debug(r.code);
            console.debug(r.msg);
            console.debug(r.request);
            return;
        }
        if(r.hasOwnProperty("access_token")){
            console.debug("access_token : ",r.access_token);
            access_token = r.access_token;
            refresh_token = r.refresh_token;
            douban_user_name = r.douban_user_name;
            douban_user_id = r.douban_user_id;
        }
    }

    function refreshAccessToken(){

    }

/*
 *
https://www.douban.com/service/auth2/auth?
client_id=09b3afeff687101c1d1b0fcfe3953054
&redirect_uri=http://qyvlik.sinaapp.com/doubancallback.php
&response_type=code&scope=shuo_basic_r,shuo_basic_w,douban_basic_common

*/
    Component.onCompleted: console.debug("douban global object was created!");
}

