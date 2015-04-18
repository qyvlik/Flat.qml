/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import FlatUI 2.0
import QtMultimedia 5.4

FlatMainWindow {
    id:window;
    title: video.sourceUrl
    width: 640
    height: 480
    color:"black"

    VideoPlayer{
        id:video
        anchors.fill: parent;
    }
}


