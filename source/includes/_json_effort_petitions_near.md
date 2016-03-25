## Find near by petitions

```js
$(document).ready(function(){
  var effortSlug = 'forecast-the-facts',
    formatted_address = '123 Main Street Fall Church, VA, USA',
    latitude = 38.88233400000001,
    longitude = -77.17109140000002;
  $.ajax({
    url: 'https://demo.controlshiftlabs.com/efforts/'+effortSlug+'/near.json',
    dataType: 'jsonp',
    data: {
      'location[query]': formatted_address,
      'location[latitude]': latitude,
      'location[longitude]': longitude
    }
  })
  .done(function( data ) {
    console.log(data);
  });
});



```

> The above code would return petitions data from the effort with the slug `forecast-the-facts`.  The JSON would be structured like this:

```json
{
  "closest_target": {
    "slug": "doug-kammerer-nbc4",
    "name": "Doug Kammerer - NBC4",
    "location": "Washington D.C., DC",
    "status": "target_petition_created",
    "petition": {
      "slug": "forecast-the-facts-of-frankenstorm-doug-kammerer-nbc4",
      "title": "Forecast the Facts of Frankenstorm: Doug Kammerer - NBC4",
      "url": "https://demo.controlshiftlabs.com/petitions/forecast-the-facts-of-frankenstorm-doug-kammerer-nbc4",
      "image_url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/2139/hero/forecast.png?1351625677",
      "who": "Doug Kammerer - NBC4",
      "goal": 100,
      "signature_count": 1
    }
  },
  "other_targets": [
    {
      "slug": "linda-church-wpix",
      "name": "Linda Church - WPIX",
      "location": "New York, NY",
      "status": "target_petition_created",
      "petition": {
        "slug": "forecast-the-facts-of-frankenstorm-linda-church-wpix",
        "title": "Forecast the Facts of Frankenstorm: Linda Church - WPIX",
        "url": "https://demo.controlshiftlabs.com/petitions/forecast-the-facts-of-frankenstorm-linda-church-wpix",
        "image_url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/2137/hero/forecast.png?1351625520",
        "who": "Linda Church - WPIX",
        "goal": 100,
        "signature_count": 1
      }
    },
    {
      "slug": "wnyc",
      "name": "WNYC ",
      "location": "Manhattan, New York, NY, United States",
      "status": "target_awaiting_petition",
      "create_petition_url": "https://demo.controlshiftlabs.com/efforts/forecast-the-facts/petitions/creating?target_id=5148"
    },
    {
      "slug": "whdtv-boston",
      "name": "WHDTV Boston",
      "location": "Boston, MA, United States",
      "status": "target_petition_created",
      "petition": {
        "slug": "forecast-the-facts-of-frankenstorm-whdtv-boston",
        "title": "Forecast the Facts of Frankenstorm: WHDTV Boston",
        "url": "https://demo.controlshiftlabs.com/petitions/forecast-the-facts-of-frankenstorm-whdtv-boston",
        "image_url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/28044/hero/forecast.png?1405015225",
        "who": "WHDTV Boston",
        "goal": 100,
        "signature_count": 1
      }
    },
    {
      "slug": "wmtv-madison-wi",
      "name": "WMTV Madison, WI",
      "location": "WMTV-TV (Madison), Forward Drive, Madison, WI, United States",
      "status": "target_petition_created",
      "petition": {
        "slug": "forecast-the-facts-of-frankenstorm-wmtv-madison-wi",
        "title": "Forecast the Facts of Frankenstorm: WMTV Madison, WI",
        "url": "https://demo.controlshiftlabs.com/petitions/forecast-the-facts-of-frankenstorm-wmtv-madison-wi",
        "image_url": "https://d8s293fyljwh4.cloudfront.net/petitions/images/102705/hero/forecast.png?1429199472",
        "who": "WMTV Madison, WI",
        "goal": 100,
        "signature_count": 1
      }
    }
  ]
}
```

Search for closest petition in an effort

This JSON endpoint allows you to reproduce the 'search for the nearest petition in an effort' interface. Use this endpoint to build a place for users to enter their location. Once they've searched for a location, we'll return the nearest petition. This endpoint can most easily be used with a google maps integration to help your users locate their addresses or other points of interest.  Click on the working example below.

### HTTP Request

`GET https://demo.controlshiftlabs.com/efforts/<effort slug>/near.json`

### Query Parameters

This endpoints accepts a few nested attributes in a `location` object, as described below.

Parameter | Default | Description
--------- | ------- | -----------
effort slug | null | string - required - submitted as a part of the endpoint path, not as a separate URL parameter
location[query] | null | string - optional - MARIO TODO
location[latitude] | null | float - required - a float representing the queried latitude
location[longitude] | null | float - required - a float representing the queried longitude

### Working Example

A working example can be found on [jsbin](#not-implemented).