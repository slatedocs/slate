## List petitions in a category

```js
$(document).ready(function(){
  $.ajax({
    url: 'https://demo.controlshiftlabs.com/categories/mice.json',
    dataType: 'jsonp',
  })
  .done(function(data) {
    console.log(data);
  });
});
```

> The above code would return petitions data from the category with the slug `mice`.  The JSON would be structured like this:

```json
{
  "current_page": 1,
  "total_pages": 1,
  "previous_page": null,
  "next_page": null,
  "name": "mice",
  "results": [{
    "slug": "apple-stop-your-comic-sans-snobbery",
    "title": "Apple: Stop your Comic Sans snobbery",
    "url": "http://demo.controlshiftlabs.com/petitions/apple-stop-your-comic-sans-snobbery",
    "admin_status": "good",
    "image_url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/24551/hero/helveticacomicsans.gif?1398764339",
    "additional_image_sizes_url": [{
      "style": "form",
      "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/24551/form/helveticacomicsans.gif?1398764339"
    }, {
      "style": "large",
      "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/24551/large/helveticacomicsans.gif?1398764339"
    }, {
      "style": "open_graph",
      "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/24551/open_graph/helveticacomicsans.gif?1398764339"
    }, {
      "style": "original",
      "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/24551/original/helveticacomicsans.gif?1398764339"
    }],
    "who": "Tim Cook, CEO Apple",
    "what": "Use Comic Sans for the default font on the iPhone 6.",
    "goal": 100,
    "signature_count": 7,
    "creator_name": "John Wood",
    "created_at": "2014-04-29T05:35:47.693-04:00",
    "updated_at": "2016-01-06T11:02:17.617-05:00",
    "why": "Apple occupy a key position in the hearts of typeface poseurs everywhere. If they were to make a bold step and switch to using the people's font, Comic Sans on the new iPhone, this would cause mass..."
  }, {
    "slug": "clean-up-the-himalayas",
    "title": "Clean up the Himalayas",
    "url": "http://demo.controlshiftlabs.com/petitions/clean-up-the-himalayas",
    "admin_status": "good",
    "image_url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/6359/hero/gorak_shep_thumb.jpg?1431734031",
    "additional_image_sizes_url": [{
      "style": "form",
      "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/6359/form/gorak_shep_thumb.jpg?1431734031"
    }, {
      "style": "large",
      "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/6359/large/gorak_shep_thumb.jpg?1431734031"
    }, {
      "style": "open_graph",
      "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/6359/open_graph/gorak_shep_thumb.jpg?1431734031"
    }, {
      "style": "original",
      "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/6359/original/gorak_shep_thumb.jpg?1431734031"
    }],
    "who": "Nepal Ghurung",
    "what": "Clean up the Khumbu region.",
    "goal": 100,
    "signature_count": 1,
    "creator_name": "Grant Cox",
    "created_at": "2013-06-03T17:13:41.399-04:00",
    "updated_at": "2015-07-17T15:11:48.665-04:00",
    "why": "It's quite dirty, and I don't like it.",
    "location": {
      "query": "Nepal",
      "latitude": "28.394857",
      "longitude": "84.124008",
      "street": "",
      "postal_code": "",
      "country": "NP",
      "region": "",
      "street_number": "",
      "venue": "Nepal",
      "created_at": "2013-06-03T17:13:41.057-04:00"
    }
  }]
}

```

This retrieves a paginated list of petitions in a category.

### HTTP Request

`GET https://demo.controlshiftlabs.com/categories/<category slug>.json`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
category slug | null | string - required - submitted as a part of the endpoint path, not as a separate URL parameter
page | 1 | integer - optional - The page number of results for the specified category. Minimum of 1.

### Working Example

A working example can be found on [jsbin](#not-implemented).