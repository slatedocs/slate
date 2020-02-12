//= require ./lib/_energize
//= require ./app/_toc
//= require ./app/_lang

$(function() {
  var pathname = window.location.pathname;
  if (pathname.split('/').length > 2) {
    window.location.hash = pathname.split('/')[3];
  }
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
        $(this).nextUntil('.c'+thisLevel, ':not(.c' + arr.join(',.') + ',.common-items-toggle)').addClass("hidden-row").removeClass("expanded");
      } else {
        $(this).addClass("expanded");
        $(this).nextUntil('.c'+thisLevel, '.c' + (thisLevel + 1)).removeClass("hidden-row");
      }

      window.recacheHeights();
      window.refreshToc();

      return;
    }

    // Check if this row is the common expander
    if ($(this).hasClass("common-items-toggle")) {
      if ($(this).hasClass("expanded")) {
        $(this).removeClass("expanded");
        $(this).prevUntil(':not(.common-item)').addClass("hidden-row");
      } else {
        $(this).addClass("expanded");
        $(this).prevUntil(':not(.common-item)').removeClass("hidden-row");
      }
    }
  });

  $('a').click(function(event) {
    var ref = $(this).attr('href');
    if (ref && ref.startsWith("#")) {
      window.location.hash = "";
      $([document.documentElement, document.body]).scrollTop($(ref).offset().top)
    }
    return false;
  });
});

window.onpopstate = function() {
  activateLanguage(getLanguageFromQueryString());
};
