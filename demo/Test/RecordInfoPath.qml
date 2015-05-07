/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import FlatUI 2.0

Column{
    spacing:10
    Row{
        spacing:10
        FlatButton { text:"  保修地点  " }
        FlatTextField{ placeholderText:"输入地点" }
    }
    Row{
        spacing:10
        FlatButton { text:"保修人姓名" }
        FlatTextField{ placeholderText:"输入姓名" }
    }
    Row{
        spacing:10
        FlatButton { text:"  手机号码  " }
        FlatTextField{ placeholderText:"输入号码" }
    }
    Row{
        spacing:10
        FlatButton { text:"  故障描述  " }
        FlatTextField{ placeholderText:"输入地点" }
    }
    FlatButton{ text:"选择照片"
        onClicked: folderDialog.show()
    }

    AnimatedImage{
        id:showImage
        fillMode:Image.PreserveAspectFit
        source:"file:/e:/图片/1.gif"
        width: 200
        height: 150
        FlatButton{
            id:showImageToFullscreenLabel
            text:"全屏查看"
            opacity:0
            anchors.right: parent.right
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled:true
            onClicked: watchImageOnFullSceen.watch(showImage.source);
            onEntered: {
                showImageToFullscreenLabel.opacity = 0.8
            }
            onExited: {
                showImageToFullscreenLabel.opacity = 0
            }
        }
    }

    FlatDialog{
        id:watchImageOnFullSceen
        title:"查看图片"
        property url imageSource
        function watch(url){
            imageSource = url
            watchImageOnFullSceen.showFullScreen();
        }
        content: AnimatedImage {
            fillMode:Image.PreserveAspectFit
            source: watchImageOnFullSceen.imageSource
        }
    }
    Row{
        spacing: 10
        FlatButton{
            text:"提交"
            onClicked: submitDialog.show()
        }
        FlatButton{
            text:"提交"
            onClicked: submitDialog.show()
        }
    }
    FolderDialog{
        id:folderDialog
        title:"选择图片"
        onSelect: {
            if(isFile){
                showImage.source = folderDialog.selectFile;
                folderDialog.close()
            }

        }
    }
    FlatDialog{
        id:submitDialog
        title:"提交成功"
        content:Item{
            Text{
                anchors.centerIn: parent
                font:FlatGlobal.font
                text:"提交成功"
            }
        }
    }
}



