// just from qml file
.pragma library

console.debug("this js file provide a list of function to read and save text");

function readTextFromUrl(url,getTextHandle) {
    url = Qt.resolvedUrl(url);
    if(typeof getTextHandle != "function"){
        throw "getTextHandle not a function";
    }

    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function(){
        if(doc.readyState == doc.DONE) {
            getTextHandle(doc.responseText);
        }
    }
    //doc.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    doc.open("GET",url);
    doc.send(null);
    doc.open("GET",url);
    doc.send(null);
}

function saveTextToUrl(url,text){
    url = Qt.resolvedUrl(url);
    console.debug("SAVE TEXT URL : ",url);
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function(){
        if(doc.readyState = doc.DONE){
            console.debug(doc.responseText);
        }
    }
    doc.open("POST",url);
    doc.send(text);
    doc.open("POST",url);
    doc.send(text);
}
