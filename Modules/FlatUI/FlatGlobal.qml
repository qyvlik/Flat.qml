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
import FlatUI.Private 2.0;

QtObject{

    id:global;
    objectName: "flatGlobal";
    /*   public   */
    readonly property int radius : 2;
    readonly property alias flatGlobal : global;
    readonly property alias font:text.font;

    /* provide a list of flat ui color. */
    // 绿色
    readonly property color colorTurquoise  : "#1abc9c";
    readonly property color colorGreenSea : "#16a085";
    // 翠绿色
    readonly property color colorEmerald : "#2ecc71";
    readonly property color colorNephritis : "#27ae60";
    // 蓝色
    readonly property color colorPeterRiver : "#3498db";
    readonly property color colorBelizeHole : "#2980b9";
    // 紫色
    readonly property color colorAmethyst : "#9b59b6";
    readonly property color colorWisteria : "#8e44ad";
    // 沥青色
    readonly property color colorWetAsphalt : "#34495e";
    readonly property color colorMidnightBlue : "#2c3e50";
    // 橙色
    readonly property color colorSunFlower : "#f1c40f";
    readonly property color colorOrange : "#f39c12";
    // 胡萝卜色
    readonly property color colorCarrot : "#e67e22";
    readonly property color colorPumpkin : "#d35400";
    // 红色
    readonly property color colorAlizarin : "#e74c3c";
    readonly property color colorPomegranate : "#c0392b";
    // 白云色
    readonly property color colorClouds : "#ecf0f1";
    readonly property color colorSilver : "#bdc3c7"; // disable color
    // 水泥色
    readonly property color colorConcrete : "#95a5a6";
    readonly property color colorAsbestos : "#7f8c8d";

    /* such as enumeration */
    readonly property int sizeExtraHuge : 32;
    readonly property int sizeHuge : 25;
    readonly property int sizeLarge : 20;
    readonly property int sizeDefault : 15;
    readonly property int sizeSmall : 12;
    readonly property int sizeExtraSmall :10;

    /* style color type */
    property ActiveColor
    typePrimary: ActiveColor {
        objectName: "typePrimary";
        activeColor:colorGreenSea;
        inactiveColor:colorTurquoise;
        defaultColor:colorTurquoise;
    }

    property ActiveColor
    typeWarning : ActiveColor {
        objectName: "typeWarning";
        activeColor:colorOrange;
        inactiveColor:colorSunFlower;
        defaultColor:colorSunFlower;
    }

    property ActiveColor
    typeDefault: ActiveColor{
        objectName: "typeDanger";
        activeColor:colorSilver;
        inactiveColor:colorClouds;
        defaultColor:colorClouds;
    }

    property ActiveColor
    typeDanger: ActiveColor{
        objectName: "typeDanger";
        activeColor:colorPomegranate;
        inactiveColor:colorAlizarin;
        defaultColor:colorAlizarin;
    }

    property ActiveColor
    typeSuccess: ActiveColor{
        objectName: "typeSuccess";
        activeColor:colorNephritis;
        inactiveColor:colorEmerald;
        defaultColor:colorEmerald;
    }

    property ActiveColor
    typeInverse: ActiveColor{
        objectName: "typeInverse";
        activeColor:"#34495e"
        inactiveColor:"#293a2f"
        defaultColor:"#293a2f"
    }

    property ActiveColor
    typeInfo: ActiveColor{
        objectName: "typeInfo";
        activeColor:colorBelizeHole;
        inactiveColor:colorPeterRiver;
        defaultColor:colorPeterRiver;
    }

    property ActiveColor
    typeDisabled: ActiveColor{
        objectName: "typeDisabled";
        activeColor:colorSilver;
        inactiveColor:colorSilver;
        defaultColor:colorSilver;
    }

    /* for window show state*/
    // -1,0,1,2,3,4
    //close, show, showNormal, showFullScreen, showMaxmized, showMinmized;
    readonly property int close:-1;
    readonly property int showMinmized : 1;
    readonly property int showNormal : 2;
    readonly property int showMaxmized : 3;
    readonly property int showFullScreen : 4;

    /* */
    property QtObject windowTypeDialog;
    property QtObject windowTypeMainWindow;
    property QtObject windowTypeGLWindow;

    /* icon type  */
    property FlatIconName
    iconTypeClose: FlatIconName{
        defaultIcon:"./Resource/icons/Close.png";
        hoverIcon:"./Resource/icons/CloseHover.png";
        pressIcon:"./Resource/icons/CloseHover.png";
    }
    property FlatIconName
    iconTypeShowMax: FlatIconName{
        defaultIcon:"./Resource/icons/Maximize.png";
        hoverIcon:"./Resource/icons/MaximizeHover.png";
        pressIcon:"./Resource/icons/MaximizeHover.png";
    }
    property FlatIconName
    iconTypeShowMin: FlatIconName{
        defaultIcon:"./Resource/icons/Minimize.png";
        hoverIcon:"./Resource/icons/MinimizeHover.png";
        pressIcon:"./Resource/icons/MinimizeHover.png";
    }
    property FlatIconName
    iconTypeShowRestore: FlatIconName{
        defaultIcon:"./Resource/icons/Restore.png";
        hoverIcon:"./Resource/icons/RestoreHover.png";
        pressIcon:"./Resource/icons/RestoreHover.png";
    }

    property FlatIconName
    iconTypeOpenFile: FlatIconName{
        defaultIcon:"./Resource/icons/File.png";
        hoverIcon:"./Resource/icons/FileHover.png";
        pressIcon:"./Resource/icons/FilePressed.png";
    }

    property FlatIconName
    iconTypeBack: FlatIconName{
        defaultIcon:"./Resource/icons/Back.png";
        hoverIcon:"./Resource/icons/BackHover.png";
        pressIcon:"./Resource/icons/BackPressed.png";
    }


    function createQmlObjectFromUrl(url,p){
        if(!p) p = global;

        var component,e,object = {};
        console.debug("Component status:[Null:0,Ready:1,Loading:2,Error:3]")
        try {
            component = Qt.createComponent(url);
            console.debug("component status :",component.status)
            console.debug("component url :",component.url)
        }catch(e){
            console.debug(e);
        }
        if (component.status == Component.Ready){
            try{
                object = component.createObject(p);
                return object;
            } catch (e){
                console.debug("create object have some error:\n",e);
                return object;
            }
        }
    }

    function createFlatElement(element,p){
        var elementUrl = String("./element/"+element+".qml");
        console.debug("will create ",element, " from :",elementUrl);
        return createQmlObjectFromUrl(elementUrl,p);
    }

    /*   private   */
    property FontLoader
    __fontLoader : FontLoader{
        objectName: "fontLoader"
        id:__fontLoader;
        //source:"./Resource/ttf/lato-regular.ttf"; //
        source:"./Resource/ttf/NotoSansHans-Regular.otf";
    }
    property Text __text: Text{
        id:text;
        font.family: __fontLoader.name;
        font.pointSize: sizeDefault;
    }

    Component.onCompleted: console.debug("Flat Global object was created once");
    Component.onDestruction: console.debug("Flat Global object was destructed");
}
