(function (global) {

  var toc;

  global.toc = toc;

  $(toc);
  $(animate);

  function toc () {
    toc = $("#toc").tocify({
      selectors: 'h1, h2',
      extendPage: false,
      theme: 'none',
      smoothScroll: false,
      showEffectSpeed: 0,
      hideEffectSpeed: 180,
      ignoreSelector: '.toc-ignore',
      highlightOffset: 60,
      scrollTo: -2,
      scrollHistory: true,
      hashGenerator: function (text, element) {
        return element.prop('id');
      }
    }).data('toc-tocify');
  }

  // Hack to make already open sections to start opened,
  // instead of displaying an ugly animation
  function animate () {
    setTimeout(function() {
      toc.setOption('showEffectSpeed', 180);
    }, 50);
  }

})(window);

