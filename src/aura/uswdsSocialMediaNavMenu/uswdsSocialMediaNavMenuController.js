({
  doInit: function (cmp, event, helper) {},
  onClick: function (component, event, helper) {
    var id = event.currentTarget.dataset.rowIndex;
    if (id) {
      component.getSuper().navigate(id);
    }
  }
});
