({
	doInit : function(component, event, helper) {        
        helper.generatePageList(component, component.get("v.currentPageNumber"));
    },  
    onNext : function(component, event, helper) {        
        window.scroll(0,0);
        var pageNumber = component.get("v.currentPageNumber");
        component.set("v.currentPageNumber", pageNumber+1);
        if (component.get("v.totalPages") == component.get("v.currentPageNumber")) {
            component.set("v.lastPage", true);
        }
    },
    onPrev : function(component, event, helper) {  
        window.scroll(0,0);
        var pageNumber = component.get("v.currentPageNumber");
        component.set("v.currentPageNumber", pageNumber-1);
    },
    processMe : function(component, event, helper) {
        window.scroll(0,0);
        component.set("v.currentPageNumber", parseInt(event.target.name));
        if (component.get("v.totalPages") == component.get("v.currentPageNumber")) {
            component.set("v.lastPage", true);
        } else {
            component.set("v.lastPage", false);
        }
    },
    onFirst : function(component, event, helper) {    
        window.scroll(0,0);
        component.set("v.currentPageNumber", 1);
        component.set("v.lastPage", false);
    },
    onLast : function(component, event, helper) {   
        window.scroll(0,0);
        component.set("v.currentPageNumber", component.get("v.totalPages"));
        component.set("v.lastPage", true);
    },
})