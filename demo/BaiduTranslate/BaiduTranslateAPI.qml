/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.0

QtObject {
    id:tr


    // YQwRndnR16HFR7DiB8YOiEkD
    // 开发者在百度开发者中心注册得到的授权API key
    // 现在竟然不用api也可以进行翻译申请了~
    property string apiKey;

    property string from :"auto";
    property string to :"auto";

    property bool hasError: false;
    property string error_code : "";
    property string error_msg : "";

    // 待翻译内容	 该字段必须为UTF-8编码，并且以GET方式调用API时，需要进行 urlencode 编码。
    property string translateSource;

    property variant rawTranslation;   // 翻译的原生内容

    property string translateResult;  // 翻译的内容

    readonly property variant
    fromAndToList : ["auto","zh", "en", "jp",
        "kor", "spa", "fra",
        "th","ara", "ru",
        "pt", "yue", "wyw",
        "zh",  "de", "it"];

    readonly property variant
    fromAndToListUser:["自动检测","中文", "英语", "日语",
        "韩语", "西班牙语", "法语",
        "泰语","阿拉伯语", "俄罗斯语",
        "葡萄牙语", "粤语", "文言文",
        "白话文",  "德语", "意大利语 "];

    function startTranslater(){
        var translateUrl = String("http://openapi.baidu.com/public/2.0/bmt/translate");
        var doc = new XMLHttpRequest();
        doc.onreadystatechange =
                function() {
                    if (doc.readyState == XMLHttpRequest.DONE) {
                        if(doc.status == 200){
                            rawTranslation = doc.responseText;
                            //console.log("responseText:"+doc.responseText);
                        }else {
                            console.log("status:"+doc.status);
                        }
                    }
                }
        doc.open("GET", translateUrl+"?client_id="+apiKey+"&q="+translateSource+"&from="+from+"&to="+to);
        doc.send();
    }


    function getResult(result_json_text){
        try{
            var jsonObj = JSON.parse(result_json_text);
            if(jsonObj.hasOwnProperty("error_code")){
                hasError = true;
                error_code = jsonObj.error_code;
                console.debug(error_code);
            }
            if(jsonObj.hasOwnProperty("error_msg")){
                error_msg = jsonObj.error_msg;
                console.debug(error_msg);
            }
            if(jsonObj.hasOwnProperty("trans_result")){
                var i;
                translateResult = "";
                hasError = false;
                for(i=0;i<jsonObj.trans_result.length; i++){
                    //console.debug("trans_result src: ",jsonObj.trans_result[i].src);
                    //console.debug("trans_result dst: ",jsonObj.trans_result[i].dst);
                    translateResult+=jsonObj.trans_result[i].dst+'\n';
                }
            }
        }catch(e){
            console.debug(e.name);
            hasError = true;
            translateResult = "";
        }
    }

    onRawTranslationChanged: {
        getResult(tr.rawTranslation);
    }
}

/*
{
    "from": "en",
    "to": "zh",
    "trans_result": [
        {
            "src": "today",
            "dst": "今天"
        },
        {
            "src": "tomorrow",
            "dst": "明天"
        }
    ]
}

{
    "error_code": "52001",
    "error_msg": "TIMEOUT",
    "from": "auto",
    "to": "auto",
    "query": "he's"
}


*/

