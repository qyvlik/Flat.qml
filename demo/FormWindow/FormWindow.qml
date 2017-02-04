import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import FlatUI 2.0
import FlatUI.Private 2.0

ResizeableWindow {
    id: window
    title: "Form Window"
    visible: true
    width: 730
    height: 480
    content: Item{
        Column{
            anchors.centerIn: parent
            spacing: 10
            GroupBox {
                title: "Submit From"
                Row{
                    spacing: 10
                    Column {
                        spacing: 10
                        FlatTextField{
                            id:address
                            placeholderText: qsTr("address")
                        }
                        FlatTextField{
                            id:reason
                            placeholderText: qsTr("reason")
                        }
                        FlatTextField{
                            id:phone
                            placeholderText: qsTr("phone")
                        }
                    }
                    GroupBox {
                        title: "more"
                        TextArea {
                            id:moreInfo
                            font:FlatGlobal.font
                        }
                    }
                }
            }

            FlatButton{
                text:"Submit"
                onClicked:submit()
                function submit() {
                    var from = "address="+ FlatGlobal.urlEncode(address.text)
                            + "&phone="+ FlatGlobal.urlEncode(phone.text)
                            + "&reason=" +FlatGlobal.urlEncode(reason.text)
                            + "&more=" + FlatGlobal.urlEncode(moreInfo.text);
                    console.debug(from);
                }
            }
        }


        SiderBar{
            id:siderBar
            header:Item{
                width: siderBar.width
                height: FlatGlobal.sizeHuge
            }
            model: VisualItemModel {
                // Settings UI
                Item{
                    width: siderBar.width
                    height: siderBar.height
                    Column {
                        anchors.horizontalCenter:  parent.horizontalCenter
                        anchors.margins: 10
                        spacing:5
                        Item{
                            height: 10
                            width:parent.width
                        }

                        FlatTextField{
                            id:userName
                            width: 180
                            size:FlatGlobal.sizeExtraSmall
                            type:FlatGlobal.typePrimary
                            placeholderText:"User Name"
                        }

                        FlatTextField{
                            id:password
                            width: 180
                            size:FlatGlobal.sizeExtraSmall
                            type:FlatGlobal.typePrimary
                            placeholderText:"password"
                            echoMode: TextInput.Password
                        }

                        FlatButton{
                            size:FlatGlobal.sizeExtraSmall
                            type:FlatGlobal.typePrimary
                            text:"login"
                            width:180
                            onClicked: {
                                window.controlSiderBar();
                            }
                        }
                    }
                }
            }
        }

        Component.onCompleted: {
            window.controlSiderBar.connect(function(){
                var nil =  siderBar.isShow?siderBar.close():siderBar.show();
            });
        }
    }
}
