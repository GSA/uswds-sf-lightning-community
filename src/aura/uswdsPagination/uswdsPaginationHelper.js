({
  createPagination: function (cmp, pagination, language) {
    for (var i = 0; i < pagination.length; i++) {
      var cmpArray;
      //
      if (pagination[i].type == "Page Number") {
        cmpArray = this.createPageNo(cmp, pagination[i], language);
      } else if (pagination[i].type == "Overflow") {
        cmpArray = this.createOverflow(cmp, pagination[i], language);
      } else if (pagination[i].type == "Previous") {
        cmpArray = this.createPrevious(cmp, pagination[i], language);
      } else if (pagination[i].type == "Next") {
        cmpArray = this.createNext(cmp, pagination[i], language);
      } else {
        cmpArray = this.createPageNo(cmp, pagination[i], language);
      }
      this.createPaginationItem(cmp, cmpArray);
    }
  },
  createPrevious: function (cmp, page, language) {
    return [
      [
        "aura:html",
        {
          tag: "li",
          HTMLAttributes: {
            class: "usa-pagination__item usa-pagination__arrow"
          }
        }
      ],
      [
        "aura:html",
        {
          tag: "a",
          HTMLAttributes: {
            name: "",
            class: "usa-pagination__link usa-pagination__previous-page",
            onclick: cmp.getReference("c.onPrev"),
            "aria-label": language.previousAria
          }
        }
      ],
      [
        "aura:html",
        {
          tag: "span",
          body: language.previous,
          HTMLAttributes: {
            class: "usa-pagination__link-text"
          }
        }
      ]
    ];
  },
  createNext: function (cmp, page, language) {
    return [
      [
        "aura:html",
        {
          tag: "li",
          HTMLAttributes: {
            class: "usa-pagination__item usa-pagination__arrow"
          }
        }
      ],
      [
        "aura:html",
        {
          tag: "a",
          HTMLAttributes: {
            name: "",
            class: "usa-pagination__link usa-pagination__next-page",
            onclick: cmp.getReference("c.onNext"),
            "aria-label": language.nextAria
          }
        }
      ],
      [
        "aura:html",
        {
          tag: "span",
          body: language.next,
          HTMLAttributes: {
            class: "usa-pagination__link-text"
          }
        }
      ]
    ];
  },
  createOverflow: function (cmp, page, language) {
    return [
      [
        "aura:html",
        {
          tag: "li",
          HTMLAttributes: {
            class: "usa-pagination__item usa-pagination__overflow",
            role: "presentation"
          }
        }
      ],
      [
        "aura:html",
        {
          tag: "span",
          body: String(page.content)
        }
      ]
    ];
  },
  createPageNo: function (cmp, page, language) {
    return [
      [
        "aura:html",
        {
          tag: "li",
          HTMLAttributes: {
            class: "usa-pagination__item usa-pagination__page-no"
          }
        }
      ],
      [
        "aura:html",
        {
          tag: "a",
          body: String(page.content),
          HTMLAttributes: {
            name: String(page.content),
            "aria-label": page.isLast
              ? language.lastPage + " " + String(page.content)
              : language.page + " " + String(page.content),
            "aria-current": page.isCurrent ? language.page : "",
            class: page.isCurrent
              ? "usa-pagination__button usa-current"
              : "usa-pagination__button",
            onclick: cmp.getReference("c.processMe")
          }
        }
      ]
    ];
  },
  createPaginationItem: function (cmp, componentArray) {
    $A.createComponents(
      componentArray,
      function (components, status, errorMessage) {
        //Add the new button to the body array
        if (status === "SUCCESS") {
          var li = components[0];
          var a = components[1];
          // previous and next components have 3 parts, all others have 2
          if (components[2] != undefined) {
            var span = components[2];
            a.set("v.body", span);
          }
          li.set("v.body", a);
          var body = cmp.get("v.body");
          body.push(li);
          cmp.set("v.body", body);
        } else if (status === "INCOMPLETE") {
          console.warn("No response from server or client is offline.");
          // Show offline error
        } else if (status === "ERROR") {
          console.error("Error: " + errorMessage);
          // Show error message
        }
      }
    );
  },
  languageMap: function (language) {
    var content = {
      English: {
        lastPage: "Last page, page",
        next: "Next",
        nextAria: "Next Page",
        page: "Page",
        previous: "Previous",
        previousAria: "Previous page"
      },
      Spanish: {
        lastPage: "Última página, página",
        next: "Siguiente",
        nextAria: "Siguiente página",
        page: "Página",
        previous: "Anterior",
        previousAria: "Anterior página"
      }
    };
    return content[language];
  },
  validation: function (cmp) {
    var ariaLabel = cmp.get("v.paginationAria");
    if (ariaLabel == "") {
      const builderNotificationContent = [
        {
          title: "Error - USWDS Pagination",
          message: `Validation error, paginationAria is blank and requires input. Without a paginationAria value, screen readers will lack appropriate descriptive text and users who rely on Aria will have difficulty navigating.`
        }
      ];
      cmp
        .find("builderNotification")
        .addNotification(builderNotificationContent);
    }
  }
});
