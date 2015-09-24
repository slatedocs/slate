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
!function(t){function e(e){if(e&&""!==e){$(".lang-selector a").removeClass("active"),$(".lang-selector a[data-language-name='"+e+"']").addClass("active");for(var i=0;i<o.length;i++)$(".highlight."+o[i]).parent().hide();$(".highlight."+e).parent().show(),t.toc.calculateHeights(),$(window.location.hash).get(0).scrollIntoView(!0)}}function i(t){if(history){var e=window.location.hash;e&&(e=e.replace(/^#+/,"")),history.pushState({},"","?"+t+"#"+e),localStorage.setItem("language",t)}}function n(t){var i=(t[0],localStorage.getItem("language"));o=t,""!==location.search.substr(1)&&-1!=jQuery.inArray(location.search.substr(1),o)?(e(location.search.substr(1)),localStorage.setItem("language",location.search.substr(1))):e(null!==i&&-1!=jQuery.inArray(i,o)?i:o[0])}var o=[];t.setupLanguages=n,t.activateLanguage=e,$(function(){$(".lang-selector a").on("click",function(){var t=$(this).data("language-name");return i(t),e(t),!1}),window.onpopstate=function(){e(window.location.search.substr(1))}})}(window);