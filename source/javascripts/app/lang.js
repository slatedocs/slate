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
(function (global) {
  var languages = [];

  global.setupLanguages = setupLanguages;
  global.activateLanguage = activateLanguage;

  function activateLanguage(language) {
    $("#lang-selector a").removeClass('active');
    $("#lang-selector a[data-language-name='" + language + "']").addClass('active');
    for (var i=0; i < languages.length; i++) {
      $(".highlight." + languages[i]).hide();
    }
    $(".highlight." + language).show();
  }

  function setupLanguages(l) {
    var currentLanguage = l[0];
    var defaultLanguage = localStorage.getItem("language");

    languages = l;
    
    if ((location.search.substr(1) != "") && (jQuery.inArray(location.search.substr(1), languages)) != -1) {
      // the language is in the URL, so use that language!
      activateLanguage(location.search.substr(1));

      // set this language as the default for next time, if the URL has no language
      localStorage.setItem("language", location.search.substr(1));
    } else if ((defaultLanguage !== null) && (jQuery.inArray(defaultLanguage, languages) != -1)) {
      // the language was the last selected one saved in localstorage, so use that language!
      activateLanguage(defaultLanguage);
    } else {
      // no language selected, so use the default
      activateLanguage(languages[0]);
    }

    // if we click on a language tab, reload the page with that language in the URL
    $("#lang-selector a").bind("click", function() {
      window.location.replace("?" + $(this).data("language-name") + window.location.hash);
      return false;
    });

  }
})(window);
