import QtQuick 2.3
import QtMultimedia 5.4
import FlatUI 2.0
import FlatUI.Private 2.0
import QtQuick.Layouts 1.1

Item{
    id:videoPlayer
    property alias sourceUrl:mediaPlayer.source
    property int seekStep: 5000

    property int showState : FlatGlobal.showNormal

    property alias loops: mediaPlayer.loops

    readonly property alias playList:__playList
    ListModel {
        // ListElement { filename: "Apple" }
        id:__playList
    }



    function add(url){
        url = Qt.resolvedUrl(url.toString());
        __playList.append({filename:url});
    }

    onShowStateChanged: {
        switch(showState){
        case FlatGlobal.showFullScreen:
            hideBar();
            break;
        case FlatGlobal.showNormal:
            showBar();
            break;
        case FlatGlobal.close:
            videoPlayer.stop();
            break;
        default:
            showBar();
            break;
        }
    }


    readonly property int minutes: Math.floor(mediaPlayer.duration / 60000)
    readonly property int seconds: Math.round((mediaPlayer.duration % 60000) / 1000)
    readonly property int hours : (mediaPlayer.duration / 3600000 > 1) ?Math.floor(mediaPlayer.duration / 3600000):0

    readonly property string
    totalTime:Qt.formatTime(new Date(0, 0, 0, hours, minutes, seconds),qsTr("hh:mm:ss"))

    readonly property int positionSeconds: Math.round((mediaPlayer.position % 60000) / 1000)
    readonly property int positionMinutes: Math.floor(mediaPlayer.position / 60000)
    readonly property int positionHours : (mediaPlayer.position / 3600000 > 1) ?Math.floor(mediaPlayer.position / 3600000):0

    readonly property string
    positionTime: Qt.formatTime(new Date(0, 0, 0, positionHours, positionMinutes, positionSeconds), qsTr("hh:mm:ss"))

    FlatDialog{
        id:messageDialog
        property string message
        content:Item{
            Text {
                width: parent.width
                wrapMode:Text.WordWrap
                text: messageDialog.message
                font:FlatGlobal.font
            }
        }
    }

    FolderDialog{
        id:folderDialog
        onSelect:{
            if(isFile){
                videoPlayer.sourceUrl =
                        Qt.binding(function(){return folderDialog.selectFile;});
                console.debug("play url : ",videoPlayer.sourceUrl);
                folderDialog.hide();
                videoPlayer.play();
            }
        }
    }

    VideoOutput{
        id:videoView
        anchors{
            right: parent.right
            left: parent.left
            top:parent.top
            bottom: playerBar.top
        }
        source: mediaPlayer
        MediaPlayer{
            id: mediaPlayer
            onErrorStringChanged: {
                console.debug("errorString : ",errorString, " error:",error);

                switch(error){
                case MediaPlayer.NoError:
                    messageDialog.message = "The audio cannot be played due to a problem allocating resources.";
                    break;
                case MediaPlayer.ResourceError:
                    messageDialog.message = "The audio cannot be played due to a problem allocating resources.";
                    break;
                case MediaPlayer.FormatError:
                    messageDialog.message = "The audio format is not supported.";
                    break;
                case MediaPlayer.AccessDenied:
                    messageDialog.message = "The audio cannot be played"
                    " due to insufficient permissions.";
                    break;
                case MediaPlayer.NetworkError:
                    messageDialog.message = "The audio cannot be played due to network issues.";
                    break;
                case MediaPlayer.ServiceMissing:
                    messageDialog.message = "The audio cannot be played because the media service could not be instantiated.";
                    break;
                default:
                    messageDialog.message = "Unknow Error";
                    break;
                }
                messageDialog.show();
            }
        }
    }

    Rectangle {
        id:playerBar
        //color:"#293a2f"
        height: 40
        y :  parent.height - playerBar.height
        z:parent.z+1
        anchors.right: parent.right
        anchors.left: parent.left

        states:[
            State{
                name:"showBar"
                PropertyChanges {
                    target: playerBar
                    y:parent.height - playerBar.height
                }
            },
            State{
                name:"hideBar"
                PropertyChanges {
                    target: playerBar
                    y:parent.height+10
                }
            }
        ]
        transitions: Transition {
            NumberAnimation { properties: "y"; duration: 800 ; easing.type: Easing.InOutQuad}
        }

        Item {
            id:sliderBar
            anchors.bottom: playerControlBar.top
            width: parent.width
            height:20
            Text {
                id:totaltime
                // total time
                height: playerBar.height
                horizontalAlignment: Text.AlignHCenter
                //color:"white"
                anchors.left: parent.left
                text: totalTime
                font.family:FlatGlobal.font.family
                font.pointSize: FlatGlobal.sizeExtraSmall
                // 21 May 2001 14:13:09
                //var dateTime = new Date(2001, 5, 21, 14, 13, 09)
            }

            FlatSlider{
                id:playerProcressBar
                type:FlatGlobal.typeInfo
                anchors.left: totaltime.right
                anchors.right: postime.left
                anchors.margins: 2
                anchors.verticalCenter: parent.verticalCenter
                property bool sync: false
                maximumValue: mediaPlayer.duration
                onValueChanged: {
                    if(!sync)
                        mediaPlayer.seek(value);
                }
                Connections {
                    target: mediaPlayer
                    onPositionChanged: {
                        playerProcressBar.sync = true
                        playerProcressBar.value = mediaPlayer.position
                        playerProcressBar.sync = false
                    }
                }
            }

            Text {
                // position time;
                id:postime;
                height: playerBar.height;
                horizontalAlignment: Text.AlignHCenter;
                //color:"white";
                anchors.right: parent.right
                font.family:FlatGlobal.font.family
                font.pointSize: FlatGlobal.sizeExtraSmall
                // 21 May 2001 14:13:09
                //var dateTime = new Date(2001, 5, 21, 14, 13, 09);
                text:positionTime
            }
        }

        Item {
            id:playerControlBar
            height:20
            anchors.rightMargin: 2
            anchors.leftMargin: 10
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.bottom: parent.bottom

            Row {
                anchors.fill: parent
                spacing: height / 2

                FlatIcon{
                    icon:FlatGlobal.iconTypeOpenFile
                    onClicked: {
                        folderDialog.show();
                    }
                }

                Separator{
                    orientation:Qt.Vertical;
                    length:parent.height - 2;
                    color:"#ccc";
                }

                FlatIcon{
                    icon:FlatGlobal.iconTypePlayerPrevious
                    onClicked: mediaPlayer.seek(mediaPlayer.position-seekStep);
                }

                FlatIcon{
                    icon:mediaPlayer.playbackState == MediaPlayer.PlayingState ?
                             FlatGlobal.iconTypePlayerPause :
                             FlatGlobal.iconTypePlayerPlay
                    onClicked: {
                        mediaPlayer.playbackState == MediaPlayer.PlayingState ?
                                    pause() : play() ;
                    }
                }

                FlatIcon{
                    icon:FlatGlobal.iconTypePlayerSpeed
                    onClicked: seek(mediaPlayer.position+seekStep);
                }

                Separator{
                    orientation:Qt.Vertical;
                    length:parent.height - 2;
                    color:"#ccc";
                }
                // loops < 0 ? iconTypePlayerOnce : iconTypePlayerCycle
                FlatIcon{
                    icon:loops != MediaPlayer.Infinite ?
                             FlatGlobal.iconTypePlayerCycle :
                             FlatGlobal.iconTypePlayerOnce
                    onClicked: loops != MediaPlayer.Infinite ?
                                   loops = MediaPlayer.Infinite:loops = 1;
                }
                Separator{
                    orientation:Qt.Vertical;
                    length:parent.height - 2;
                    color:"#ccc";
                }

                FlatIcon{
                    icon:FlatGlobal.iconTypePlayerRandom
                }
                FlatIcon{
                    icon:FlatGlobal.iconTypePlayerSequence
                }
                //iconTypePlayerOnce
            }
        }
    }

    function play(){ mediaPlayer.play(); }
    function pause(){ mediaPlayer.pause(); }
    function stop(){ mediaPlayer.stop(); }

    function seek(pos){
        if(pos < mediaPlayer.duration && pos > 0 )  mediaPlayer.seek(pos);
        if(pos <=0 ) mediaPlayer.seek(0);
    }

    function hideBar(){
        playerBar.state = "hideBar";
    }

    function showBar(){
        playerBar.state = "showBar";
    }
}
