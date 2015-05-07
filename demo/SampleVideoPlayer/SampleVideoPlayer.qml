/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/

import FlatUI 2.0
import QtMultimedia 5.4

FlatMainWindow {
    id:window;
    title: video.sourceUrl
    width: 640
    height: 480
    color:"black"
    visible:true

    VideoPlayer{
        id:video
        anchors.fill: parent;
    }
}


