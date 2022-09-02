describe("Builder Notification", function () {
  // declare any variables that need to be available in each test
  var singleArray, multiArray;
  beforeEach(function () {
    singleArray = [
      {
        title: "SingleArray - Developer Warning",
        message: "SingleArray, something something caused an error."
      }
    ];
    multiArray = [
      {
        title: "Developer Warning",
        message: "Developer Warning, something something caused an error."
      },
      {
        title: "Developer Warning2",
        message: "Developer Warning2, Something something caused an error."
      }
    ];
  });
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });
  it("content renders with one item in the array and values passed directly", function (done) {
    $T.createComponent(
      "c:builderNotification",
      { builderNotificationArray: singleArray },
      true
    )
      .then(function (component) {
        expect(
          document.getElementsByClassName("cBuilderNotification").length
        ).toEqual(1);
        expect(
          document.querySelectorAll(".slds-notify__content", " h2")[0]
            .textContent
        ).toContain(singleArray[0].title);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("array of content renders after calling addNotification", function (done) {
    $T.createComponent(
      "c:builderNotification",
      { builderNotificationArray: [] },
      true
    )
      .then(function (component) {
        component.addNotification(multiArray);
        expect(
          document.getElementsByClassName("cBuilderNotification").length
        ).toEqual(2);
        expect(
          document.querySelectorAll(".slds-notify__content", "h2")[0]
            .textContent
        ).toContain(multiArray[0].title);
        expect(
          document.querySelectorAll(".slds-notify__content", "p")[1].textContent
        ).toContain(multiArray[1].message);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("multiple calls to addNotification append results", function (done) {
    $T.createComponent(
      "c:builderNotification",
      { builderNotificationArray: [] },
      true
    )
      .then(function (component) {
        component.addNotification(multiArray);
        expect(
          document.getElementsByClassName("cBuilderNotification").length
        ).toEqual(2);
        component.addNotification(singleArray);
        expect(
          document.getElementsByClassName("cBuilderNotification").length
        ).toEqual(3);
        expect(
          document.querySelectorAll(".slds-notify__content", "p")[2].textContent
        ).toContain(singleArray[0].message);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
});
