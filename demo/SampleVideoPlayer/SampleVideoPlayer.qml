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
    title: video.source
    width: 640
    height: 480
    color:"black"
    onShowStateChanged:  {
        showState == FlatGlobal.showFullScreen ?
                    toolBar.visible = false : toolBar.visible = true;
        showState == FlatGlobal.showFullScreen ?
                    statusBar.visible = false : statusBar.visible = true;
    }

    Video {
        id: video;
        anchors.fill: parent
        onErrorChanged: {
            console.debug(errorString);
            error.errorText = errorString;
        }
    }

    FloderDialog{
        id:fileDialog
        onSelectFileName: {
            video.pause();
            video.source = filename;
            video.play();
        }
    }

    FlatDialog{
        id:error;
        property string errorText;
        contentControl.anchors.margins: 10
        content: Text{
            text:error.errorText
            font:FlatGlobal.font
            color:FlatGlobal.typeDanger.activeColor;
        }
    }

    MouseArea{
        anchors.fill: parent;
        acceptedButtons: Qt.RightButton
        onClicked:{
            menu.popup();
        }
        FlatMenu{
            id:menu
            MenuItem{
                text:"what's this ?"
                onTriggered: dialog.show();
            }
        }
    }

    FlatDialog{
        id:dialog;
        title:qsTr("about");
        Text{
            wrapMode: Text.WordWrap
            anchors.fill: parent
            anchors.margins: 10
            font:FlatGlobal.font
            text:"tell you how to show a menu in a window\n"
                    +"can use in video player"
        }
    }

    statusBar: VideoPlayerBar{
        width: window.width
        height:FlatGlobal.sizeExtraHuge
        onPlayAction: {
            console.debug(action);
            switch(action){
            case "Rewind":
                video.seek(video.position - 5000)
                break;
            case "Speed":
                video.seek(video.position + 5000)
                break;
            case "OpenFile":
                fileDialog.show();
                break;
            case "Play":
                video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play();
                break;
            case "Stop":
                video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play();
                break;
            case "Pause":
                video.pause();
                break;
            default:
                break;
            }
        }
    }
}


