/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
 * FlatUI
 * Flat-UI Global Object (global singleton static object)
 * provide a font
 * privide a list of flat-ui color
 * privide a list of size
 *
*/

pragma Singleton
import QtQuick 2.4
import FlatUI.Private 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.3

QtObject{

    id:global
    objectName: "flatGlobal"
    /*   public   */
    readonly property int radius : 2
    readonly property alias flatGlobal : global
    readonly property alias font:text.font

    /* provide a list of flat ui color. */
    // 绿色
    readonly property color colorTurquoise  : "#1abc9c"
    readonly property color colorGreenSea : "#16a085"
    // 翠绿色
    readonly property color colorEmerald : "#2ecc71"
    readonly property color colorNephritis : "#27ae60"
    // 蓝色
    readonly property color colorPeterRiver : "#3498db"
    readonly property color colorBelizeHole : "#2980b9"
    // 紫色
    readonly property color colorAmethyst : "#9b59b6"
    readonly property color colorWisteria : "#8e44ad"
    // 沥青色
    readonly property color colorWetAsphalt : "#34495e"
    readonly property color colorMidnightBlue : "#2c3e50"
    // 橙色
    readonly property color colorSunFlower : "#f1c40f"
    readonly property color colorOrange : "#f39c12"
    // 胡萝卜色
    readonly property color colorCarrot : "#e67e22"
    readonly property color colorPumpkin : "#d35400"
    // 红色
    readonly property color colorAlizarin : "#e74c3c"
    readonly property color colorPomegranate : "#c0392b"
    // 白云色
    readonly property color colorClouds : "#ecf0f1"
    readonly property color colorSilver : "#bdc3c7"  // disable color
    // 水泥色
    readonly property color colorConcrete : "#95a5a6"
    readonly property color colorAsbestos : "#7f8c8d"

    /* such as enumeration */
    readonly property int sizeExtraHuge : 32
    readonly property int sizeHuge : 25
    readonly property int sizeLarge : 20
    readonly property int sizeDefault : 15
    readonly property int sizeSmall : 12
    readonly property int sizeExtraSmall :10

    /* style color type */
    property ActiveColor
    typePrimary: ActiveColor {
        objectName: "typePrimary"
        activeColor:colorGreenSea
        inactiveColor:colorTurquoise
        defaultColor:colorTurquoise
    }

    property ActiveColor
    typeWarning : ActiveColor {
        objectName: "typeWarning"
        activeColor:colorOrange
        inactiveColor:colorSunFlower
        defaultColor:colorSunFlower
    }

    property ActiveColor
    typeDefault: ActiveColor{
        objectName: "typeDanger"
        activeColor:colorSilver
        inactiveColor:colorClouds
        defaultColor:colorClouds
    }

    property ActiveColor
    typeDanger: ActiveColor{
        objectName: "typeDanger"
        activeColor:colorPomegranate
        inactiveColor:colorAlizarin
        defaultColor:colorAlizarin
    }

    property ActiveColor
    typeSuccess: ActiveColor{
        objectName: "typeSuccess"
        activeColor:colorNephritis
        inactiveColor:colorEmerald
        defaultColor:colorEmerald
    }

    property ActiveColor
    typeInverse: ActiveColor{
        objectName: "typeInverse"
        activeColor:"#34495e"
        inactiveColor:"#293a2f"
        defaultColor:"#293a2f"
    }

    property ActiveColor
    typeInfo: ActiveColor{
        objectName: "typeInfo"
        activeColor:colorBelizeHole
        inactiveColor:colorPeterRiver
        defaultColor:colorPeterRiver
    }

    property ActiveColor
    typeDisabled: ActiveColor{
        objectName: "typeDisabled"
        activeColor:colorSilver
        inactiveColor:colorSilver
        defaultColor:colorSilver
    }

    /* for window show state*/
    // -1,0,1,2,3,4
    //close, show, showNormal, showFullScreen, showMaxmized, showMinmized;
    readonly property int close:-1
    readonly property int showMinmized : 1
    readonly property int showNormal : 2
    readonly property int showMaxmized : 3
    readonly property int showFullScreen : 4


    /* icon type  */
    property FlatIconName
    iconTypeClose: FlatIconName{
        defaultIcon:"./resource/icons/Close.png"
        hoverIcon:"./resource/icons/CloseHover.png"
        pressIcon:"./resource/icons/CloseHover.png"
    }
    property FlatIconName
    iconTypeShowMax: FlatIconName{
        defaultIcon:"./resource/icons/Maximize.png"
        hoverIcon:"./resource/icons/MaximizeHover.png"
        pressIcon:"./resource/icons/MaximizeHover.png"
    }
    property FlatIconName
    iconTypeShowMin: FlatIconName{
        defaultIcon:"./resource/icons/Minimize.png"
        hoverIcon:"./resource/icons/MinimizeHover.png"
        pressIcon:"./resource/icons/MinimizeHover.png"
    }
    property FlatIconName
    iconTypeShowRestore: FlatIconName{
        defaultIcon:"./resource/icons/Restore.png"
        hoverIcon:"./resource/icons/RestoreHover.png"
        pressIcon:"./resource/icons/RestoreHover.png"
    }

    property FlatIconName
    iconTypeOpenFile: FlatIconName{
        defaultIcon:"./resource/icons/File.png"
        hoverIcon:"./resource/icons/FileHover.png"
        pressIcon:"./resource/icons/FilePressed.png"
    }

    property FlatIconName
    iconTypeBack: FlatIconName{
        defaultIcon:"./resource/icons/Back.png"
        hoverIcon:"./resource/icons/BackHover.png"
        pressIcon:"./resource/icons/BackPressed.png"
    }

    property FlatIconName
    iconTypeMenu: FlatIconName{
        defaultIcon:"./resource/icons/Menu.png"
        hoverIcon:"./resource/icons/MenuHover.png"
        pressIcon:"./resource/icons/MenuHover.png"
    }

    property FlatIconName
    iconTypePlayerPause: FlatIconName{
        defaultIcon:"./resource/icons/Pause.png"
        hoverIcon:"./resource/icons/PauseHover.png"
        pressIcon:"./resource/icons/PauseHover.png"
    }

    property FlatIconName
    iconTypePlayerStop: FlatIconName{
        defaultIcon:"./resource/icons/Stop.png"
        hoverIcon:"./resource/icons/StopHover.png"
        pressIcon:"./resource/icons/StopHover.png"
    }


    property FlatIconName
    iconTypePlayerPlay: FlatIconName{
        defaultIcon:"./resource/icons/Play.png"
        hoverIcon:"./resource/icons/PlayHover.png"
        pressIcon:"./resource/icons/PlayHover.png"
    }

    property FlatIconName
    iconTypePlayerSpeed: FlatIconName{
        defaultIcon:"./resource/icons/Speed.png"
        hoverIcon:"./resource/icons/SpeedHover.png"
        pressIcon:"./resource/icons/SpeedHover.png"
    }

    property FlatIconName
    iconTypePlayerPrevious: FlatIconName{
        defaultIcon:"./resource/icons/Previous.png"
        hoverIcon:"./resource/icons/PreviousHover.png"
        pressIcon:"./resource/icons/PreviousHover.png"
    }

    property FlatIconName
    iconTypePlayerSequence: FlatIconName{
        defaultIcon:"./resource/icons/Sequence.png"
        hoverIcon:"./resource/icons/SequenceHover.png"
        pressIcon:"./resource/icons/SequenceHover.png"
    }

    property FlatIconName
    iconTypePlayerOnce: FlatIconName{
        defaultIcon:"./resource/icons/Once.png"
        hoverIcon:"./resource/icons/OnceHover.png"
        pressIcon:"./resource/icons/OnceHover.png"
    }
    //Once

    property FlatIconName
    iconTypePlayerCycle: FlatIconName{
        defaultIcon:"./resource/icons/Cycle.png"
        hoverIcon:"./resource/icons/CycleHover.png"
        pressIcon:"./resource/icons/CycleHover.png"
    }

    property FlatIconName
    iconTypePlayerRandom: FlatIconName{
        defaultIcon:"./resource/icons/Random.png"
        hoverIcon:"./resource/icons/RandomHover.png"
        pressIcon:"./resource/icons/RandomHover.png"
    }

    property FlatIconName
    iconTypeFullScreen: FlatIconName{
        defaultIcon:"./resource/icons/FullScreen.png"
        hoverIcon:"./resource/icons/FullScreenHover.png"
        pressIcon:"./resource/icons/FullScreenHover.png"
    }

    property FlatIconName
    iconTypeScale: FlatIconName{
        defaultIcon:"./resource/icons/Scale.png"
        hoverIcon:"./resource/icons/ScaleHover.png"
        pressIcon:"./resource/icons/ScaleHover.png"
    }

    function createQmlObjectFromUrl2(url, parent, properties, callback, error) {
        // url use Qt.resolvedUrl() warp
        properties = properties || {};
        callback = callback || function(object) {
            console.log("createQmlObjectFromUrl2 success:", "object:", object);
        };
        error = error || function(e) {
            console.log("createQmlObjectFromUrl2 fail:", "error:", e)
        }

        var component = Qt.createComponent(url, Component.PreferSynchronous);

        if (component.status === Component.Ready) {
            var qmlObject = component.createObject(parent, properties);
            callback(qmlObject);
        } else {
            error(component.errorString());
        }
    }

    function objectIsNull(object){
        return (!object && typeof(object)!="undefined" && object != 0);
    }

    function saveImageToFile(item, fileName){
        if(Qt.isQtObject(item)){
            return  item.grabToImage(function(result){
                // result QQuickItemGrabResult::saveToFile(QString)
                // fileName 不能是file:// 开头！
                result.saveToFile(fileName.toString());
            });
        } else {
            throw item.toString() + "isn't a Qt or QML object";
        }
    }

    function urlEncode(url){
        return encodeURIComponent(url.toString());
    }

    function urlDecode(url){
        return decodeURIComponent(url.toString());
    }

    /*   private   */
    property FontLoader
    __fontLoader : FontLoader{
        objectName: "fontLoader"
        id:__fontLoader
        source: "ttf/NotoSansHans-Regular.otf"
        /*{
            if(typeof application != "undefined") {
                return "file:/"+application.path+"/"+ "ttf/NotoSansHans-Regular.otf";
            } else {
                return "ttf/NotoSansHans-Regular.otf";
            }
        }*/
    }

    property Text __text: Text{
        id:text;
        font.family: __fontLoader.name
        font.pointSize: sizeDefault
    }

    Component.onCompleted: {
        console.debug("Flat Global object was created once");
    }
    Component.onDestruction: {
        console.debug("Flat Global object was destructed");
    }
}
