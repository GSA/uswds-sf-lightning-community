({
  rerender: function (component, helper) {
    this.superRerender();
    var pagination = _pagination.init(
      component.get("v.totalPages"),
      component.get("v.currentPageNumber")
    );
    // clear component body before rerendering
    component.set("v.body", "");
    var languageMap = helper.languageMap(component.get("v.language"));
    helper.createPagination(component, pagination, languageMap);
  }
});
