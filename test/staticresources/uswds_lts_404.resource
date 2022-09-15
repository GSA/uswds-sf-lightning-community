describe("404 Page", function () {
  // declare any variables that need to be available in each test
  var allAttributes;
  beforeEach(function () {
    allAttributes = {
      language: "English",
      urlPattern: "/s/",
      formName: "FormName",
      formUrl: "/formurl",
      contactEmail: "contact@example.com",
      contactPhone: "202-555-5555"
    };
  });
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });
  it("Displays english content correctly", function (done) {
    $T.createComponent(
      "c:uswds404",
      {
        ...allAttributes
      },
      true
    )
      .then(function (component) {
        expect(document.querySelectorAll(".usa-prose h1").length).toEqual(1);
        expect(
          document.querySelectorAll(".usa-prose h1")[0].textContent
        ).toContain("Page not found");
        expect(
          document.querySelectorAll(".usa-prose > p.usa-intro")[0].textContent
        ).toContain(
          "We’re sorry, we can’t find the page you're looking for. It might have been removed, changed its name, or is otherwise unavailable."
        );
        expect(
          document.querySelectorAll(".usa-prose > p")[1].textContent
        ).toContain(
          "If you typed the URL directly, check your spelling and capitalization. Our URLs look like this:"
        );
        expect(
          document.querySelectorAll(".usa-prose > p")[2].textContent
        ).toContain(
          "Visit our homepage for helpful tools and resources, or contact us and we’ll point you in the right direction."
        );
        expect(
          document.querySelectorAll(".usa-button-group > li")[0].textContent
        ).toContain("Visit homepage");

        expect(
          document.querySelectorAll(".usa-prose > p")[3].textContent
        ).toContain("For immediate assistance:");

        expect(
          document.querySelectorAll(".usa-prose > p > strong")[1].textContent
        ).toContain("Error code:");
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });

  it("Displays spanish content correctly", function (done) {
    allAttributes.language = "Spanish";
    $T.createComponent(
      "c:uswds404",
      {
        ...allAttributes
      },
      true
    )
      .then(function (component) {
        expect(document.querySelectorAll(".usa-prose h1").length).toEqual(1);
        expect(
          document.querySelectorAll(".usa-prose h1")[0].textContent
        ).toContain("No se encontró esta página");
        expect(
          document.querySelectorAll(".usa-prose > p.usa-intro")[0].textContent
        ).toContain(
          "Lo sentimos, pero no podemos encontrar la página que busca. Es posible que haya sido eliminada, cambiado de nombre o no esté disponible por ahora."
        );
        expect(
          document.querySelectorAll(".usa-prose > p")[1].textContent
        ).toContain(
          "Si escribió el URL a mano, verifique su ortografía y el uso de mayúsculas. Nuestros URLs aparecen así:"
        );
        expect(
          document.querySelectorAll(".usa-prose > p")[2].textContent
        ).toContain(
          "Visite nuestra página principal para encontrar herramientas y recursos útiles o contáctenos y lo ayudaremos a encontrar lo que busca."
        );
        expect(
          document.querySelectorAll(".usa-button-group > li")[0].textContent
        ).toContain("Visite la página principal");

        expect(
          document.querySelectorAll(".usa-prose > p")[3].textContent
        ).toContain("Para ayuda inmediata:");

        expect(
          document.querySelectorAll(".usa-prose > p > strong")[1].textContent
        ).toContain("Código de error:");
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("Displays all editable attributes", function (done) {
    $T.createComponent(
      "c:uswds404",
      {
        ...allAttributes
      },
      true
    )
      .then(function (component) {
        expect(
          document.querySelectorAll(".usa-prose > p > strong")[0].textContent
        ).toContain(allAttributes.urlPattern);
        expect(
          document.querySelectorAll(".usa-button-group > li")[1].textContent
        ).toContain("FormName");
        expect(
          document.querySelectorAll(".usa-prose > ul > li")[0].textContent
        ).toContain(allAttributes.contactEmail);
        expect(
          document.querySelectorAll(".usa-prose > ul > li")[1].textContent
        ).toContain(allAttributes.contactPhone);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });

  it("Does not display form button if formName is blank", function (done) {
    allAttributes.formName = "";
    $T.createComponent(
      "c:uswds404",
      {
        ...allAttributes
      },
      true
    )
      .then(function (component) {
        expect(
          document.querySelectorAll(".usa-button-group > li").length
        ).toEqual(1);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });

  it("Does not display form button if formUrl is blank", function (done) {
    allAttributes.formUrl = "";
    $T.createComponent(
      "c:uswds404",
      {
        ...allAttributes
      },
      true
    )
      .then(function (component) {
        expect(
          document.querySelectorAll(".usa-button-group > li").length
        ).toEqual(1);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("Only displays email address if contactPhone is blank", function (done) {
    allAttributes.contactPhone = "";
    $T.createComponent(
      "c:uswds404",
      {
        ...allAttributes
      },
      true
    )
      .then(function (component) {
        expect(
          document.querySelectorAll(".usa-prose > ul > li").length
        ).toEqual(1);
        expect(
          document.querySelectorAll(".usa-prose > ul > li")[0].textContent
        ).toContain(allAttributes.contactEmail);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("Only displays contactPhone if contactEmail is blank", function (done) {
    allAttributes.contactEmail = "";
    $T.createComponent(
      "c:uswds404",
      {
        ...allAttributes
      },
      true
    )
      .then(function (component) {
        expect(
          document.querySelectorAll(".usa-prose > ul > li").length
        ).toEqual(1);
        expect(
          document.querySelectorAll(".usa-prose > ul > li")[0].textContent
        ).toContain(allAttributes.contactPhone);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });

  it("Does not display the 'for immediate assistance' section if contactPhone and contactEmail are blank", function (done) {
    allAttributes.contactEmail = "";
    allAttributes.contactPhone = "";
    $T.createComponent(
      "c:uswds404",
      {
        ...allAttributes
      },
      true
    )
      .then(function (component) {
        expect(document.querySelectorAll(".usa-prose > ul").length).toEqual(0);
        expect(
          document.querySelectorAll(".usa-prose > p")[3].textContent
        ).toContain("Error code");
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
});
