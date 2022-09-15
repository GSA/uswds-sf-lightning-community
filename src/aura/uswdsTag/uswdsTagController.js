({
  doInit: function (component, event, helper) {
    const size = component.get("v.size");
    const sizeClass = size.toLowerCase() == "big" ? "usa-tag--big" : "";
    component.set("v.sizeClass", sizeClass);

    const color = component.get("v.color");
    const colorClass = helper.getColor(component, color);
    component.set("v.colorClass", colorClass);
  }
});
