/*
 * 用来依次获取 authorization code, access_token, refresh_token
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import "./"

Text{
    text:"access_token : "+DoubanGlobal.access_token + '\n'
         +"refresh_token : "+ DoubanGlobal.refresh_token + '\n'
         +"douban_user_name : "+ DoubanGlobal.douban_user_name +'\n'
         +"douban_user_id : "+DoubanGlobal.douban_user_id;
}
