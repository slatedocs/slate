//= require ../lib/_jquery
//= require ../lib/_imagesloaded.min
;(function () {
  'use strict';

  var htmlPattern = /<[^>]*>/g;
  var loaded = false;
  var previousMeta = null;

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
    var pageHeight = 0;
    var windowHeight = 0;
    var originalTitle = document.title;

    var recacheHeights = function() {
      headerHeights = {};
      pageHeight = $(document).height();
      windowHeight = $(window).height();

      $toc.find(tocLinkSelector).each(function() {
        var href = $(this).attr('href');
        if (href) {
          var hrefSplit = href.split("/docs/");
          if (hrefSplit.length > 1) {
            var targetId = hrefSplit[1];
            headerHeights[targetId] = $('#' + targetId).offset().top - 100;
          }
        }
      });
    };

    var refreshToc = function() {
      var currentTop = $(document).scrollTop() + scrollOffset;

      if (currentTop + windowHeight >= pageHeight) {
        // at bottom of page, so just select last header by making currentTop very large
        // this fixes the problem where the last header won't ever show as active if its content
        // is shorter than the window height
        currentTop = pageHeight + 1000;
      }

      var best = null;
      for (var name in headerHeights) {
        if ((headerHeights[name] < currentTop && headerHeights[name] > headerHeights[best]) || best === null) {
          best = name;
        }
      }

      // Catch the initial load case
      if (!best && !loaded) {
        best = window.location.href.split("/docs/")[1];
      }

      var $best;
      if (best) {
        $best = $toc.find("[href='" + "/docs/" + best + "']").first();
      } else {
        $best = $toc.find(".toc-link").first();
      }

      if (!$best.hasClass("active") || !loaded) {
        loaded = true;
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
          var query = window.location.search;
          window.history.replaceState(null, "", $best.attr('href') === "/docs/overview" ? "/docs" + query : $best.attr('href') + query);

          // Update meta tag
          if (previousMeta) {
            previousMeta.remove();
          }
          var currentSection = $("#" + best).parent();
          var descriptionHolder = currentSection.find(".description");

          var newMeta = document.createElement('meta');
          newMeta.name = "description";
          newMeta.content = descriptionHolder ? descriptionHolder.text().replace(/(\r\n|\n|\r)/gm, "") : "";
          $("head").append(newMeta);

          previousMeta = newMeta;
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
      refreshToc();

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
          refreshToc();
        }, 0);
      });

      var w = $(window).width();
      $(window).scroll(debounce(refreshToc, 200));
      $(window).resize(debounce(
        function() {
          if ($(window).width() === w) return;
          w = $(window).width();
          recacheHeights();
          var currentAnchor = (document.URL.split('#').length > 1) ? document.URL.split('#')[1] : null;
          if (currentAnchor != null) {
            var currentElement = document.getElementById(currentAnchor);
            if (currentElement != null) {
              currentElement.scrollIntoView();
            }
          }
        },
        200));
    };

    makeToc();

    window.recacheHeights = recacheHeights;
    window.refreshToc = refreshToc;
  }

  window.loadToc = loadToc;
})();
