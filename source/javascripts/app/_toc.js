//= require ../lib/_jquery
//= require ../lib/_imagesloaded.min
;(function () {
  'use strict';

  var debounce = function(func, waitTime) {
    var timeout = false;
    return function() {
      if (timeout === false) {
        setTimeout(function() {
          func();
          timeout = false;
        }, waitTime);
        timeout = true;
      }
    };
  };

  function loadToc($toc, tocLinkSelector, scrollOffset) {
    var headerHeights = {};

    var recacheHeights = function() {
      headerHeights = {};

      $toc.find(tocLinkSelector).each(function() {
        var targetId = $(this).attr('href');
        if (targetId[0] === "#") {
          headerHeights[targetId] = $(targetId).offset().top;
        }
      });
    };

    var refreshToc = function() {
      var currentTop = $(document).scrollTop() + scrollOffset;

      var best = null;
      for (var name in headerHeights) {
        if ((headerHeights[name] < currentTop && headerHeights[name] > headerHeights[best]) || best === null) {
          best = name;
        }
      }

      var $best = $toc.find("[href='" + best + "']").first();
      if (!$best.hasClass("active")) {
        $toc.find(".active").removeClass("active");
        $best.addClass("active");
        if (window.history.pushState) {
          window.history.pushState(null, "", best);
        }
      }
    };

    var makeToc = function() {
      recacheHeights();
      refreshToc();

      // reload immediately after scrolling on toc click
      $toc.find(tocLinkSelector).click(function() {
        setTimeout(function() {
          refreshToc();
        }, 0);
      });

      $(window).scroll(debounce(refreshToc, 200));
      $(window).resize(debounce(recacheHeights, 200));
    };

    makeToc();

    window.recacheHeights = recacheHeights;
  }

  $(function() {
    loadToc($('#toc'), '.toc-link', 10);
    setupLanguages($('body').data('languages'));
    $('.content').imagesLoaded( function() {
      window.recacheHeights();
    });
  })
})();
