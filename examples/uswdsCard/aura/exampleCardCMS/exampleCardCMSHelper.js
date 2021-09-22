({
  // prepCardData maps CMS content fields to fields consumeable by uswdsCardList
  prepCardData: function (data) {
    var dataArray = [];
    for (var i = 0; i < data.length; i++) {
      var obj = {
        cardType: "Card with Media",
        cardsPerRow: "3",
        header: data[i].contentNodes.title.value,
        // body content of CMS nodes comes with escaped HTML characters (&lt; &gt; etc), this strips those out. Alternatively, using Excerpt provides plaintext
        body: data[i].contentNodes.body.value.replace(
          /\&lt\;(\/.*?|.*?)\&gt\;/gi,
          ""
        ),
        buttonLinkUrl:
          data[i].type +
          "/" +
          data[i].contentUrlName +
          "-" +
          data[i].contentKey,
        buttonLinkText: "Read More",
        mediaUrl: data[i].contentNodes.bannerImage.unauthenticatedUrl,
        mediaAltText: data[i].contentNodes.bannerImage.altText
      };
      dataArray.push(obj);
    }
    return dataArray;
  }
});
