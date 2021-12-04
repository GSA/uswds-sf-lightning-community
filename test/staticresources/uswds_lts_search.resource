describe("USWDS Search Component", function () {
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });

  describe("c:uswdsSearch", function () {
    // when reading through this spec.
    it("renders input with name of 'search'", function (done) {
      $T.createComponent("c:uswdsSearch", {}, true)
        .then(function (component) {
          expect(
            document.getElementById("extended-search-field-small").name
          ).toContain("search");
          // end this spec successfully
          done();
        })
        .catch(function (e) {
          // end this spec as a failure
          done.fail(e);
        });
    });
  });
});
