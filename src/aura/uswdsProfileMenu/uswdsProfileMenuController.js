({
  doInit: function (component, event, helper) {
    var userId = $A.get("$SObjectType.CurrentUser.Id");
    if (userId) {
      component.set("v.loggedIn", true);
    }
  },
  handleMenuSelect: function (component, event, helper) {
    var selectedMenuItemValue = event.getParam("value");
    if (selectedMenuItemValue) {
      component.getSuper().navigate(selectedMenuItemValue);
    }
  }
});
