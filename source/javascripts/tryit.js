$(document).ready(function() {
  $('span.tryit').each(function(n, el) {
    var id = el.id.replace('-tryit', '');
    var method = $('#' + id).text();
    var params = $('#' + id).nextUntil('h3').next('pre').children('code');

    var url = 'https://api.shiftboard.com/api-documentation/sandbox.html?method=' + encodeURIComponent(method);

    if ($(params[0]).text()) {
      url += '&params=' + encodeURIComponent($(params[0]).text());
    }

    $('#' + el.id).html('<p><b><a href="' + url + '" target="_blank">Try it!</a></b></p>');
  });
});
