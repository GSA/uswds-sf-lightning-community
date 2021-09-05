({
  doInit: function (component, event, helper) {
    // paginationSetup handles initialization of actual page numbers
    var languageMap = helper.languageMap(component.get("v.language"));
    component.set("v.languageMap", languageMap);
    helper.validation(component);
  },
  onNext: function (component, event, helper) {
    window.scroll(0, 0);
    var pageNumber = component.get("v.currentPageNumber");
    component.set("v.currentPageNumber", pageNumber + 1);
  },
  onPrev: function (component, event, helper) {
    window.scroll(0, 0);
    var pageNumber = component.get("v.currentPageNumber");
    component.set("v.currentPageNumber", pageNumber - 1);
  },
  processMe: function (component, event, helper) {
    window.scroll(0, 0);
    component.set("v.currentPageNumber", parseInt(event.target.name));
    // handleCurrentPageNumberChange happens here
    //this.paginationSetup(component, event, helper);
    var action = component.get("c.paginationSetup");
    $A.enqueueAction(action);
  },
  onFirst: function (component, event, helper) {
    window.scroll(0, 0);
    component.set("v.currentPageNumber", 1);
  },
  onLast: function (component, event, helper) {
    window.scroll(0, 0);
    component.set("v.currentPageNumber", component.get("v.totalPages"));
  },
  paginationSetup: function (component, event, helper) {
    var pagination = _pagination.init(
      component.get("v.totalPages"),
      component.get("v.currentPageNumber")
    );
    var languageMap = helper.languageMap(component.get("v.language"));
    helper.createPagination(component, pagination, languageMap);
    component.set("v.showPagination", true);
  }
});
