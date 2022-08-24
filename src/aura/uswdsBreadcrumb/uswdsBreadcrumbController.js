({
  doInit: function (component, event, helper) {
    const wrapClass =
      component.get("v.wrap") == "Yes" ? "usa-breadcrumb--wrap" : "";
    component.set("v.wrapClass", wrapClass);
  },
  onClick: function (component, event, helper) {
    console.log("I was clicked!");
    var id = event.target.dataset.menuItemId;
    console.log("id", id);
    if (id) {
      component.getSuper().navigate(id);
    }
  }
});
