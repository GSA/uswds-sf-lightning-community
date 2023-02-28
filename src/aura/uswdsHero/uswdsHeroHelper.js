({
  validate: function (component) {
    this.validateAltText(component);
  },
  validateAltText: function (component) {
    if (component.get("v.heroImgAltText") === "") {
      const builderNotificationContent = {
        title: "Error - USWDS Hero",
        message: `Alt Text is missing for the background image. Here is more info about how to write great alt text, https://www.w3.org/TR/WCAG20-TECHS/H37.html`
      };
      component
        .find("builderNotification")
        .addNotification(builderNotificationContent);
    }
  }
});
