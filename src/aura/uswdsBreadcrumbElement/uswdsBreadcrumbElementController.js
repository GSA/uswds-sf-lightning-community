({
  doInit: function (component, event, helper) {
    var compEvent = component.getEvent("childInit");
    compEvent.setParams({
      label: component.get("v.label")
    });
    compEvent.fire();
  },
  onClick: function (component, event, helper) {
    console.log("I was clicked");
    var compEvent = component.getEvent("clickEvent");
    compEvent.setParams({
      menuId: component.get("v.id")
    });
    compEvent.fire();
  }
});
