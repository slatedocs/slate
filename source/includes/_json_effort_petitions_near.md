## Find near by petitions

```js
$(document).ready(function(){
  var effortSlug = 'forecast-the-facts',
    latitude = 38.88233400000001,
    longitude = -77.17109140000002;
  $.ajax({
    url: 'https://demo.controlshiftlabs.com/efforts/'+effortSlug+'/'+'near.json',
    dataType: 'jsonp',
    data: {
      'location[latitude]': latitude,
      'location[longitude]': longitude
    }
  })
  .done(function( data ) {
    console.log(data);
  });
});
```
<!--slash in '/'+'near.json' above disappears if combined with near-->

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

This JSON endpoint allows you to reproduce the "search for the nearest petition in an effort" interface. Use this endpoint to build a place for users to enter their location. Once they've searched for a location, we'll return the nearest petition. This endpoint can most easily be used with a [Google Maps](https://developers.google.com/places/web-service/autocomplete) integration to help your users locate their addresses or other points of interest. For an example, click on the working example below.

### HTTP Request

`GET https://demo.controlshiftlabs.com/efforts/<effort slug>/near.json`

### Query Parameters

This endpoints accepts a few nested attributes in a `location` object, as described below.

Parameter | Default | Description
--------- | ------- | -----------
effort slug | null | string - required - submitted as a part of the endpoint path, not as a separate URL parameter
location[latitude] | null | float - required - a float representing the queried latitude
location[longitude] | null | float - required - a float representing the queried longitude
location[country] | null | string - optional - for efforts configured to use the "by country" search strategy, you can pass in the target country as a two letter [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements) code.
location[region] | null | string - optional - for efforts configured to use the "by state" search strategy, you can pass in the target state as a two letter state abbreviation.

### Working Example

View and edit a working example on codepen.io:

<div class="js-codepen-data hidden"
  data-js_external="https://maps.googleapis.com/maps/api/js?key=AIzaSyAm5aA1UDKBL6dRD9yHPGydlZcBgzk6lsY&libraries=places"
  data-title="ControlShift Labs: List of Petitions in an Effort Example">
  <div class="codepen-html">
    <h1>Find the closest petitions to you</h1>
    <form>
      <input type="text" class="form-control" id="effort-lookup-input" placeholder="Enter your address or a nearby landmark">
      <small>Note: The above text field is auto-completed using the Google Maps <a href="https://developers.google.com/places/web-service/autocomplete" target="_blank">Autocomplete API</a></small>
    </form>
    <div id="petitions">
    </div>
  </div>
  <pre class="codepen-js">
    function buildPetition(target, description){
      output = '<h2><em>'+description+' Petition</em>: '+target.name+'</h2>';
      output += '<h3>'+target.location+'</h3> <ul>';
      output += '<li><strong>Title:</strong> '+target.petition.title+'</li>';
      output += '<li><strong>Who:</strong> '+target.petition.who+'</li>';
      output += '<li><strong>Goal:</strong> '+target.petition.goal+'</li>';
      output += '<li><strong>Signatures so far:</strong> '+target.petition.signature_count+'</li>';
      output += '</ul><hr/>';
      return output;
    }

    function getPetitionsCallback(place) {
      // Get the place details from the autocomplete object.
      var place = autocomplete.getPlace();

      // get the targets and petitions (if they exist) for the effort near the place specified.
      $.ajax({
        url: 'https://demo.controlshiftlabs.com/efforts/forecast-the-facts/near.json',
        dataType: 'jsonp',
        data: {
          'location[latitude]': place.geometry.location.lat(),
          'location[longitude]': place.geometry.location.lng()
        }
      })
      .done(function(data) {
        $placeholder = $('#petitions');
        //populate closest target
        $placeholder.append( buildPetition(data.closest_target, 'Closest') );
        $.each(data.other_targets, function(index, other_petition){
          $placeholder.append( buildPetition(other_petition, 'Near By') );
        });
      });
    };

    $(document).ready(function(){
      $('form').on('submit', function(e){e.preventDefault()});
      var input = document.getElementById('effort-lookup-input');
      var options = { };
      autocomplete = new google.maps.places.Autocomplete(input, options);
      autocomplete.addListener('place_changed', getPetitionsCallback);
    });
  </pre>
</div>

<form action="https://codepen.io/pen/define" method="POST" target="_blank" class="hidden">
  <input type="hidden" name="data" class="js-data" value="">
  <input type="submit" value="Launch Example on CodePen">
</form>