/**
 * Created by danbright on 6/17/15.
 */

$(document).ready(function () {
    $('.swift').parent()
        .append('<span class="lang-selector select_language"><span class="current_language">Swift |</span> <a data-language-name="objective_c" class="other_language">Objective-C</a>')

    $('.objective_c').parent()
        .append('<span class="lang-selector select_language"><a data-language-name="swift" class="other_language">Swift</a> <span class="current_language">| Objective-C</span>')


});