({
  addNotification: function (component, event, helper) {
    var builderNotificationArray = component.get("v.builderNotificationArray");
    var newNotification = event.getParam("arguments");
    component.set(
      "v.builderNotificationArray",
      builderNotificationArray.concat(newNotification.value)
    );
  }
});
