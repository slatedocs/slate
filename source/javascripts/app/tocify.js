(function (global) {
  'use strict';

  var focusClass = 'tocify-focus';
  var headerClass = 'tocify-header';
  var subheaderClass = 'tocify-subheader';
  var defaultOptions = {
    selectors: 'h1, h2',
    highlightOffset: 40,
    highlightDefault: true,
    highlightOnScroll: true,
    history: true,
    scrollHistory: true,
    showAndHide: true,
    showAndHideOnScroll: true,
    showEffect: "slideDown",
    showEffectSpeed: "medium",
    hideEffect: "slideUp",
    hideEffectSpeed: "medium",
    smoothScroll: false,
    scrollTo: -1
  };

  function Tocify(element, options) {
    this.options = Object.assign({}, defaultOptions, options);
    this.headings = $(this.options.selectors);
    this.element = $(element);

    this.cachedAnchors = [];
    this.cachedHeights = {};

    this._setEventHandlers();

    var self = this;
    $(window).load(function() {
      self._setActiveElement(true);
    });
  }

  Tocify.prototype._setEventHandlers = function() {
    var self = this;
    var $window = $(window);
    $window.on('resize', function tocifyResize() {
      self.calculateHeights();
    });

    this.element.on("click", "li > a", function tocifyClick(event) {
      var hash = $(event.target).parent().attr("data-heading");
      if(self.options.history) {
        self._addToHistory(hash);
      }
      event.preventDefault();

      // Removes highlighting from all of the list item's
      this.element.find("." + focusClass).removeClass(focusClass);

      // Highlights the current list item that was clicked
      $(event.target).parent().addClass(focusClass);

      // If the showAndHide option is true
      if (this.options.showAndHide) {
        var elem = $('li[data-heading="' + hash + '"]');

        this._triggerShow(elem);
      }

      this._scrollTo(hash);
    }.bind(this));

    $window.on("scroll", function tocifyScroll() {
      var self = this;
      // The zero timeout ensures the following code is run after the scroll events
      setTimeout(function() {
        if (self.cachedAnchors.length == 0) {
          self.calculateHeights();
        }

        var scrollTop = $(window).scrollTop();

        var closestAnchorIdx = null;
        // Determines the index of the closest anchor
        self.cachedAnchors.forEach(function(idx) {
          if (self.cachedHeights[idx] - scrollTop <= 0) {
            closestAnchorIdx = idx;
          }
        });
        if (closestAnchorIdx === null) {
          closestAnchorIdx = self.cachedAnchors[0];
        }

        var elem = $('li[data-heading="' + closestAnchorIdx + '"]');

        if (self.options.highlightOnScroll && elem.length && !elem.hasClass(focusClass)) {
          // Removes highlighting from all of the list item's
          self.element.find("." + focusClass).removeClass(focusClass);

          // Highlights the corresponding list item
          elem.addClass(focusClass);
        }

        if (self.options.scrollHistory) {
          self._addToHistory(closestAnchorIdx);
        }

        if (self.options.showAndHideOnScroll && self.options.showAndHide) {
          self._triggerShow(elem);
        }
      }, 0);
    }.bind(this));
  };

  Tocify.prototype._addToHistory = function(hash) {
    if (hash !== undefined && window.location.hash !== "#" + hash) {
      if (history.replaceState) {
        history.replaceState({}, "", "#" + hash);
        // provide a fallback
      } else {
        var scrollV = document.body.scrollTop;
        var scrollH = document.body.scrollLeft;
        location.hash = "#" + hash;
        document.body.scrollTop = scrollV;
        document.body.scrollLeft = scrollH;
      }
    }
  };

  Tocify.prototype._scrollTo = function(hash) {
    var duration = this.options.smoothScroll || 0,
        scrollTo = this.options.scrollTo;

    // Animates the html and body element scrolltops
    $("html, body").animate({
      // Sets the jQuery `scrollTop` to the top offset of the HTML div tag that matches the current list item's `data-unique` tag
      "scrollTop": ($('#' + hash).offset().top - scrollTo) + "px"
    }, {
      // Sets the smoothScroll animation time duration to the smoothScrollSpeed option
      "duration": duration
    });
  };

  Tocify.prototype._triggerShow = function(elem) {
    var subheaderChild = elem.children('.' + subheaderClass);
    if (subheaderChild.length) {
      // Shows the next sub-header element
      this.show(subheaderChild);
    }
    else if (elem.parent().is('.' + subheaderClass)) {
      // Shows the parent sub-header element
      this.show(elem.parent());
    }
    else if (elem.is('.' + headerClass)) {
      this.hide($('.' + subheaderClass));
    }
  };

  Tocify.prototype.show = function(elem) {
    if (!elem.is(":visible")) {
      //Determines what jQuery effect to use
      switch (this.options.showEffect) {

        //Uses `no effect`
        case "none":

          elem.show();

          break;

        //Uses the jQuery `show` special effect
        case "show":

          elem.show(this.options.showEffectSpeed);

          break;

        //Uses the jQuery `slideDown` special effect
        case "slideDown":

          elem.slideDown(this.options.showEffectSpeed);

          break;

        //Uses the jQuery `fadeIn` special effect
        case "fadeIn":

          elem.fadeIn(this.options.showEffectSpeed);

          break;

        //If none of the above options were passed, then a `jQueryUI show effect` is expected
        default:

          elem.show();

          break;

      }
    }

    // If the current subheader parent element is a header
    if (elem.parent().is('.' + headerClass)) {
      // Hides all non-active sub-headers
      this.hide($('.' + subheaderClass).not(elem));
    }

    // If the current subheader parent element is not a header
    /*else {
      // Hides all non-active sub-headers
      this.hide($('.' + subheaderClass).not(elem.closest('.' + headerClass).find('.' + subheaderClass).not(elem.siblings())));
    }*/
  };

  Tocify.prototype.hide = function(elem) {
    //Determines what jQuery effect to use
    switch (this.options.hideEffect) {

      // Uses `no effect`
      case "none":

        elem.hide();

        break;

      // Uses the jQuery `hide` special effect
      case "hide":

        elem.hide(this.options.hideEffectSpeed);

        break;

      // Uses the jQuery `slideUp` special effect
      case "slideUp":

        elem.slideUp(this.options.hideEffectSpeed);

        break;

      // Uses the jQuery `fadeOut` special effect
      case "fadeOut":

        elem.fadeOut(this.options.hideEffectSpeed);

        break;

      // If none of the above options were passed, then a `jqueryUI hide effect` is expected
      default:

        elem.hide();

        break;

    }
  };

  Tocify.prototype._setActiveElement = function(pageload) {
    var hash = window.location.hash.substring(1);

    $('.' + focusClass).removeClass(focusClass);
    if (hash.length) {
      var menuEntry = $('li[data-heading=' + hash + ']');
      menuEntry.addClass(focusClass);
    } else if (pageload && this.options.highlightDefault) {
      // Highlights the first TOC item if no other items are highlighted
      this.element.find('li').first().addClass(focusClass);
    }
  };

  Tocify.prototype.calculateHeights = function() {
    this.cachedHeights = {};
    this.cachedAnchors.length = 0;

    for (var i = 0; i < this.headings.length; i++) {
      var heading = this.headings[i];
      var idx = heading.id;
      var distance = $(heading).offset().top;

      this.cachedHeights[idx] = distance;
      this.cachedAnchors.push(idx);
    }
  };

  global.Tocify = Tocify;
})(window);
