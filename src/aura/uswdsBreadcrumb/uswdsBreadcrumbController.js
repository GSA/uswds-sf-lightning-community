({
  doInit: function (component, event, helper) {
    const wrapClass =
      component.get("v.wrap") == "Yes" ? "usa-breadcrumb--wrap" : "";
    component.set("v.wrapClass", wrapClass);
  },
  onClick: function (component, event, helper) {
    var id = event.target.dataset.menuItemId;
    if (id) {
      component.getSuper().navigate(id);
    }
  }
});
