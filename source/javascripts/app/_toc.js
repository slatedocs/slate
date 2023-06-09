//= require ../lib/_jquery
//= require ../lib/_imagesloaded.min
;(function () {
  'use strict';

  var htmlPattern = /<[^>]*>/g;

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

  var closeToc = function() {
    $(".toc-wrapper").removeClass('open');
    $("#nav-button").removeClass('open');
  };

  function loadToc($toc, tocLinkSelector, tocListSelector, scrollOffset) {
    var headerHeights = {};
    var originalTitle = document.title;

    var recacheHeights = function() {
      headerHeights = {};
      pageHeight = $(document).height();
      windowHeight = $(window).height();

      $toc.find(tocLinkSelector).each(function() {
        var targetId = $(this).attr('href');
        if (targetId[0] === "#") {
          headerHeights[targetId] = $("#" + $.escapeSelector(targetId.substring(1))).offset().top;
        }
      });
    };

    var clicked = false;

    var tocClick = function() {
      clicked = true;
      tocUpdate(window.location.hash);
    }

    var refreshToc = function(preservePagePosition = false) {
      // the scroll that occurs after clicking a link
      // is already handled by tocClick
      if (clicked) {
        clicked = false;
        return;
      }

      var best = null;
      if (preservePagePosition) {
        best = window.location.hash;
      } else {
        var currentTop = $(document).scrollTop() + scrollOffset;

        for (var name in headerHeights) {
          if ((headerHeights[name] < currentTop && headerHeights[name] > headerHeights[best]) || best === null) {
            best = name;
          }
        }
      }

      tocUpdate(best);
    };

    var tocUpdate = function(best) {
      var $best = $toc.find("[href='" + best + "']").first();
      if (!$best.hasClass("active")) {
        // .active is applied to the ToC link we're currently on, and its parent <ul>s selected by tocListSelector
        // .active-expanded is applied to the ToC links that are parents of this one
        $toc.find(".active").removeClass("active");
        $toc.find(".active-parent").removeClass("active-parent");
        $best.addClass("active");
        $best.parents(tocListSelector).addClass("active").siblings(tocLinkSelector).addClass('active-parent');
        $best.siblings(tocListSelector).addClass("active");
        $toc.find(tocListSelector).filter(":not(.active)").slideUp(150);
        $toc.find(tocListSelector).filter(".active").slideDown(150);
        if (window.history.replaceState) {
          window.history.replaceState(null, "", best);
        }
        var thisTitle = $best.data("title");
        if (thisTitle !== undefined && thisTitle.length > 0) {
          document.title = thisTitle.replace(htmlPattern, "") + " – " + originalTitle;
        } else {
          document.title = originalTitle;
        }
      }
    };

    var makeToc = function() {
      recacheHeights();
      refreshToc(true);

      $("#nav-button").click(function() {
        $(".toc-wrapper").toggleClass('open');
        $("#nav-button").toggleClass('open');
        return false;
      });
      $(".page-wrapper").click(closeToc);
      $(".toc-link").click(closeToc);

      // reload immediately after scrolling on toc click
      $toc.find(tocLinkSelector).click(function() {
        setTimeout(function() {
          tocClick();
        }, 0);
      });

      $(window).scroll(debounce(refreshToc, 200));
      $(window).resize(debounce(recacheHeights, 200));
    };

    makeToc();

    window.recacheHeights = recacheHeights;
    window.refreshToc = refreshToc;
  }

  window.loadToc = loadToc;
})();
