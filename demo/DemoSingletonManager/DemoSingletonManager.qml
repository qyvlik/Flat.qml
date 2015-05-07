pragma Singleton
import QtQuick 2.0

QtObject {
    id:demoSingletonManager
    objectName:"DemoSingletonManager"
    property alias youTuBeDownLoad : youtube;

    property list<QtObject> singletonObjects : [
        QtObject {
            id:youtube
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
                            // doc.abort(); // stop
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
                    // careful, you must use try block to run Qt.openUrlExternally(url);
                    try{
                        Qt.openUrlExternally(youTuBeVideoDownloadUrl);
                    }catch(e){
                        console.debug("error :",e);
                    }
                }
            }
        // other singleton object can add here
        // then you can alias the singleton name
    ]

    Component.onCompleted: {
        console.debug("I am the demo singleton object manager, "+
                      "you can set some demo example singleton object in here ");
    }
}

