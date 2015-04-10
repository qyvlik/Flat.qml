/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/
import QtQuick 2.3
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import FlatUI 2.0

FlatMainWindow {
    id:historySearch
    title:"history search"
    width: 300
    height: 400
    content:Item{
        GroupBox{
            title:"history search"
            anchors.centerIn: parent
            Column{
                spacing: 10
                FlatComboBox{
                    id:searchInput
                    textRole:"name"
                    model:ListModel {
                        id: cbItems
                        Component.onCompleted: {
                            loadSearchHistory(cbItems)
                        }
                    }
                    focus:true
                    Keys.onReturnPressed: {
                        event.accepted = true;
                        searchResult.text =cbItems.get(currentIndex).text
                    }
                }
                TextArea{
                    id:searchResult
                    text:""
                }
            }
        }
    }

    property string historyString
    function loadSearchHistory(model){
        var doc = new XMLHttpRequest()
        doc.onreadystatechange = function() {
            if (doc.readyState == XMLHttpRequest.DONE) {
                historyString = doc.responseText;
                console.debug(historyString);
                model.append(JSON.parse(historyString));
            }
        }
        doc.open("GET",Qt.resolvedUrl("./SearchHistory.json"))
        doc.send(null)
    }
}

