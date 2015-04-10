/*
 * Component.status : ["Null":0,"Ready":1,"Loading":2,"Error":3]
*/

.pragma library

var component;
var item;

function createObjectsFromUrl(url) {
    component = Qt.createComponent(url);
    if (component.status == 1 /*Component.Ready*/)
        finishCreation();
    else
        component.statusChanged.connect(finishCreation);
}

function finishCreation() {
    if (component.status == 1 /*Component.Ready*/) {
        item = component.createObject();
        if(item == null){
            console.log("Error creating object");
        }
    } else if (component.status == 3 /*Component.Error*/) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}

function createExec(url){
    createObjectsFromUrl(url);
    while(component.status == 1 /*Component.Ready*/
          ||component.status == 3 /*Component.Error*/ ) {
        return item;
    }
}
