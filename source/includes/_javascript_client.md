# Javascript Client

The Constructor.io javascript client adds autocomplete to your site.  You can install it immediately and it will default to "listening mode" where it will start to learn from your users' behavior.  Then, you can upload a dataset via our website or API and start seeing autocomplete suggestions.

## Simple jQuery Installation

To install with jQuery, use this code:

<code>
&lt;script type="text/javascript"><br/>
$.getScript("//cnstrc.com/js/ac.js", function() {<br/>
&nbsp;&nbsp;$('#query').constructorAutocomplete({ key: '[your autocomplete key]' });<br/>
})<br/>
&lt;/script>
</code>

Here, `#query` is the DOM id of your search box, and your autocomplete key can be found on [your dashboard](/dashboard).

## Installation with requirejs

If you're using requirejs, you can install our client with this code:

<code>
&lt;script type="text/javascript"><br/>
require.config({paths: {constructorAutocomplete: '//cnstrc.com/js/ac'} });<br/>
require(['jquery', 'constructorAutocomplete'], function($) {<br/>
&nbsp;&nbsp;$('#query').constructorAutocomplete({ key: '[your autocomplete key]' });<br/>
});<br/>
&lt;/script>
</code>

Here, `#query` is the DOM id of your search box, and your autocomplete key can be found on [your dashboard](/dashboard).
