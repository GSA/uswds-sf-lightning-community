({
  doInit: function (component, event, helper) {
    component.set("v.allData", helper.generateData());
    component.set(
      "v.totalPages",
      Math.ceil(component.get("v.allData").length / component.get("v.pageSize"))
    );
    helper.buildData(component);
  },
  handleCurrentPageNumberChange: function (component, event, helper) {
    helper.buildData(component);
  }
});
