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
      const toastContent = {
        title: "Error - USWDS Step Indicator",
        message: `Provided language value "${language}" does not exist for this component. The default language, English, will be displayed. A list of valid values are logged to the developer console.`,
        variant: "warning",
        mode: "sticky"
      };
      const validValues = Object.keys(content);

      const consoleWarningArray = [
        toastContent.title,
        toastContent.message,
        validValues
      ];
      this.createToast(component, toastContent, consoleWarningArray);
      return content.English;
    }
  },
  validateCounters: function (component) {
    const currentStep = component.get("v.currentStep");
    const totalSteps = component.get("v.totalSteps");

    if (currentStep > totalSteps) {
      const toastContent = {
        title: "Error - USWDS Step Indicator",
        message: `The current step value is higher than the total step value.`,
        variant: "warning",
        mode: "sticky"
      };
      const consoleWarningArray = [toastContent.title, toastContent.message];
      this.createToast(component, toastContent, consoleWarningArray);
    }
  },
  createToast: function (component, toastObject, consoleWarningArray) {
    component.find("notifLib").showToast(toastObject);
    console.warn(...consoleWarningArray);
  }
});
