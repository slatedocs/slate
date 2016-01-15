//= require ../lib/_jquery_ui
//= require ../lib/_jquery.tocify
//= require ../lib/_imagesloaded.min
(function (global) {
  'use strict';

  var closeToc = function() {
    $(".tocify-wrapper").removeClass('open');
    $("#nav-button").removeClass('open');
  };

  var makeToc = function() {
    global.toc = $("#toc").tocify({
      selectors: 'h1, h2',
      extendPage: false,
      theme: 'none',
      smoothScroll: false,
      showEffectSpeed: 0,
      hideEffectSpeed: 180,
      ignoreSelector: '.toc-ignore',
      highlightOffset: 60,
      scrollTo: -80,
      scrollHistory: true,
      hashGenerator: function (text, element) {
        return element.prop('id');
      }
    }).data('toc-tocify');

    $("#nav-button").click(function() {
      $(".tocify-wrapper").toggleClass('open');
      $("#nav-button").toggleClass('open');
      return false;
    });

    $(".page-wrapper").click(closeToc);
    $(".tocify-item").click(closeToc);
  };

  // Hack to make already open sections to start opened,
  // instead of displaying an ugly animation
  function animate() {
    setTimeout(function() {
      toc.setOption('showEffectSpeed', 180);
    }, 50);
  }

  $(function() {
    makeToc();
    animate();
    $('.content').imagesLoaded( function() {
      global.toc.calculateHeights();
    });

    $('h4').each(function(key, node) {
      console.log(node)
      $(node).html(
        '<span>' +
        $(node).text() +
        '</span>'
      )
    })

    $('h1, h2, h3, h5, h6').each(function(key, node) {
      console.log('1',node)
      if (key !== 0) {
        $(node).replaceWith(
          '<div class="heading">' +
          '<div class="left">' +
          node.outerHTML +
          '</div>' +
          '<div class="right">' +
          node.outerHTML +
          '</div>' +
          '<div class="clear"></div>' +
          '</div>'
        )
      }
    })
  });
})(window);
