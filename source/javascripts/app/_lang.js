//= require ../lib/_jquery

/*
Copyright 2008-2013 Concur Technologies, Inc.

Licensed under the Apache License, Version 2.0 (the "License"); you may
not use this file except in compliance with the License. You may obtain
a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
License for the specific language governing permissions and limitations
under the License.
*/
;(function () {
  'use strict';

  var languages = [];

  window.setupLanguages = setupLanguages;
  window.activateLanguage = activateLanguage;
  window.getLanguageFromQueryString = getLanguageFromQueryString;

  function activateLanguage(language) {
    if (!language) return;
    if (language === "") return;

    $(".lang-selector a").removeClass('active');
    $(".lang-selector a[data-language-name='" + language + "']").addClass('active');
    for (var i=0; i < languages.length; i++) {
      $(".highlight.tab-" + languages[i]).hide();
      $(".lang-specific." + languages[i]).hide();
    }
    $(".highlight.tab-" + language).show();
    $(".lang-specific." + language).show();

    window.recacheHeights();

    // scroll to the new location of the position
    if ($(window.location.hash).get(0)) {
      $(window.location.hash).get(0).scrollIntoView(true);
    }
  }

  // gets the language set in the query string
  function getLanguageFromQueryString() {
    if (location.search.length >= 1) {
      var language = (new URLSearchParams(location.search)).get('language');
      if (language) {
        return language;
      } else if (jQuery.inArray(location.search.substr(1), languages) != -1) {
        return location.search.substr(1);
      }
    }

    return false;
  }

  // returns a new query string with the new language in it
  function generateNewQueryString(language) {
    const searchParams = new URLSearchParams(location.search);
    if (searchParams.has('language')) {
      searchParams.set('language', language);
      return searchParams.toString();
    }
    return language;
  }

  // if a button is clicked, add the state to the history
  function pushURL(language) {
    if (!history) { return; }
    var hash = window.location.hash;
    if (hash) {
      hash = hash.replace(/^#+/, '');
    }
    history.pushState({}, '', '?' + generateNewQueryString(language) + '#' + hash);

    // save language as next default
    if (localStorage) {
      localStorage.setItem("language", language);
    }
  }

  function setupLanguages(l) {
    var defaultLanguage = null;
    if (localStorage) {
      defaultLanguage = localStorage.getItem("language");
    }

    languages = l;

    var presetLanguage = getLanguageFromQueryString();
    if (presetLanguage  && (jQuery.inArray(presetLanguage, languages) != -1)) {
      // the language is in the URL, so use that language!
      activateLanguage(presetLanguage);

      if (localStorage) {
        localStorage.setItem("language", presetLanguage);
      }
    } else if ((defaultLanguage !== null) && (jQuery.inArray(defaultLanguage, languages) != -1)) {
      // the language was the last selected one saved in localstorage, so use that language!
      activateLanguage(defaultLanguage);
    } else {
      // no language selected, so use the default
      activateLanguage(languages[0]);
    }
  }

  // if we click on a language tab, activate that language
  $(function() {
    $(".lang-selector a").on("click", function() {
      var language = $(this).data("language-name");
      pushURL(language);
      activateLanguage(language);
      return false;
    });
  });
})();
