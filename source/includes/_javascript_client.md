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

## Styling the autocomplete client

Generated HTML markup for suggestions is displayed bellow. You may style the suggestions in any way you'd like.

<code>
&lt;div class="autocomplete-suggestions"><br/>
  &lt;div class="autocomplete-suggestion autocomplete-selected">...&lt;/div><br/>
  &lt;div class="autocomplete-suggestion">...&lt;/div><br/>
  &lt;div class="autocomplete-suggestion">...&lt;/div><br/>
&lt;/div><br/>
</code>

Some example styling:

<code>
.autocomplete-suggestions { border: 1px solid #999; background: #FFF; overflow: auto; }<br/>
.autocomplete-suggestion { padding: 2px 5px; white-space: nowrap; overflow: hidden; }<br/>
.autocomplete-selected { background: #F0F0F0; }<br/>
.autocomplete-suggestions strong { font-weight: normal; color: #3399FF; }<br/>
</code>

Our client is based on the excellent Devbridge autocomplete client, the full documentation for which can be found <a href="https://github.com/devbridge/jQuery-Autocomplete">here</a>.


