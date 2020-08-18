({
    doInit : function(component, event, helper) {
        var justification = component.get("v.menuJustification");
        // uses USWDS Flex Justify https://designsystem.digital.gov/utilities/flex/#utility-flex-align
        // given input from menuJustification, lookup value in object below and return desired class
        var map = {'Right': 'flex-justify-end', 'Left': 'flex-justify-start', 'Center': 'flex-justify-center'};
        component.set("v.menuJustificationClass", map[justification]);
    },
    onClick: function(component, event, helper) {
        var id = event.target.dataset.menuItemId;
        if (id) {
            component.getSuper().navigate(id);
        }
   }
})