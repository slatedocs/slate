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
        if (!language) return;
        if (language === "") return;

        for (var i = 0; i < languages.length; i++) {
            $(".highlight." + languages[i]).parent().hide();
        }
        $(".highlight." + language).parent().show();

        global.toc.calculateHeights();
    }

    // if a button is clicked, add the state to the history
    function pushURL(language) {
        if (!history) {
            return;
        }
        var hash = window.location.hash;
        if (hash) {
            hash = hash.replace(/^#+/, '');
        }
        history.pushState({}, '', '?' + language + '#' + hash);

        // save language as next default
        localStorage.setItem("language", language);
    }

    function setupLanguages(l) {
        var currentLanguage = l[0];
        var defaultLanguage = localStorage.getItem("language");

        languages = l;

        if ((location.search.substr(1) !== "") && (jQuery.inArray(location.search.substr(1), languages)) != -1) {
            // the language is in the URL, so use that language!
            activateLanguage(location.search.substr(1));

            localStorage.setItem("language", location.search.substr(1));
        } else if ((defaultLanguage !== null) && (jQuery.inArray(defaultLanguage, languages) != -1)) {
            // the language was the last selected one saved in localstorage, so use that language!
            activateLanguage(defaultLanguage);
        } else {
            // no language selected, so use the default
            activateLanguage(languages[0]);
        }
    }

    // if we click on a language tab, activate that language
    $(function () {
        $(".lang-selector a").on("click", function () {

            //Commented out code is trying to get the page not to move up and down when changing link.

            var element;
            var preElement = $(this).parent().parent();
            if (preElement.prev().prop('tagName') != 'PRE') {
                element = preElement.prev();
            } else {
                element = preElement.prev().prev();
            }

            console.log($(element));
            var topOfLinkBeforeSelect = $(element).offset().top;

            var language = $(this).data("language-name");

            activateLanguage(language);

            var topOfLinkAfterSelect = $(element).offset().top;
            var amountOfPageMovement = topOfLinkAfterSelect - topOfLinkBeforeSelect;
            window.scrollTo(window.scrollX, window.scrollY + amountOfPageMovement);

            return false;
        });
        window.onpopstate = function (event) {
            activateLanguage(window.location.search.substr(1));
        };
    });
})(window);
