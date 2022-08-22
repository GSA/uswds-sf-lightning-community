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
  },
  handleChildComponentInitEvent: function (component, event, helper) {
    var valueFromChild = event.getParam("label");
    const breadcrumbList = component.get("v.breadcrumbList");
    if (breadcrumbList == "") {
      component.set("v.breadcrumbList", valueFromChild);
    } else {
      component.set("v.breadcrumbList", breadcrumbList + "," + valueFromChild);
    }
  },
  handleChildComponentClickEvent: function (component, event, helper) {
    var valueFromChild = event.getParam("menuId");
    component.getSuper().navigate(valueFromChild);
  }
});
