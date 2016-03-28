## Get list of categories

```js
$(document).ready(function(){
  $.ajax({
    url: 'https://demo.controlshiftlabs.com/categories.json',
    dataType: 'jsonp',
  })
  .done(function(data) {
    console.log(data);
  });
});
```

> The above code would display a list of categories in the console.  The JSON would be structured like this:

```json
[
  {
    "category_name": "Animal Rights",
    "category_count": 7,
    "slug": "animal-rights-2",
    "url": "https://demo.controlshiftlabs.com/categories/animal-rights-2.json",
    "signature_count": 8,
    "locales": {
      "es": "Derechos Animales"
    }
  }, {
    "category_name": "cats",
    "category_count": 31,
    "slug": "cats",
    "url": "https://demo.controlshiftlabs.com/categories/cats.json",
    "signature_count": 270,
    "locales": {
      "es": "gatos"
    }
  }, {
    "category_name": "Civil Rights",
    "category_count": 23,
    "slug": "civil-rights-1",
    "url": "https://demo.controlshiftlabs.com/categories/civil-rights-1.json",
    "signature_count": 165,
    "locales": {
      "es": "Derechos Civiles"
    }
  }, {
    "category_name": "Culture",
    "category_count": 3,
    "slug": "cultura",
    "url": "https://demo.controlshiftlabs.com/categories/cultura.json",
    "signature_count": 10,
    "locales": {
      "es": "Cultura"
    }
  }
]
```

This retrieves a JSON array of category objects.

### HTTP Request

`GET https://demo.controlshiftlabs.com/categories.json`

### Working Example

View and edit a working example on codepen.io:

<div class="js-codepen-data hidden" data-title="ControlShift Labs: Categories List Example">
  <div class="codepen-html">
    <h1>Categories List</h1>
    <div id="categories">
    </div>
  </div>
  <pre class="codepen-js">
    $(document).ready(function(){
      $.ajax({
        url: 'https://demo.controlshiftlabs.com/categories.json',
        dataType: 'jsonp',
      })
      .done(function(data) {
        var $placeholder = $('#categories');
        $.each(data, function(index, category){
          output = '<h2><a href="'+category.url+'">'+category.category_name+'</a></h2>';
          output += '<ul>'
          output += '<li><strong>Slug:</strong> '+category.slug+'</li>';
          output += '<li><strong>Signatures:</strong>'+category.signature_count+'</li>';
          output += '<li><strong>API URL:</strong>'+category.url+'</li>';
          output += '</ul><hr/>';
          $placeholder.append(output);
        });
      });
    });
  </pre>
</div>

<form action="https://codepen.io/pen/define" method="POST" target="_blank" class="hidden">
  <input type="hidden" name="data" class="js-data" value="">
  <input type="submit" value="Launch Example on CodePen">
</form>