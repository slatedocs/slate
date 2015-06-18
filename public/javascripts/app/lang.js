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
!function(e){function t(t){if(t&&""!==t){for(var n=0;n<i.length;n++)$(".highlight."+i[n]).parent().hide();$(".highlight."+t).parent().show(),e.toc.calculateHeights()}}function n(e){var n=(e[0],localStorage.getItem("language"));i=e,""!==location.search.substr(1)&&-1!=jQuery.inArray(location.search.substr(1),i)?(t(location.search.substr(1)),localStorage.setItem("language",location.search.substr(1))):t(null!==n&&-1!=jQuery.inArray(n,i)?n:i[0])}var i=[];e.setupLanguages=n,e.activateLanguage=t,$(function(){$(".lang-selector a").on("click",function(){var e,n=$(this).parent().parent();e="PRE"!=n.prev().prop("tagName")?n.prev():n.prev().prev(),console.log($(e));var i=$(e).offset().top,o=$(this).data("language-name");t(o);var s=$(e).offset().top,r=s-i;return window.scrollTo(window.scrollX,window.scrollY+r),!1}),window.onpopstate=function(){t(window.location.search.substr(1))}})}(window);