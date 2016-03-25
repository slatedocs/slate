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

A working example can be found on [jsbin](#not-implemented).