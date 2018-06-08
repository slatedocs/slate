//= require ./all_nosearch
//= require ./app/_search

$(document).ready(function() {
    /**
     * Functionality to toggle nested model definitions
     */
    var expand_btn = $('a[href="#expand"]');
    var expand_inner_btn = $('a[href="#expand-inner"]');
    var empty_btn_parent = $('a[href="#empty"]').parent().parent()
        .addClass('empty');
    var empty_inner_btn_parent = $('a[href="#empty-inner"]').parent().parent()
        .addClass('empty');
    
    expand_btn.click(toggleInner);
    expand_inner_btn.click(toggleInner);

    expand_btn.parent().parent()
        .nextUntil(empty_btn_parent)
        .addClass('nested')
        .hide();

    expand_inner_btn.parent().parent()
        .nextUntil(empty_inner_btn_parent)
        .addClass('inner');

    function toggleInner(e) {
        e.preventDefault();

        var parent = $(this).parent().parent();

        if ($(this).attr('href') === '#expand') {
            if (parent.next().is(':hidden')) {
                parent.nextUntil(empty_btn_parent).not('.nested.inner')
                    .show();
            } else {
                parent.nextUntil(empty_btn_parent)
                    .hide();
            }

        } else {
            parent.nextUntil(empty_inner_btn_parent)
                .toggle();
        }
    }
});
