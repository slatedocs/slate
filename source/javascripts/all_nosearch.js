//= require ./lib/_energize
//= require ./app/_toc
//= require ./app/_lang

$(function() {
  loadToc($('#toc'), '.toc-link', '.toc-list-h2', 10);
  setupLanguages($('body').data('languages'));
  $('.content').imagesLoaded( function() {
    window.recacheHeights();
    window.refreshToc();
  });

  $('.asana-table').on('click', 'tr',function (e) {
    var thisLevel = parseInt(this.className.substring(1));

    // Check if this row has children
    if ($(this).hasClass("has-children")) {
      // Check if this row is already expanded
      if ($(this).hasClass("expanded")) {
        $(this).removeClass("expanded");
        var arr = Array.apply(null, {length: thisLevel + 1}).map(Number.call, Number);
        console.log(arr);
        $(this).nextUntil('.c'+thisLevel, ':not(.c' + arr.join(',.') + ')').addClass("hidden-row").removeClass("expanded");
      } else {
        $(this).addClass("expanded");
        $(this).nextUntil('.c'+thisLevel, '.c' + (thisLevel + 1)).removeClass("hidden-row");
      }
    }

    window.recacheHeights();
    window.refreshToc();
  });
});

window.onpopstate = function() {
  activateLanguage(getLanguageFromQueryString());
};
