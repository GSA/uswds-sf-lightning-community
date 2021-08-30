({
  generatePageList: function (component, pageNumber) {
    pageNumber = parseInt(pageNumber);
    var pageList = [];
    var totalPages = component.get("v.totalPages");
    console.log("Do Init Pagination");
    /* if(totalPages > 1){
          if(totalPages <= 10){
              var counter = 2;
              for(; counter < (totalPages); counter++){
                  pageList.push(counter);
              }
          } else{
              if(pageNumber < 5){
                  pageList.push(2, 3, 4, 5, 6);
              } else{
                  if(pageNumber>(totalPages-5)){
                      pageList.push(totalPages-5, totalPages-4, totalPages-3, totalPages-2, totalPages-1);
                  } else{
                      pageList.push(pageNumber-2, pageNumber-1, pageNumber, pageNumber+1, pageNumber+2);
                  }
              }
          }
      }*/

    component.set("v.totalPages", 50);
    for (var i = 1; i <= totalPages; i++) {
      pageList.push(i);
    }
    component.set("v.pageList", pageList);
    component.set("v.showPagination", true);
  }
});
