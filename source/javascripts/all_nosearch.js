//= require ./lib/_energize
//= require ./app/_toc
//= require ./app/_lang

$(function() {
  var pathname = window.location.pathname;
  if (pathname.split('/').length > 2) {
    window.location.hash = pathname.split('/')[2];
  }
  loadToc($('#toc'), '.toc-link', '.toc-list-h2', 10);
  setupLanguages($('body').data('languages'));
  $('.content').imagesLoaded( function() {
    window.recacheHeights();
    window.refreshToc();
  });


  $('.positiveFeedback-DevSatisfaction').on('click', function() {
    $(this).parent().html('Thanks!')
  });

  $('.negativeFeedback-DevSatisfaction').on('click', function() {
    $(this).parent().html('We are sorry to hear that! Feel free to <a href="https://form.asana.com?hash=c439d6062b165442b3d40383ab2f95cac08176b5b8ced11cf47817743a704728&id=1137609721785458" target="_blank">leave feedback</a> or post a question on our <a href="https://forum.asana.com/c/developersAPI" target="_blank">forum</a>.')
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

  $(document).on("click", "a", function(event) {
    var ref = $(this).attr('href');
    if (ref && ref.startsWith("/docs/")) {
      event.preventDefault();
      var query = window.location.search;
      window.history.pushState(null, "", ref + query);

      ref = "#" + ref.split('/')[2];

      $([document.documentElement, document.body]).scrollTop($(ref).offset().top);

      return false;
    }
  });
});

window.onpopstate = function() {
  activateLanguage(getLanguageFromQueryString());
};
