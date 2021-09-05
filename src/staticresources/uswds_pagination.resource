/**
 * Establishes a dataset which follows USWDS Pagination guidance and can be iterated over to produce HTML.
 */
window._pagination = (function () {
  var maxSlots;
  var overflowIndicator;
  var magicNumber;
  var totalPages;
  var currentPage;
  var paginationArray = [];
  var slots;

  /**
   * Determines the number of slots to create for the pagination array. USWDS guidance says not to create excess slots. If  total slots are less than the max number of slots, just create the total number.
   */
  function calculateNoSlots() {
    slots = totalPages <= maxSlots ? totalPages : maxSlots;
  }

  /**
   * Creates an empty array with a set number of slots
   */
  function createSlots() {
    for (var i = 0; i < slots; i++) {
      paginationArray.push("");
    }
  }

  /**
   * Inserts a page at a given index number
   * @param {number} index Array location where value should be inserted
   * @param {(number|string)} pageNo Number or overflow indicator of the page that is being created
   * @param {boolean} isCurrent Denotes whether or not page number is current
   * @param {boolean} isLast Denotes whether or not page number is the last page
   */
  function fillSlot(index, pageNo, isCurrent, isLast = false) {
    paginationArray[index] = createPage(pageNo, isCurrent, isLast);
  }

  /**
   * Complets the body of the pagination component page numbers and overflow indicators.
   */
  function fillSlots() {
    // if total pages is less than 7, just count upwards from 1 and denote current page
    if (totalPages <= 7) {
      for (var i = 0; i < totalPages; i++) {
        fillSlot(
          i,
          i + 1,
          currentPage - 1 == i ? true : false,
          i == totalPages ? true : false
        );
      }
    }
    // more than 4 from first and last page, the current page must land in the middle slot (4)
    else if (
      currentPage > magicNumber &&
      totalPages - currentPage >= magicNumber
    ) {
      fillSlot(0, 1, false);
      fillSlot(1, overflowIndicator, false);
      fillSlot(2, currentPage - 1, false);
      fillSlot(magicNumber - 1, currentPage, true);
      fillSlot(4, Number(currentPage) + 1, false);
      fillSlot(5, overflowIndicator, false);
      fillSlot(6, totalPages, false, true);
    }
    // within 4 of the first page
    else if (currentPage <= magicNumber) {
      for (var i = 0; i <= 4; i++) {
        fillSlot(i, i + 1, currentPage - 1 == i ? true : false);
      }
      fillSlot(5, overflowIndicator, false);
      fillSlot(6, totalPages, false, true);
    }
    // within 4 of the last page
    else if (totalPages - currentPage <= magicNumber) {
      fillSlot(0, 1, false);
      fillSlot(1, overflowIndicator, false);
      for (
        var index = 2, pageNo = totalPages - 4;
        index <= 6;
        index++, pageNo++
      ) {
        fillSlot(
          index,
          pageNo,
          currentPage == pageNo ? true : false,
          pageNo == totalPages ? true : false
        );
      }
    }
  }

  /**
   * Pushes or unshifts Next/Previous page to pagination set
   */
  function placePrevNext() {
    if (currentPage != 1) {
      paginationArray.unshift(createPage("Previous", false));
    }
    if (currentPage != totalPages) {
      paginationArray.push(createPage("Next", false));
    }
  }

  /**
   * Creates a page object
   * @param {number} pageNo Page number
   * @param {boolean} isCurrent Denotes if page number is the current page
   * @param {boolean} isLast Denotes if this is the last page in the set
   * @return {Object} pageObject
   */
  function createPage(pageNo, isCurrent, isLast) {
    var type = "";
    if (typeof pageNo == "number") {
      type = "Page Number";
    } else if (pageNo == overflowIndicator) {
      type = "Overflow";
      // if not a number or overflow, just use pageNo contents
    } else {
      type = pageNo;
    }
    var pageObject = {
      content: pageNo,
      isCurrent: isCurrent,
      type: type,
      isLast: isLast
    };
    return pageObject;
  }

  return {
    /**
     * Constructs a pagination class.
     * @param {number} tp total number of pages in the set
     * @param {number} cp current page number
     * @param {number} max=7 maximum number of slots to display
     * @param {string} overflow="..." placeholder to indicate that page numbers are not displayed
     */
    init: function (tp, cp, max = 7, overflow = "...") {
      // clear the array to ensure extra slots don't get added
      paginationArray = [];

      totalPages = tp;
      currentPage = cp;
      maxSlots = max;
      overflowIndicator = overflow;
      magicNumber = Math.round(maxSlots / 2);
      calculateNoSlots();
      createSlots();
      fillSlots();
      placePrevNext();
      return paginationArray;
    }
  };
})();
