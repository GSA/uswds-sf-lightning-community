({
  doInit: function (component, event, helper) {
    const sizeClass = component.get("v.size") == "Big" ? "usa-tag--big" : "";
    component.set("v.sizeClass", sizeClass);

    const color = component.get("v.color");
    const colorClass = helper.getColor(component, color);
    component.set("v.colorClass", colorClass);
  }
});
