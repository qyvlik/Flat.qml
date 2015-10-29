import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import FlatUI 2.0
import FlatUI.Private 2.0

MyWindow{
    id:window
    title:"丁丁维修"
    visible:true // very import property!!
    width: 730
    height: 480
    content: Item{
        id:c
        Column{
            anchors.centerIn: parent
            spacing: 10
            GroupBox {
                title: "提交维修"
                Row{
                    spacing: 10
                    Column {
                        spacing: 10
                        FlatTextField{
                            id:address
                            placeholderText: qsTr("输入地址")
                        }
                        FlatTextField{
                            id:reason
                            placeholderText: qsTr("保修原因")
                        }
                        FlatTextField{
                            id:phone
                            placeholderText: qsTr("联系电话")
                        }
                    }
                    GroupBox {
                        title: "故障详情"
                        TextArea {
                            id:moreInfo
                            font:FlatGlobal.font
                        }
                    }
                }
            }

            FlatButton{
                text:"提交报表"
                onClicked:submit();
                function submit(){
                    var from = "Address="+ FlatGlobal.urlEncode(address.text)
                            + "&Phone="+ FlatGlobal.urlEncode(phone.text)
                            + "&Reason=" +FlatGlobal.urlEncode(reason.text)
                            + "&More=" + FlatGlobal.urlEncode(moreInfo.text)
                            + "&submit=" + FlatGlobal.urlEncode("提交");
                    console.debug(from);
                    var url = "http://poipoipoi.sinaapp.com/api/get_repair_from.php"; // 提交订单的页面
                    var doc = new XMLHttpRequest();
                    doc.onreadystatechange = function(){
                        if(doc.readyState == doc.DONE){
                            console.debug(doc.responseText);
                        }
                    }
                    doc.open("POST",url);
                    doc.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
                    doc.send(from);
                }
            }
        }


        SiderBar{
            id:siderBar;
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

    FlatMainWindow{
        id:childrenWindow
        title:qsTr("显示记录")
        visible:true
        width: 720
        height: 480
        content:Item {
            FlatButton{
                id:reflash
                text:"reflash"
                z:parent.z+1
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                onClicked: {
                    reflashTable();
                }
            }

            function reflashTable(){
                var url = "http://1.poipoipoi.sinaapp.com/api/show_repair_list.php";
                var doc = new XMLHttpRequest();
                doc.onreadystatechange = function(){
                    if(doc.readyState == doc.DONE){
                        libraryModel.result =doc.responseText;
                        //console.debug(doc.responseText);
                    }
                }
                doc.open("get",url);
                doc.send(null);
            }

            ListModel {
                id: libraryModel
                property string result
                ListElement{
                    address:"2401";
                    phone:"1310000000";
                    reason:"\u662f\u591a\u5c11\u591a\u5c11\u7684";
                    more_reason:"\u591a\u6df1\u7684\u6c34"
                }
                onResultChanged: {
                    libraryModel.clear();
                    var j = JSON.parse(result.toString())
                    for(var i=0;i<j.length; i++){
                        libraryModel.append(j[i]);
                    }
                }
            }

            TableView {
                anchors.fill: parent
                TableViewColumn{ role: "address" ; title: "address" ; width: 100 }
                TableViewColumn{ role: "phone"  ; title: "phone" ; width: 100 }
                TableViewColumn{ role: "reason" ; title: "reason" ; width: 100 }
                TableViewColumn{ role: "more_reason"; title: "more_reason"; width: 500 }
                model: libraryModel;
            }
        }
    }
}
