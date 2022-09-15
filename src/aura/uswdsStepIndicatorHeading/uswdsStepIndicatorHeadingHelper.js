({
  getLanguageContent: function (component, language) {
    const content = {
      English: {
        step: "step",
        of: "of"
      },
      Spanish: {
        step: "paso",
        of: "de"
      }
    };

    if (content.hasOwnProperty(language)) {
      return content[language];
    } else {
      const builderNotificationContent = {
        title: "Error - USWDS Step Indicator",
        message: `Provided language value "${language}" does not exist for this component. The default language, English, will be displayed. A list of valid values are logged to the developer console.`
      };
      const validValues = Object.keys(content);

      const consoleWarningArray = [
        builderNotificationContent.title,
        builderNotificationContent.message,
        validValues
      ];
      this.createNotification(
        component,
        builderNotificationContent,
        consoleWarningArray
      );
      return content.English;
    }
  },
  validateCounters: function (component) {
    const currentStep = component.get("v.currentStep");
    const totalSteps = component.get("v.totalSteps");

    if (currentStep > totalSteps) {
      const builderNotificationContent = {
        title: "Error - USWDS Step Indicator",
        message: `The current step value is higher than the total step value.`
      };
      const consoleWarningArray = [
        builderNotificationContent.title,
        builderNotificationContent.message
      ];
      this.createNotification(
        component,
        builderNotificationContent,
        consoleWarningArray
      );
    }
  },
  createNotification: function (
    component,
    builderNotificationContent,
    consoleWarningArray
  ) {
    component
      .find("builderNotification")
      .addNotification(builderNotificationContent);
    console.warn(...consoleWarningArray);
  }
});
