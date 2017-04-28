//= require ../lib/_lunr
//= require ../lib/_jquery
//= require ../lib/_jquery.highlight
;(function () {
  'use strict';

  var content, searchResults;
  var highlightOpts = { element: 'span', className: 'search-highlight' };

  var index = new lunr.Index();

  index.ref('id');
  index.field('title', { boost: 10 });
  index.field('body');
  index.pipeline.add(lunr.trimmer, lunr.stopWordFilter);

  $(populate);
  $(bind);

  function populate() {
    $('h1, h2').each(function() {
      var title = $(this);
      var body = title.nextUntil('h1, h2');
      index.add({
        id: title.prop('id'),
        title: title.text(),
        body: body.text()
      });
    });
  }

  var wait = (
      function(){
        var timeout_handle = 0;
        return function(executing_function, wait_time){
          clearTimeout (timeout_handle);
          timeout_handle = setTimeout(executing_function, wait_time);
        };
      })();

  function bind() {
    content = $('.content');
    searchResults = $('.search-results');

    var search_timeout = parseFloat($('#input-search').attr('search_timeout') || 0);
    $('#input-search').on('keyup',function(e) {
        wait(function(){
          search(e,$('#input-search')[0]);
        }, search_timeout );
    });
  }

  function search(event,search_input) {
    unhighlight();
    searchResults.addClass('visible');

    // ESC clears the field
    if (event.keyCode === 27) search_input.value = '';

    if (search_input.value) {
      var results = index.search(search_input.value).filter(function(r) {
        return r.score > 0.0001;
      });

      if (results.length) {
        searchResults.empty();
        $.each(results, function (index, result) {
          var elem = document.getElementById(result.ref);
          searchResults.append("<li><a href='#" + result.ref + "'>" + $(elem).text() + "</a></li>");
        });
        highlight.call(search_input);
      } else {
        searchResults.html('<li></li>');
        $('.search-results li').text('No Results Found for "' + search_input.value + '"');
      }
    } else {
      unhighlight();
      searchResults.removeClass('visible');
    }
  }

  function highlight() {
    if (this.value) content.highlight(this.value, highlightOpts);
  }

  function unhighlight() {
    content.unhighlight(highlightOpts);
  }
})();
