({
  buildData: function (component) {
    var pageNumber = component.get("v.currentPageNumber");
    var pageSize = component.get("v.pageSize");
    var allData = component.get("v.allData");
    var x = (pageNumber - 1) * pageSize;
    var data = [];
    for (; x < pageNumber * pageSize; x++) {
      if (allData[x]) {
        data.push(allData[x]);
      }
    }
    component.set("v.pageData", data);
  },
  generateData: function () {
    // from https://opb.georgia.gov/census-data/population-estimates
    return [
      {
        countyName: "Appling County",
        2019: "18,386"
      },
      {
        countyName: "Atkinson County",
        2019: "8,165"
      },
      {
        countyName: "Bacon County",
        2019: "11,164"
      },
      {
        countyName: "Baker County",
        2019: "3,038"
      },
      {
        countyName: "Baldwin County",
        2019: "44,890"
      },
      {
        countyName: "Banks County",
        2019: "19,234"
      },
      {
        countyName: "Barrow County",
        2019: "83,240"
      },
      {
        countyName: "Bartow County",
        2019: "107,738"
      },
      {
        countyName: "Ben Hill County",
        2019: "16,700"
      },
      {
        countyName: "Berrien County",
        2019: "19,397"
      },
      {
        countyName: "Bibb County",
        2019: "153,159"
      },
      {
        countyName: "Bleckley County",
        2019: "12,873"
      },
      {
        countyName: "Brantley County",
        2019: "19,109"
      },
      {
        countyName: "Brooks County",
        2019: "15,457"
      },
      {
        countyName: "Bryan County",
        2019: "39,627"
      },
      {
        countyName: "Bulloch County",
        2019: "79,608"
      },
      {
        countyName: "Burke County",
        2019: "22,383"
      },
      {
        countyName: "Butts County",
        2019: "24,936"
      },
      {
        countyName: "Calhoun County",
        2019: "6,189"
      },
      {
        countyName: "Camden County",
        2019: "54,666"
      },
      {
        countyName: "Candler County",
        2019: "10,803"
      },
      {
        countyName: "Carroll County",
        2019: "119,992"
      },
      {
        countyName: "Catoosa County",
        2019: "67,580"
      },
      {
        countyName: "Charlton County",
        2019: "13,392"
      },
      {
        countyName: "Chatham County",
        2019: "289,430"
      },
      {
        countyName: "Chattahoochee County",
        2019: "10,907"
      },
      {
        countyName: "Chattooga County",
        2019: "24,789"
      },
      {
        countyName: "Cherokee County",
        2019: "258,773"
      },
      {
        countyName: "Clarke County",
        2019: "128,331"
      },
      {
        countyName: "Clay County",
        2019: "2,834"
      },
      {
        countyName: "Clayton County",
        2019: "292,256"
      },
      {
        countyName: "Clinch County",
        2019: "6,618"
      },
      {
        countyName: "Cobb County",
        2019: "760,141"
      },
      {
        countyName: "Coffee County",
        2019: "43,273"
      },
      {
        countyName: "Colquitt County",
        2019: "45,600"
      },
      {
        countyName: "Columbia County",
        2019: "156,714"
      },
      {
        countyName: "Cook County",
        2019: "17,270"
      },
      {
        countyName: "Coweta County",
        2019: "148,509"
      },
      {
        countyName: "Crawford County",
        2019: "12,404"
      },
      {
        countyName: "Crisp County",
        2019: "22,372"
      },
      {
        countyName: "Dade County",
        2019: "16,116"
      },
      {
        countyName: "Dawson County",
        2019: "26,108"
      },
      {
        countyName: "Decatur County",
        2019: "26,404"
      },
      {
        countyName: "DeKalb County",
        2019: "759,297"
      },
      {
        countyName: "Dodge County",
        2019: "20,605"
      },
      {
        countyName: "Dooly County",
        2019: "13,390"
      },
      {
        countyName: "Dougherty County",
        2019: "87,956"
      },
      {
        countyName: "Douglas County",
        2019: "146,343"
      },
      {
        countyName: "Early County",
        2019: "10,190"
      },
      {
        countyName: "Echols County",
        2019: "4,006"
      },
      {
        countyName: "Effingham County",
        2019: "64,296"
      },
      {
        countyName: "Elbert County",
        2019: "19,194"
      },
      {
        countyName: "Emanuel County",
        2019: "22,646"
      },
      {
        countyName: "Evans County",
        2019: "10,654"
      },
      {
        countyName: "Fannin County",
        2019: "26,188"
      },
      {
        countyName: "Fayette County",
        2019: "114,421"
      },
      {
        countyName: "Floyd County",
        2019: "98,498"
      },
      {
        countyName: "Forsyth County",
        2019: "244,252"
      },
      {
        countyName: "Franklin County",
        2019: "23,349"
      },
      {
        countyName: "Fulton County",
        2019: "1,063,937"
      },
      {
        countyName: "Gilmer County",
        2019: "31,369"
      },
      {
        countyName: "Glascock County",
        2019: "2,971"
      },
      {
        countyName: "Glynn County",
        2019: "85,292"
      },
      {
        countyName: "Gordon County",
        2019: "57,963"
      },
      {
        countyName: "Grady County",
        2019: "24,633"
      },
      {
        countyName: "Greene County",
        2019: "18,324"
      },
      {
        countyName: "Gwinnett County",
        2019: "936,250"
      },
      {
        countyName: "Habersham County",
        2019: "45,328"
      },
      {
        countyName: "Hall County",
        2019: "204,441"
      },
      {
        countyName: "Hancock County",
        2019: "8,457"
      },
      {
        countyName: "Haralson County",
        2019: "29,792"
      },
      {
        countyName: "Harris County",
        2019: "35,236"
      },
      {
        countyName: "Hart County",
        2019: "26,205"
      },
      {
        countyName: "Heard County",
        2019: "11,923"
      },
      {
        countyName: "Henry County",
        2019: "234,561"
      },
      {
        countyName: "Houston County",
        2019: "157,863"
      },
      {
        countyName: "Irwin County",
        2019: "9,416"
      },
      {
        countyName: "Jackson County",
        2019: "72,977"
      },
      {
        countyName: "Jasper County",
        2019: "14,219"
      },
      {
        countyName: "Jeff Davis County",
        2019: "15,115"
      },
      {
        countyName: "Jefferson County",
        2019: "15,362"
      },
      {
        countyName: "Jenkins County",
        2019: "8,676"
      },
      {
        countyName: "Johnson County",
        2019: "9,643"
      },
      {
        countyName: "Jones County",
        2019: "28,735"
      },
      {
        countyName: "Lamar County",
        2019: "19,077"
      },
      {
        countyName: "Lanier County",
        2019: "10,423"
      },
      {
        countyName: "Laurens County",
        2019: "47,546"
      },
      {
        countyName: "Lee County",
        2019: "29,992"
      },
      {
        countyName: "Liberty County",
        2019: "61,435"
      },
      {
        countyName: "Lincoln County",
        2019: "7,921"
      },
      {
        countyName: "Long County",
        2019: "19,559"
      },
      {
        countyName: "Lowndes County",
        2019: "117,406"
      },
      {
        countyName: "Lumpkin County",
        2019: "33,610"
      },
      {
        countyName: "McDuffie County",
        2019: "21,312"
      },
      {
        countyName: "McIntosh County",
        2019: "14,378"
      },
      {
        countyName: "Macon County",
        2019: "12,947"
      },
      {
        countyName: "Madison County",
        2019: "29,880"
      },
      {
        countyName: "Marion County",
        2019: "8,359"
      },
      {
        countyName: "Meriwether County",
        2019: "21,167"
      },
      {
        countyName: "Miller County",
        2019: "5,718"
      },
      {
        countyName: "Mitchell County",
        2019: "21,863"
      },
      {
        countyName: "Monroe County",
        2019: "27,578"
      },
      {
        countyName: "Montgomery County",
        2019: "9,172"
      },
      {
        countyName: "Morgan County",
        2019: "19,276"
      },
      {
        countyName: "Murray County",
        2019: "40,096"
      },
      {
        countyName: "Muscogee County",
        2019: "195,769"
      },
      {
        countyName: "Newton County",
        2019: "111,744"
      },
      {
        countyName: "Oconee County",
        2019: "40,280"
      },
      {
        countyName: "Oglethorpe County",
        2019: "15,259"
      },
      {
        countyName: "Paulding County",
        2019: "168,667"
      },
      {
        countyName: "Peach County",
        2019: "27,546"
      },
      {
        countyName: "Pickens County",
        2019: "32,591"
      },
      {
        countyName: "Pierce County",
        2019: "19,465"
      },
      {
        countyName: "Pike County",
        2019: "18,962"
      },
      {
        countyName: "Polk County",
        2019: "42,613"
      },
      {
        countyName: "Pulaski County",
        2019: "11,137"
      },
      {
        countyName: "Putnam County",
        2019: "22,119"
      },
      {
        countyName: "Quitman County",
        2019: "2,299"
      },
      {
        countyName: "Rabun County",
        2019: "17,137"
      },
      {
        countyName: "Randolph County",
        2019: "6,778"
      },
      {
        countyName: "Richmond County",
        2019: "202,518"
      },
      {
        countyName: "Rockdale County",
        2019: "90,896"
      },
      {
        countyName: "Schley County",
        2019: "5,257"
      },
      {
        countyName: "Screven County",
        2019: "13,966"
      },
      {
        countyName: "Seminole County",
        2019: "8,090"
      },
      {
        countyName: "Spalding County",
        2019: "66,703"
      },
      {
        countyName: "Stephens County",
        2019: "25,925"
      },
      {
        countyName: "Stewart County",
        2019: "6,621"
      },
      {
        countyName: "Sumter County",
        2019: "29,524"
      },
      {
        countyName: "Talbot County",
        2019: "6,195"
      },
      {
        countyName: "Taliaferro County",
        2019: "1,537"
      },
      {
        countyName: "Tattnall County",
        2019: "25,286"
      },
      {
        countyName: "Taylor County",
        2019: "8,020"
      },
      {
        countyName: "Telfair County",
        2019: "15,860"
      },
      {
        countyName: "Terrell County",
        2019: "8,531"
      },
      {
        countyName: "Thomas County",
        2019: "44,451"
      },
      {
        countyName: "Tift County",
        2019: "40,644"
      },
      {
        countyName: "Toombs County",
        2019: "26,830"
      },
      {
        countyName: "Towns County",
        2019: "12,037"
      },
      {
        countyName: "Treutlen County",
        2019: "6,901"
      },
      {
        countyName: "Troup County",
        2019: "69,922"
      },
      {
        countyName: "Turner County",
        2019: "7,985"
      },
      {
        countyName: "Twiggs County",
        2019: "8,120"
      },
      {
        countyName: "Union County",
        2019: "24,511"
      },
      {
        countyName: "Upson County",
        2019: "26,320"
      },
      {
        countyName: "Walker County",
        2019: "69,761"
      },
      {
        countyName: "Walton County",
        2019: "94,593"
      },
      {
        countyName: "Ware County",
        2019: "35,734"
      },
      {
        countyName: "Warren County",
        2019: "5,254"
      },
      {
        countyName: "Washington County",
        2019: "20,374"
      },
      {
        countyName: "Wayne County",
        2019: "29,927"
      },
      {
        countyName: "Webster County",
        2019: "2,607"
      },
      {
        countyName: "Wheeler County",
        2019: "7,855"
      },
      {
        countyName: "White County",
        2019: "30,798"
      },
      {
        countyName: "Whitfield County",
        2019: "104,628"
      },
      {
        countyName: "Wilcox County",
        2019: "8,635"
      },
      {
        countyName: "Wilkes County",
        2019: "9,777"
      },
      {
        countyName: "Wilkinson County",
        2019: "8,954"
      },
      {
        countyName: "Worth County",
        2019: "20,247"
      }
    ];
  }
});
