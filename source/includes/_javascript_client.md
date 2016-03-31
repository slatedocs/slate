# Javascript Client

The Constructor.io javascript client adds autocomplete to your site with two lines of code.

You can install it immediately and it will default to "listening mode" where it will start to learn from your users' behavior.

After you upload a dataset via our website or API, Constructor.io will start providing your users lightning-fast suggestions!

## Install using jQuery

To install with jQuery, use this code:

<code>
&lt;script type="text/javascript"><br/>
&nbsp;&nbsp;&nbsp;&nbsp;$.getScript("//cnstrc.com/js/ac.js", function() {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#query').constructorAutocomplete({ key: '[your autocomplete key]' });<br/>
&nbsp;&nbsp;&nbsp;&nbsp;})<br/>
&lt;/script>
</code>

Here, `#query` is the DOM id of your search box, and `your autocomplete key` can be found on [your dashboard](/dashboard).

## Install using requirejs

If you're using requirejs, you can install our client with this code:

<code>
&lt;script type="text/javascript"><br/>
&nbsp;&nbsp;&nbsp;&nbsp;require.config({paths: {constructorAutocomplete: '//cnstrc.com/js/ac'} });<br/>
&nbsp;&nbsp;&nbsp;&nbsp;require(['jquery', 'constructorAutocomplete'], function($) {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#query').constructorAutocomplete({ key: '[your autocomplete key]' });<br/>
&nbsp;&nbsp;&nbsp;&nbsp;});<br/>
&lt;/script>
</code>

Here, `#query` is the DOM id of your search box, and `your autocomplete key` can be found on [your dashboard](/dashboard).

## Style your autocomplete

You may style autocomplete suggestions in any way you'd like.

### Autocomplete suggestion HTML

Suggestions are returned with HTML markup as below:

<code>
&lt;div class="autocomplete-suggestions"><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;div class="autocomplete-suggestion autocomplete-selected">...&lt;/div><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;div class="autocomplete-suggestion">...&lt;/div><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;div class="autocomplete-suggestion">...&lt;/div><br/>
&lt;/div><br/>
</code>

### Example Styling

<code>
.autocomplete-suggestions {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;border: 1px solid #999;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;background: #FFF;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;overflow: auto;<br/>
}<br/>
.autocomplete-suggestion {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;padding: 2px 5px;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;white-space: nowrap;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;overflow: hidden;<br/>
}<br/>
.autocomplete-selected {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;background: #F0F0F0;<br/>
}<br/>
.autocomplete-suggestions strong {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;font-weight: normal;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;color: #3399FF; <br/>
}
</code>

## Advanced autocomplete options

We provide a number of options for advanced users. You can enable these options by adding the parameters to the hash that's passed into the `.constructorAutocomplete()` method, as below:

<code>
&lt;script type="text/javascript"><br/>
&nbsp;&nbsp;&nbsp;&nbsp;$.getScript("//cnstrc.com/js/ac.js", function() {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$('#query').constructorAutocomplete({ key: '[your autocomplete key]', maxResults: 4, imageWidth: "200px" });<br/>
&nbsp;&nbsp;&nbsp;&nbsp;})<br/>
&lt;/script>
</code>

Option | Default | Description
------------- | --- | ----------
boostRecentSearches|true|Increase ranking of recent user searches.
imageWidth|none|Specify the width of  images displayed in the suggestion list.
maxResults|10|Specify the maximum number of suggestions returned.
sectionOrder|order created|Set the order in which autocomplete sections appear in suggestion list. Array of autocomplete section names.

Our client is based on the excellent Devbridge autocomplete client, the full documentation for which can be found <a href="https://github.com/devbridge/jQuery-Autocomplete">here</a>.


