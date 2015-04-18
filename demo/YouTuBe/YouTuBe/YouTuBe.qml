pragma Singleton
import QtQuick 2.0

QtObject {

    signal finished

    readonly property url youTuBeQueryUrl : "https://u.f-q.me/watch?"
    property string youTuBePlayUrl : "http://www.youtube.com/watch?v=7zlvbHow9Gw"
    property string youTuBeVideoId : __GetVIDFromURL()
    property string youTuBeVideoDownloadUrl

    function getYouTuBeVideoDownloadUrl(){
        var doc = new XMLHttpRequest();
        doc.onreadystatechange = function(){
            if(doc.readyState == doc.HEADERS_RECEIVED){
                //console.debug(doc.getAllResponseHeaders());
                youTuBeVideoDownloadUrl = doc.getResponseHeader('location');
                finished();
            }
        }
        doc.open("GET",youTuBeQueryUrl+youTuBeVideoId);
        doc.send(null);
    }

    // "http://www.youtube.com/watch?v=7zlvbHow9Gw"
    function __GetVIDFromURL(){
        try{
            return youTuBePlayUrl.toString().match(/v=\w+$/).toString();
        }catch(e){
            return "v=7zlvbHow9Gw";
        }
    }

    function downloadYouTubeVideoByBroswer(){
        Qt.openUrlExternally(youTuBeVideoDownloadUrl);
    }
}

/*

======download youtube video==============
https://u.f-q.me/watch?v=7zlvbHow9Gw

=======youtube vid========================
http://www.youtube.com/watch?v=7zlvbHow9Gw

server: cloudflare-nginx
date: Sat, 21 Mar 2015 07:28:41 GMT
content-type: text/plain
transfer-encoding: chunked
connection: keep-alive
location: http://g3.f-q.co/video/r6---sn-p5qlsnsd/videoplayback?mt=1426922890&key=yt5&sver=3&itag=22&initcwndbps=12056250&signature=ED99BBAE26D4E4483668B931BDCFCF593911869F.6EDD67C75CB9DA792D71A75344E04C9A8F049E89&upn=DHWE59TeyvY&expire=1426944517&dur=2776.409&source=youtube&mv=m&nh=IgpwcjAxLmlhZDI2KgkxMjcuMC4wLjE&ms=au&ip=162.245.219.105&requiressl=yes&fexp=900720%2C907263%2C916636%2C934954%2C9405135%2C9405696%2C9406851%2C9407103%2C9407821%2C9408101%2C946008%2C948124%2C948703%2C951500%2C951511%2C951703%2C952302%2C952612%2C952901%2C955301%2C957201%2C959701%2C961404%2C965200&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Cmime%2Cmm%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0&mm=31&ratebypass=yes&mime=video%2Fmp4&id=o-AGFHIv7pRHfRgkUioQ2GjZ8YbLJrU34WTsA31uP-QBv-&pl=26
cache-control: max-age=180
cf-ray: 1ca7f0d41b5e11e3-SJC

浏览器自动对访问返回的location网址，然后下载
*/
