
// DoubanAPI
pragma Singleton
import QtQuick 2.0
import "./util.js" as U

QtObject {
    objectName: "DoubanAPI"
    readonly property string doubanAPIHost:'https://api.douban.com'
    readonly property string doubanAuthHost:'https://www.douban.com'
    readonly property string doubanAuthorizeUrl: doubanAuthHost + '/service/auth2/auth'
                                                 +"?client_id="+doubanClientId
                                                 +"&redirect_uri="+doubanRedirectUrl
                                                 +"&response_type=code&scope="+doubanScope

    readonly property string doubanTokenUrl:doubanAuthHost + '/service/auth2/token'

    property string doubanClientSecret:"d314e4604673cb97"
    property string doubanClientId:"09b3afeff687101c1d1b0fcfe3953054"
    property string doubanUserName:""
    property string doubanUserId: ""
    property string doubanRedirectUrl:"http://qyvlik.sinaapp.com/doubancallback.php"

    property string doubanAuthorizationCode:""
    property string doubanAccessToken:""
    property string doubanRefreshToken:""
    property string doubanScope:"shuo_basic_r,shuo_basic_w,douban_basic_common"

    property int doubanClientState:0
    readonly property int needAuthorizationCode:0
    readonly property int needAccessToken:1
    readonly property int needRefreshAccessToken: 2
    readonly property int ready: 3

    property string doubanAPIArguments:""
    property url doubanErrorString:""

    Component.onCompleted: {
        U.readTextFromUrl("./douban_api_data.json",function(t){ doubanAPIArguments = t });
        U.readTextFromUrl("./error_code.json",function(t){ doubanErrorString = t });
    }

    Component.onDestruction: {
        U.saveTextToUrl("./douban_api_data.json",doubanAPIArguments);
    }

    onDoubanAPIArgumentsChanged: {
        var r = JSON.parse(doubanAPIArguments);
        if(r.hasOwnProperty("code")){
            console.debug(r.code);
            console.debug(r.msg);
            console.debug(r.request);
            return;
        }
        if(r.hasOwnProperty("access_token")){
            console.debug("access_token : ",r.access_token);
            doubanAccessToken = r.access_token;
            doubanRefreshToken = r.refresh_token;
            doubanUserName = r.douban_user_name;
            doubanUserId = r.douban_user_id;
        }
        U.saveTextToUrl("./douban_api_data.json",doubanAPIArguments);
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
}
/*
{
    "doubanAuthorizationCode" : "doubanAuthorizationCode",
    "doubanAccessToken" : "doubanAccessToken",
    "doubanRefreshToken" : "doubanRefreshToken",
    "doubanUserName" : "doubanUserName",
    "doubanUserId" : "doubanUserId"
}
*/

