/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick 2.3
import FlatUI 2.0

FlatMainWindow{
    title:"check and radio box"
    width: 400
    height: 400
    content: Item{
        Column{
            anchors.centerIn: parent
            spacing: 10
            GroupBox {
                title: "Joining for?"
                Column {
                    spacing: 10
                    FlatCheckBox {
                        text: "Breakfast"
                    }
                    FlatCheckBox {
                        text: "Lunch"
                    }
                    FlatCheckBox {
                        text: "Dinner"
                    }
                    GroupBox {
                        title: "菜脯"
                        RowLayout {
                            ExclusiveGroup { id: tabPositionGroup }
                            FlatRadio {
                                text: qsTr("肉")
                                exclusiveGroup: tabPositionGroup
                                Layout.minimumWidth: 100
                            }
                            FlatRadio {
                                text: qsTr("素食")
                                exclusiveGroup: tabPositionGroup
                                Layout.minimumWidth: 100
                            }
                            FlatRadio {
                                text: qsTr("吃毛线啊")
                                exclusiveGroup: tabPositionGroup
                                Layout.minimumWidth: 100
                            }
                        }
                    }
                }
            }
            RowLayout{
                FlatTextField{
                    id:input
                    placeholderText:"输入验证码"
                }
//                AnimatedImage{
//                    width: 100
//                    height: 60
//                    fillMode: Image.PreserveAspectFit
//                    source:"file:/e:/图片/1.gif"
//                }
            }

            FlatButton{
                text:"提交饿单"
                onClicked:dialog.show();
            }
            FlatDialog{
                id:dialog
                title:"提交成功"
                content:Item{
                    Text{
                        anchors.margins: 10
                        anchors.centerIn: parent
                        wrapMode: Text.WordWrap
                        text:"输入验证码为:"+input.text
                    }
                }
            }
        }
    }
}
