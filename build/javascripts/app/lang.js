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
!function(t){function e(t){$("#lang-selector a").removeClass("active"),$("#lang-selector a[data-language-name='"+t+"']").addClass("active");for(var e=0;e<i.length;e++)$(".highlight."+i[e]).hide();$(".highlight."+t).show()}function n(t){var n=(t[0],localStorage.getItem("language"));i=t,""!=location.search.substr(1)&&-1!=jQuery.inArray(location.search.substr(1),i)?(e(location.search.substr(1)),localStorage.setItem("language",location.search.substr(1))):e(null!==n&&-1!=jQuery.inArray(n,i)?n:i[0]),$("#lang-selector a").bind("click",function(){return window.location.replace("?"+$(this).data("language-name")+window.location.hash),!1})}var i=[];t.setupLanguages=n,t.activateLanguage=e,$(function(){$("#lang-selector a").on("click",function(){var t=$(this).data("language-name"),n=window.location.hash;return n&&(n=n.replace(/^#+/,"")),history&&history.pushState({},"","?"+t+"#"+n),e(t),!1}),window.onpopstate=function(){e(window.location.search.substr(1))}})}(window);