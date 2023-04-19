describe("Identifier", function () {
  // declare any variables that need to be available in each test
  var identityDomain = "awesomesite.gsa.gov";
  var agencyName = "General Services Administration";
  var agencyURL = "gsa.gov";
  var agencyName2 = "Office of Management and Budget";
  var agencyURL2 = "omb.gov";
  var agencyLogo2;
  var contentMap = {
    English: {
      identifierAria: "Agency Identifier",
      identifierLogoAlt: agencyName + " Logo",
      identityAria: "Agency Description",
      identityDomain: identityDomain,
      identityDisclaimer:
        "An official website of the <a href='" +
        agencyURL +
        "' class='usa-link'>" +
        agencyName +
        "</a>",
      requiredLinksAria: "Important Links",
      usaGovAria: "U.S. Government information and services",
      usaGovDescription:
        "Looking for U.S. government information and services?",
      usaGovLinkText: "Visit USA.gov"
    },
    Spanish: {
      identifierAria: "Identificador de la agencia",
      identifierLogoAlt: agencyName + " Logo",
      identityAria: "Descripción de la agencia",
      identityDomain: identityDomain,
      identityDisclaimer:
        "Un sitio web oficial de <a href='" +
        agencyURL +
        "' class='usa-link'>" +
        agencyName +
        "</a>",
      requiredLinksAria: "Enlaces importantes",
      usaGovAria: "Información y servicios del Gobierno de EE. UU.",
      usaGovDescription: "¿Necesita información y servicios del Gobierno?",
      usaGovLinkText: "Visite USAGov en Español"
    },
    "Multi w Logo English": {
      identifierAria: "Agency Identifier",
      identifierLogoAlt: agencyName + " Logo",
      identityAria: "Agency Description",
      identityDomain: identityDomain,
      identifierLogoAlt2: agencyName2 + " Logo",
      identityDisclaimer:
        "An official website of the <a href='" +
        agencyURL +
        "' class='usa-link'>" +
        agencyName +
        "</a> and the <a href='" +
        agencyURL2 +
        "' class='usa-link'>" +
        agencyName2 +
        "</a>",
      requiredLinksAria: "Important Links",
      usaGovAria: "U.S. Government information and services",
      usaGovDescription:
        "Looking for U.S. government information and services?",
      usaGovLinkText: "Visit USA.gov"
    },
    "Multi w Logo Spanish": {
      identifierAria: "Identificador de la agencia",
      identifierLogoAlt: agencyName + " Logo",
      identityAria: "Descripción de la agencia",
      identityDomain: identityDomain,
      identifierLogoAlt2: agencyName2 + " Logo",
      identityDisclaimer:
        "Un sitio web oficial de <a href='" +
        agencyURL +
        "' class='usa-link'>" +
        agencyName +
        "</a> y <a href='" +
        agencyURL2 +
        "' class='usa-link'>" +
        agencyName2 +
        "</a>",
      requiredLinksAria: "Enlaces importantes",
      usaGovAria: "Información y servicios del Gobierno de EE. UU.",
      usaGovDescription: "¿Necesita información y servicios del Gobierno?",
      usaGovLinkText: "Visite USAGov en Español"
    },
    "Taxpayer Disclaimer English": {
      identifierAria: "Agency Identifier",
      identifierLogoAlt: agencyName + " Logo",
      identityAria: "Agency Description",
      identityDomain: identityDomain,
      identityDisclaimer:
        "An official website of the <a href='" +
        agencyURL +
        "' class='usa-link'>" +
        agencyName +
        "</a>. Produced and published at taxpayer expense.",
      requiredLinksAria: "Important Links",
      usaGovAria: "U.S. Government information and services",
      usaGovDescription:
        "Looking for U.S. government information and services?",
      usaGovLinkText: "Visit USA.gov"
    },
    "Taxpayer Disclaimer Spanish": {
      identifierAria: "Identificador de la agencia",
      identifierLogoAlt: agencyName + " Logo",
      identityAria: "Descripción de la agencia",
      identityDomain: identityDomain,
      identityDisclaimer:
        "Un sitio web oficial de <a href='" +
        agencyURL +
        "' class='usa-link'>" +
        agencyName +
        "</a>. Producido y publicado con dinero de los contribuyentes de impuestos.",
      requiredLinksAria: "Enlaces importantes",
      usaGovAria: "Información y servicios del Gobierno de EE. UU.",
      usaGovDescription: "¿Necesita información y servicios del Gobierno?",
      usaGovLinkText: "Visite USAGov en Español"
    }
  };

  beforeEach(function () {});
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });
  it("renders using default values", function (done) {
    $T.createComponent("c:uswdsIdentifier", {}, true)
      .then(function (component) {
        expect(
          document
            .querySelectorAll(".usa-identifier__identity")[0]
            .getAttribute("aria-label")
        ).toEqual(contentMap.English.identityAria);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("renders identity domain", function (done) {
    $T.createComponent(
      "c:uswdsIdentifier",
      { identityDomain: identityDomain },
      true
    )
      .then(function (component) {
        expect(
          document.querySelectorAll(".usa-identifier__identity-domain")[0]
            .innerHTML
        ).toContain(identityDomain);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });

  describe("identifier types", function () {
    for (const [key, value] of Object.entries(contentMap)) {
      console.log("content key", contentMap[key]);
      console.log("value", value);
      it(`displays proper text for ${key} variant`, function (done) {
        $T.createComponent("c:uswdsIdentifier", { identifierType: key }, true)
          .then(function (component) {
            expect(
              document
                .querySelectorAll(".usa-identifier__identity")[0]
                .getAttribute("aria-label"),
              "usa-identifier__identity aria-label"
            ).toEqual(value.identityAria);
            /* does not match, jest tests do not return full contents of selector 
            expect(
              document.querySelectorAll(
                ".usa-identifier__identity-disclaimer"
              )[0].innerText,
              "usa-identifier__identity-disclaimer"
            ).toContain(value.identityDisclaimer); */
            expect(
              document
                .querySelectorAll(".usa-identifier__section--required-links")[0]
                .getAttribute("aria-label"),
              "usa-identifier__section--required-links"
            ).toEqual(value.requiredLinksAria);
            expect(
              document
                .querySelectorAll(".usa-identifier__section--usagov")[0]
                .getAttribute("aria-label"),
              "usa-identifier__section--usagov"
            ).toEqual(value.usaGovAria);
            expect(
              document.querySelectorAll(
                ".usa-identifier__usagov-description"
              )[0].innerText,
              "usa-identifier__usagov-description"
            ).toEqual(value.usaGovDescription);
            expect(
              document.querySelectorAll("[href='https://www.usa.gov/']")[0]
                .innerText
            ).toEqual(value.usaGovLinkText);
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
    }
  });
});
