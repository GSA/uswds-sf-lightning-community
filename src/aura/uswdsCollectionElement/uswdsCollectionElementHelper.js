({
  setDateValues: function (component) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    const monthsAbbreviated = [
      "JAN",
      "FEB",
      "MAR",
      "APR",
      "MAY",
      "JUN",
      "JUL",
      "AUG",
      "SEP",
      "OCT",
      "NOV",
      "DEC"
    ];
    if (component.get("v.collectionElement.metaPublishingDate")) {
      const date = new Date(
        component.get("v.collectionElement.metaPublishingDate")
      );
      this.validateDate(component, date);

      component.set(
        "v.longformDate",
        `${months[date.getMonth()]} ${date.getDate()}, ${date.getFullYear()}`
      );
      component.set("v.monthAbbreviation", monthsAbbreviated[date.getMonth()]);
      component.set("v.day", date.getDate());
    }
  },
  validateDate: function (component, date) {
    if (!(date instanceof Date) || date.toString() === "Invalid Date") {
      const builderNotificationContent = {
        title: "Error - USWDS Collection Element",
        message: `Validation error, an invalid date value was provided. Valid JavaScript date formats are supported. Additional details are logged to the console.`
      };
      this.createNotification(component, builderNotificationContent, [
        `${builderNotificationContent.title} -- ${builderNotificationContent.message}`,
        "Valid date formats can be found at https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date"
      ]);
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
