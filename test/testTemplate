describe("{{component name}}", function () {
  // declare any variables that need to be available in each test
  var varA, varB;
  beforeEach(function () {
    varA = "hello";
    varB = {
      label: "Step 1",
      status: "Completed"
    };
  });
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });
  it("{{describe the specific functionality being tested}}", function (done) {
    /**
     * createComponent - generates a component for testing
     * param - string - component reference "c:componentName"
     * param - object - component parameters {attributeA: "", attributeB:""}
     * param - boolean - whether or not the component needs to be rendered)
     */

    $T.createComponent(
      "{{c:componentName}}",
      {
        attributeA: "",
        attributeB: ""
      },
      true
    )
      .then(function (component) {
        expect(
          document.getElementsByClassName("{{my specific class}}").length
        ).toEqual(5);
        expect(
          document.getElementsByClassName("{{my specific class")[0].textContent
        ).toContain(varA);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
});
