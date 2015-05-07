/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import FlatUI 2.0
import QtQuick.Controls 1.3

FlatDialog{
    id:watchImageOnFullSceen
    title:"查看图片"
    visible:true
    property url imageSource

    function watch(url){
        imageSource = Qt.binding(function(){return url})
        watchImageOnFullSceen.showMaximized()
    }

    content: AnimatedImage {
        id:showImage
        fillMode:Image.PreserveAspectFit
        source: watchImageOnFullSceen.imageSource
        FlatButton{
            text:" 打开图片 "
            onClicked: fileDialog.show()
            opacity: 0.8
        }
    }
    FolderDialog{
        id:fileDialog
        title:" 选择图片 "
        onSelect: {
            if(isFile){
                watch(fileDialog.selectFile);
                fileDialog.close()
            }
        }
    }
}
