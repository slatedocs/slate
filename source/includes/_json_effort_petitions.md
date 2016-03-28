## List petitions in an effort

```js
$(document).ready(function(){
  var effortSlug = 'forecast-the-facts';
  $.ajax({
    url: 'https://demo.controlshiftlabs.com/efforts/'+effortSlug+'.json',
    dataType: 'jsonp',
  })
  .done(function(data) {
    console.log(data);
  });
});
```

> The above code would return petitions data from the effort with the slug `forecast-the-facts`.  The JSON would be structured like this:

```json
{
  "title": "Forecast the Facts",
  "slug": "forecast-the-facts",
  "description": "It is imperative that weather reporters fulfill an important part of their job, and explain the ways that climate change has influenced the freakish \"Frankenstorm\" Sandy. Below is a list of the meteorologists in your area, with telephone numbers and e-mail addresses. Please call or email them a message in your own words, asking them to connect the dots between global warming pollution and disasters like Sandy. Take a look at the talking points below if you need any help.",
  "goal": 100,
  "signature_count": 11,
  "image_url": "https://d8s293fyljwh4.cloudfront.net/efforts/images/16/hero/forecast.png?1351625402",
  "petitions": [
    {
      "slug": "forecast-the-facts-of-frankenstorm-wmtv-madison-wi",
      "title": "Forecast the Facts of Frankenstorm: WMTV Madison, WI",
      "url": "http://demo.controlshiftlabs.com/petitions/forecast-the-facts-of-frankenstorm-wmtv-madison-wi",
      "admin_status": "good",
      "image_url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/102705/hero/forecast.png?1429199472",
      "additional_image_sizes_url": [{
        "style": "form",
        "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/102705/form/forecast.png?1429199472"
      }, {
        "style": "large",
        "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/102705/large/forecast.png?1429199472"
      }, {
        "style": "open_graph",
        "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/102705/open_graph/forecast.png?1429199472"
      }, {
        "style": "original",
        "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/102705/original/forecast.png?1429199472"
      }],
      "who": "WMTV Madison, WI",
      "what": "It is imperative that weather reporters fulfill an important part of their job, and explain the ways that climate change has influenced the freakish \"Frankenstorm\" Sandy. Below is a list of the meteorologists in your area, with telephone numbers and e-mail addresses. Please call or email them a message in your own words, asking them to connect the dots between global warming pollution and disasters like Sandy. Take a look at the talking points below if you need any help.",
      "goal": 100,
      "signature_count": 1,
      "creator_name": "Kristyn Arrighi",
      "created_at": "2015-04-16T11:51:12.700-04:00",
      "updated_at": "2015-08-03T20:23:06.034-04:00",
      "why": "We want TV meteorologists to understand that the public is depending on them for information about climate change, especially as it increasingly impacts our weather patterns. We know that meteorolo...",
      "location": {
        "query": "WMTV-TV (Madison), Forward Drive, Madison, WI, United States",
        "latitude": "43.05091",
        "longitude": "-89.486738",
        "street": "Forward Dr",
        "postal_code": "53711",
        "country": "US",
        "region": "WI",
        "street_number": "615",
        "venue": "WMTV-TV (Madison)",
        "created_at": "2015-04-16T11:51:11.222-04:00"
      }
    }, {
      "slug": "forecast-the-facts-of-frankenstorm-woak",
      "title": "Forecast the Facts of Frankenstorm: WOAK",
      "url": "http://demo.controlshiftlabs.com/petitions/forecast-the-facts-of-frankenstorm-woak",
      "admin_status": "good",
      "image_url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/115310/hero/forecast.png?1439846499",
      "additional_image_sizes_url": [{
        "style": "form",
        "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/115310/form/forecast.png?1439846499"
      }, {
        "style": "large",
        "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/115310/large/forecast.png?1439846499"
      }, {
        "style": "open_graph",
        "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/115310/open_graph/forecast.png?1439846499"
      }, {
        "style": "original",
        "url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/115310/original/forecast.png?1439846499"
      }],
      "who": "WOAK",
      "what": "It is imperative that weather reporters fulfill an important part of their job, and explain the ways that climate change has influenced the freakish \"Frankenstorm\" Sandy. Below is a list of the meteorologists in your area, with telephone numbers and e-mail addresses. Please call or email them a message in your own words, asking them to connect the dots between global warming pollution and disasters like Sandy. Take a look at the talking points below if you need any help.",
      "goal": 100,
      "signature_count": 2,
      "creator_name": "Adam Klaus",
      "created_at": "2015-08-17T17:21:39.791-04:00",
      "updated_at": "2015-08-17T17:29:02.816-04:00",
      "why": "We want TV meteorologists to understand that the public is depending on them for information about climate change, especially as it increasingly impacts our weather patterns. We know that meteorolo...",
      "location": {
        "query": "Oklahoma City, OK, United States",
        "latitude": "35.4675602",
        "longitude": "-97.5164276",
        "street": "",
        "postal_code": "",
        "country": "US",
        "region": "OK",
        "street_number": "",
        "venue": "",
        "created_at": "2013-12-17T14:49:51.324-05:00"
      }
    }
  ]
}
```

This retrieves a list of petitions in an effort.

### HTTP Request

`GET https://demo.controlshiftlabs.com/efforts/<effort slug>.json`

Parameter | Default | Description
--------- | ------- | -----------
effort slug | null | string - required - submitted as a part of the endpoint path, not as a separate URL parameter

### Working Example

View and edit a working example on codepen.io:

<div class="js-codepen-data hidden" data-title="ControlShift Labs: List of Petitions in an Effort Example">
  <div class="codepen-html">
    <h1>Petitions in effort "<span id="title"></span>"</h1>
    <p><span id="description"></span></h1>
    <div id="petitions">
    </div>
  </div>
  <pre class="codepen-js">
    $(document).ready(function(){
      var effortSlug = 'forecast-the-facts';
      $.ajax({
        url: 'https://demo.controlshiftlabs.com/efforts/'+effortSlug+'.json',
        dataType: 'jsonp',
      })
      .done(function(data) {
        // Populate global effort data
        $('#title').text(data.title);
        $('#description').text(data.description);

        // Populate petitions data
        var $placeholder = $('#petitions');
        $.each(data.petitions, function(index, petition){
          output = '<h2><a href="'+petition.url+'">'+petition.title+'</a></h2>';
          output += '<ul>';
          output += '<li><strong>Image:</strong> '+petition.image_url+'</li>';
          output += '<li><strong>Who:</strong> '+petition.who+'</li>';
          output += '<li><strong>What:</strong> '+petition.what+'</li>';
          output += '<li><strong>Why:</strong> '+petition.why+'</li>';
          output += '<li><strong>Signatures:</strong> '+petition.signature_count+'</li>';
          output += '<li><strong>Goal:</strong> '+petition.goal+'</li>';
          output += '<li><strong>URL:</strong> '+petition.url+'</li>';
          output += '<li><strong>Location:</strong> <ul>'
          output += '<li><strong>Query:</strong> '+petition.location.query+'</li>';
          output += '<li><strong>Latitude:</strong> '+petition.location.latitude+'</li>';
          output += '<li><strong>Longitude:</strong> '+petition.location.longitude+'</li>';
          output += '</ul></li>';
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