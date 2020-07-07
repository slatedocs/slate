//= require ./lib/_energize
//= require ./app/_toc
//= require ./app/_lang
//= require ./_remotelock

$(function() {
  loadToc($('#toc'), '.toc-link', '.toc-list-h2', 10);
  setupLanguages($('body').data('languages'));
  $('.content').imagesLoaded( function() {
    window.recacheHeights();
    window.refreshToc();
  });

  loadRemoteLockConfig();
});

window.onpopstate = function() {
  activateLanguage(getLanguageFromQueryString());
};
