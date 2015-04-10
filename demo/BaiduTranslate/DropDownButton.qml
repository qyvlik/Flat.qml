/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import FlatUI 2.0

FlatButton {
    id:b
    property variant tr
    property bool flag: true
    type: FlatGlobal.typeInverse
    text : "自动检测";

    /*
    readonly property variant
    fromAndToList : ["auto","zh", "en", "jp",
        "kor", "spa", "fra",
        "th","ara", "ru",
        "pt", "yue", "wyw",
        "zh",  "de", "it"];

    readonly property variant
    fromAndToListUser:["自动检测","中文", "英语", "日语",
        "韩语", "西班牙语", "法语",
        "泰语","阿拉伯语", "俄罗斯语",
        "葡萄牙语", "粤语", "文言文",
        "白话文",  "德语", "意大利语 "];
    */


    // 菜单 ，由于不能使用repeater，就这么冗余的写了
    menu:FlatMenu{
        MenuItem{
            text:tr.fromAndToListUser[0];
            onTriggered: {
                flag?tr.from = tr.fromAndToList[0]:tr.to = tr.fromAndToList[0];
                b.text = text;
            }
        }
        MenuItem{
            text:tr.fromAndToListUser[1];
            onTriggered: {
                flag?tr.from = tr.fromAndToList[1]:tr.to = tr.fromAndToList[1];
                b.text = text;
            }
        }
        MenuItem{
            text:tr.fromAndToListUser[2];
            onTriggered: {
                flag?tr.from = tr.fromAndToList[2]:tr.to = tr.fromAndToList[2];
                b.text = text;
            }
        }
        MenuItem{
            text:tr.fromAndToListUser[3];
            onTriggered: {
                flag?tr.from = tr.fromAndToList[3]:tr.to = tr.fromAndToList[3];
                b.text = text;
            }
        }
        MenuItem{
            text:tr.fromAndToListUser[4];
            onTriggered: {
                flag?tr.from = tr.fromAndToList[4]:tr.to = tr.fromAndToList[4];
                b.text = text;
            }
        }
        MenuItem{
            text:tr.fromAndToListUser[5];
            onTriggered: {
                flag?tr.from = tr.fromAndToList[5]:tr.to = tr.fromAndToList[5];
                b.text = text;
            }
        }
        MenuItem{
            text:tr.fromAndToListUser[6];
            onTriggered: {
                flag?tr.from = tr.fromAndToList[6]:tr.to = tr.fromAndToList[6];
                b.text = text;
            }
        }
        MenuItem{
            text:tr.fromAndToListUser[7];
            onTriggered: {
                flag?tr.from = tr.fromAndToList[7]:tr.to = tr.fromAndToList[7];
                b.text = text;
            }
        }
        MenuItem{
            text:tr.fromAndToListUser[8];
            onTriggered: {
                flag?tr.from = tr.fromAndToList[8]:tr.to = tr.fromAndToList[8];
                b.text = text;
            }
        }
        MenuItem{
            text:tr.fromAndToListUser[9];
            onTriggered: {
                flag?tr.from = tr.fromAndToList[9]:tr.to = tr.fromAndToList[9];
                b.text = text;
            }
        }
        MenuItem{
            text:tr.fromAndToListUser[10];
            onTriggered: {
                flag?tr.from = tr.fromAndToList[10]:tr.to = tr.fromAndToList[10];
                b.text = text;
            }
        }

        MenuItem{
            text:tr.fromAndToListUser[11];
            onTriggered: {
                flag?tr.from = tr.fromAndToList[11]:tr.to = tr.fromAndToList[11];
                b.text = text;
            }
        }
        MenuItem{
            text:tr.fromAndToListUser[12];
            onTriggered: {
                flag?tr.from = tr.fromAndToList[12]:tr.to = tr.fromAndToList[12];
                b.text = text;
            }
        }
        MenuItem{
            text:tr.fromAndToListUser[13];
            onTriggered: {
                flag?tr.from = tr.fromAndToList[13]:tr.to = tr.fromAndToList[13];
                b.text = text;
            }
        }
        MenuItem{
            text:tr.fromAndToListUser[14];
            onTriggered: {
                flag?tr.from = tr.fromAndToList[14]:tr.to = tr.fromAndToList[14];
                b.text = text;
            }
        }
        MenuItem{
            text:tr.fromAndToListUser[15];
            onTriggered: {
                flag?tr.from = tr.fromAndToList[15]:tr.to = tr.fromAndToList[15];
                b.text = text;
            }
        }
    }
}

