describe("Pagination", function () {
  var renderedComponent;
  // declare any variables that need to be available in each test
  beforeEach(function () {});
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });
  describe("Validations and Language Variants", function () {
    it("pagination without aria-label throws validation message", function (done) {
      /**
       * createComponent - generates a component for testing
       * param - string - component reference "c:componentName"
       * param - object - component parameters {attributeA: "", attributeB:""}
       * param - boolean - whether or not the component needs to be rendered)
       */

      $T.createComponent(
        "c:uswdsPagination",
        {
          currentPageNumber: 1,
          pageSize: 10,
          totalPages: 14,
          paginationAria: ""
        },
        true
      )
        .then(function (component) {
          expect(
            document.getElementsByClassName("cBuilderNotification").length
          ).toEqual(1);
          expect(
            document.querySelectorAll(".slds-notify__content", "p")[0]
              .textContent
          ).toContain(
            "Validation error, paginationAria is blank and requires input. Without a paginationAria value, screen readers will lack appropriate descriptive text and users who rely on Aria will have difficulty navigating."
          );
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    it("Spanish language variant", function (done) {
      $T.createComponent(
        "c:uswdsPagination",
        {
          currentPageNumber: 2,
          pageSize: 5,
          totalPages: 3,
          paginationAria: "search results page",
          language: "Spanish"
        },
        true
      )
        .then(function (component) {
          renderedComponent = component;
          return $T.waitFor(function () {
            return renderedComponent.get("v.showPagination") == true;
          });
        })
        .then(function (component) {
          expect(
            document.getElementsByClassName("usa-pagination__link-text").length
          ).toEqual(2);
          expect(
            document.getElementsByClassName("usa-pagination__link-text")[0]
              .textContent
          ).toContain("Anterior");
          expect(
            document.getElementsByClassName("usa-pagination__link-text")[1]
              .textContent
          ).toContain("Siguiente");
          expect(
            document
              .getElementsByClassName("usa-pagination__button usa-current")[0]
              .getAttribute("aria-label")
          ).toContain("Página 2");
          expect(
            document
              .getElementsByClassName("usa-pagination__button usa-current")[0]
              .getAttribute("aria-current")
          ).toContain("Página");
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });

    it("English language variant", function (done) {
      $T.createComponent(
        "c:uswdsPagination",
        {
          currentPageNumber: 3,
          pageSize: 5,
          totalPages: 15,
          paginationAria: "search results page",
          language: "English"
        },
        true
      )
        .then(function (component) {
          renderedComponent = component;
          return $T.waitFor(function () {
            return renderedComponent.get("v.showPagination") == true;
          });
        })
        .then(function (component) {
          expect(
            document.getElementsByClassName("usa-pagination__link-text").length
          ).toEqual(2);
          expect(
            document.getElementsByClassName("usa-pagination__link-text")[0]
              .textContent
          ).toContain("Previous");
          expect(
            document.getElementsByClassName("usa-pagination__link-text")[1]
              .textContent
          ).toContain("Next");
          expect(
            document
              .getElementsByClassName("usa-pagination__button usa-current")[0]
              .getAttribute("aria-label")
          ).toContain("Page 3");
          expect(
            document
              .getElementsByClassName("usa-pagination__button usa-current")[0]
              .getAttribute("aria-current")
          ).toContain("Page");
          expect(
            document.getElementsByClassName("usa-pagination__overflow")[0]
              .childNodes[0].textContent
          ).toContain("...");
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
  });
  describe("Page Numbers, Overflows, and Previous/Next", function () {
    describe("Seven pages and less", function () {
      it("Single page", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 1,
            pageSize: 5,
            totalPages: 1,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(1);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(0);
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(0);
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(1);
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[0]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("Two pages, second page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 2,
            pageSize: 5,
            totalPages: 2,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(3);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Previous");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(0);
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[2]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("Three pages, first page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 1,
            pageSize: 5,
            totalPages: 3,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(4);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Next");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(0);
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[0]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("Three pages, second page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 2,
            pageSize: 5,
            totalPages: 3,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(5);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(2);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Previous");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(0);
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[2]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("Three pages, third page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 3,
            pageSize: 5,
            totalPages: 3,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(4);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Previous");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(0);
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[3]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("Seven pages, first page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 1,
            pageSize: 5,
            totalPages: 7,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(8);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Next");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(0);
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[0]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("Seven pages, second page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 2,
            pageSize: 5,
            totalPages: 7,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(9);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(2);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Previous");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(0);
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[2]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
    });
    describe("Eight page variants", function () {
      it("Eight pages, first page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 1,
            pageSize: 5,
            totalPages: 8,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(8);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Next");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__item")[5]
                .childNodes[0].textContent
            ).toContain("...");
            // current page
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[0]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("Eight pages, second page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 2,
            pageSize: 5,
            totalPages: 8,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(9);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(2);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Previous");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__item")[6]
                .childNodes[0].textContent
            ).toContain("...");
            // current page
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[2]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("Eight pages, third page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 3,
            pageSize: 5,
            totalPages: 8,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(9);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(2);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Previous");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__item")[6]
                .childNodes[0].textContent
            ).toContain("...");
            // current page
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[3]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("Eight pages, fourth page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 4,
            pageSize: 5,
            totalPages: 8,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(9);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(2);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Previous");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__item")[6]
                .childNodes[0].textContent
            ).toContain("...");
            // current page
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[4]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("Eight pages, fifth page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 5,
            pageSize: 5,
            totalPages: 8,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(9);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(2);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Previous");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__item")[2]
                .childNodes[0].textContent
            ).toContain("...");
            // current page
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[4]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("Eight pages, sixth page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 6,
            pageSize: 5,
            totalPages: 8,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(9);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(2);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Previous");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__item")[2]
                .childNodes[0].textContent
            ).toContain("...");
            // current page
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[5]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("Eight pages, seventh page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 7,
            pageSize: 5,
            totalPages: 8,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(9);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(2);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Previous");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__item")[2]
                .childNodes[0].textContent
            ).toContain("...");
            // current page
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[6]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("Eight pages, eighth page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 8,
            pageSize: 5,
            totalPages: 8,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(8);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Previous");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__item")[2]
                .childNodes[0].textContent
            ).toContain("...");
            // current page
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[7]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
    });
    describe("Eight pages and greater", function () {
      it("Nine pages, fifth page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 5,
            pageSize: 5,
            totalPages: 9,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(9);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(2);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Previous");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(2);
            expect(
              document.getElementsByClassName("usa-pagination__item")[2]
                .childNodes[0].textContent
            ).toContain("...");
            expect(
              document.getElementsByClassName("usa-pagination__item")[6]
                .childNodes[0].textContent
            ).toContain("...");
            // current page
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[4]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("25 pages, fifth page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 5,
            pageSize: 5,
            totalPages: 25,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(9);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(2);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Previous");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(2);
            expect(
              document.getElementsByClassName("usa-pagination__item")[2]
                .childNodes[0].textContent
            ).toContain("...");
            expect(
              document.getElementsByClassName("usa-pagination__item")[6]
                .childNodes[0].textContent
            ).toContain("...");
            // current page
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[4]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("25 pages, 23rd page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 23,
            pageSize: 5,
            totalPages: 25,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(9);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(2);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Previous");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__item")[2]
                .childNodes[0].textContent
            ).toContain("...");
            // current page
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[5]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("25 pages, 24th page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 24,
            pageSize: 5,
            totalPages: 25,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(9);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(2);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Previous");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__item")[2]
                .childNodes[0].textContent
            ).toContain("...");
            // current page
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[6]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("25 pages, 25th page current", function (done) {
        $T.createComponent(
          "c:uswdsPagination",
          {
            currentPageNumber: 25,
            pageSize: 5,
            totalPages: 25,
            paginationAria: "search results page",
            language: "English"
          },
          true
        )
          .then(function (component) {
            renderedComponent = component;
            return $T.waitFor(function () {
              return renderedComponent.get("v.showPagination") == true;
            });
          })
          .then(function (component) {
            // total pagination items
            expect(
              document.getElementsByClassName("usa-pagination__item").length
            ).toEqual(8);
            // previous/ next
            expect(
              document.getElementsByClassName("usa-pagination__link-text")
                .length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__link-text")[0]
                .textContent
            ).toContain("Previous");
            // overflow
            expect(
              document.getElementsByClassName("usa-pagination__overflow").length
            ).toEqual(1);
            expect(
              document.getElementsByClassName("usa-pagination__item")[2]
                .childNodes[0].textContent
            ).toContain("...");
            // current page
            expect(
              document
                .getElementsByClassName("usa-pagination__item")[7]
                .childNodes[0].getAttribute("class")
            ).toContain("usa-current");
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
    });
  });
});
