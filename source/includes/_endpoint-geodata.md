## Geodata

Geodata allow you to associate a variable with features in a FeatureCollection
of geojson or topojson.

### Catalog

`/geodata/`

#### GET

Crunch maintains a few geojson/topojson resources and publishes them on CDN.
GET the catalog <https://beta.crunch.io/api/geodata/> for an index of available
geographies, each of which then includes a location to download the actual
geojson or topojson.

```json
{
    "element": "shoji:catalog",
    "self": "https://beta.crunch.io/api/geodata/",
    "index": {
        "https://beta.crunch.io/api/geodata/7ae898e210b04a9a8992314452c6677b/": {
            "description": "use properties.name or properties.postal-code",
            "created": "2016-07-08T16:33:44.601000+00:00",
            "name": "US States GeoJSON Name + Postal Code",
            "location": "https://s.crunch.io/geodata/leafletjs/us-states.geojson",
            "id": "7ae898e210b04a9a8992314452c6677b"
        }
    }
}
```

The geodata catalog tuples contain the following keys:


Name | Type | Description
---- | ---- | -----------
name | string | Human-friendly string identifier
created | timestamp | Time when the item was created
id | string | Global unique identifier for this deck
location | uri | Location of crunch-curated geojson/topojson file. Users may need to inspect this actual file to learn about details of the FeatureCollection and individual Features.
description | string | Any additional information about the geodatum

### Geodata for common applications

- <https://beta.crunch.io/api/geodata/7ae898e210b04a9a8992314452c6677b/>
  **US States** –
  Use `properties.name` or `properties.postal-code` as your `feature_key` depending on the variable (state name or abbreviation), or `id` is FIPS code.
- <https://beta.crunch.io/api/geodata/8f9f5fed101042c4815d2dd1fd248cec/>
  **World** –
  `properties` include ISO3166 `name` as well as ISO3166-1 Alpha-3 `abbrev`
- <https://beta.crunch.io/api/geodata/2b64724ce81c41c9bdc2436fb0bf6026/>
  **UK Regions** –
  `properties.EER13NM` matches a YouGov stylization of United Kingdom region names.


### Associating Variables with Geodata

To make maps with variables, update a variable’s `view` (or include with metadata at creation) as follows, where
`feature_key` is key defined for each Feature in the geojson/topojson that matches the relevant field on the
variable at hand (generally category `name`s).


```json
{"view": { "geodata": [
        {"geodatum": "<uri>",
         "feature_key": "properties.name"}
    ]}
}
```
