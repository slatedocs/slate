## Geodata

Geodata allow you to associate a variable with features in a FeatureCollection
of geojson or topojson.

### Catalog

`/geodata/`

#### GET

Crunch maintains a few geojson/topojson resources and publishes them on CDN.
GET the catalog <https://app.crunch.io/api/geodata/> for an index of available
geographies, each of which then includes a location to download the actual
geojson or topojson.

```json
{
    "element": "shoji:catalog",
    "self": "https://app.crunch.io/api/geodata/",
    "index": {
        "https://app.crunch.io/api/geodata/7ae898e210b04a9a8992314452c6677b/": {
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
metadata | object | Information regarding the actual data provided by the location.  For now, the properties in the geodata features are extracted for the purpose of matching geodata to variable categories.

### Catalog

`/geodata/id/`

#### GET

Crunch maintains a few geojson/topojson resources and publishes them on CDN.
Most of their properties, with the exception of `metadata`, are present on the catalog
tuple, described above; metadata is an open field but may be populated at creation time
by a Crunch utility that extracts and aggregates across features of geojson and topojson
resources. For other formats, users may supply relevant metadata for the geodatum resource.

```json
{
    "element": "shoji:entity",
    "self": "https://app.crunch.io/api/geodata/7ae898e210b04a9a8992314452c6677b/",
    "body": {
        "description": "use properties.name or properties.postal-code",
        "created": "2016-07-08T16:33:44.601000+00:00",
        "name": "US States GeoJSON Name + Postal Code",
        "location": "https://s.crunch.io/geodata/leafletjs/us-states.geojson",
        "id": "7ae898e210b04a9a8992314452c6677b",
        "metadata": {
            "status": "success",
            "properties": {
                "postal-code": [
                    "AL",
                    "AK",
                    "AZ", "etc."
                ],
                "name": [
                    "Alabama",
                    "Arkansas",
                    "Alaska", "etcetera"
                ]
            }
        }
    }
}
```


### Geodata for common applications

- <https://app.crunch.io/api/geodata/7ae898e210b04a9a8992314452c6677b/>
  **US States** –
  Use `properties.name` or `properties.postal-code` as your `feature_key` depending on the variable (state name or abbreviation), or `id` is FIPS code.
- <https://app.crunch.io/api/geodata/8f9f5fed101042c4815d2dd1fd248cec/>
  **World** –
  `properties` include ISO3166 `name` as well as ISO3166-1 Alpha-3 `abbrev`
- <https://app.crunch.io/api/geodata/2b64724ce81c41c9bdc2436fb0bf6026/>
  **UK Regions** –
  `properties.EER13NM` matches a YouGov stylization of United Kingdom region names.

### Creating new public Geodatum

Users with permission to create datasets can also create geodata, although in practice Crunch curates and makes available 
many common geographies, listed in the geodata catalog. Note that geodata created outside of the Crunch domain
(ie without a .crunch.io domain in the URL) will not be available in whaam due to browser constraints.
If you would like to make your geodatum public and have Crunch serve it, please contact us!

Adding a new geodatum is as easy as POSTing it to the geodata catalog, most easily via pycrunch. Crunch will attempt to download
the geodata file and analyze the properties present on the features (generally polygons), which can then be associated
with Crunch variables. The metadata extraction and summary can help you align variables and select the right property to 
associate with your Crunch geographic variable by category name.

Include a `format` member in the payload (on post or patch) to trigger automatic metadata extraction. The server will
fetch and aggregate properties from FeatureCollections in order to provide hints for eventual consumers of the Crunch 
geodatum. The automatic feature extractor supports GeoJSON and TopoJSON formats; you may register a Shapefile (shp) or
other resource as a Crunch geodatum, but will have to supply `metadata` hints yourself and are advised to indicate its
non-json format.

The lists of properties returned in the metadata are correlated, such that if a feature in your geodata is missing a
 given property, it will return null.

```python
>>> import pycrunch
>>> site = pycrunch.connect("me@mycompany.com", "yourpassword", "https://app.crunch.io/api/")
>>> geodata = self.site.geodata.create(as_entity({'name': 'test_geojson',
                                                  'location': 'https://s.crunch.io/geodata/leafletjs/us-states.geojson',
                                                  'description': '',
                                                  'format': 'geojson'}))
>>> geodata.body.metadata
pycrunch.elements.JSONObject(**{
    "postal-code": [
        "AL", 
        "AK", 
        "AZ", 
        "AK", 
        "CA", ...],
    "name": [
        "Alabama", 
        "Alaska", 
        "Arizona", 
        "Arkansas", 
        "California", ...]})
        
```

### Modifying your public Geodata
You can modify any Geodatum that you own.  Note that you can transfer ownership to another user if you change the owner_id
of your geodatum.  You may also change the metadata of your geodatum, but keep in mind that if you do this you will override
any automated metadata extraction that Crunch provides. If you modify the location of the geodatum and do not provide
a metadata parameter in the patch, Crunch will automatically extract metadata as long as the location is publicly accessible.


```python
>>> import pycrunch
>>> site = pycrunch.connect("me@mycompany.com", "yourpassword", "https://app.crunch.io/api/")
>>> entity = site.geodata.index['<geodatum_url>'].entity
>>> entity.patch({'description': 'US States'})
>>> entity.refresh()
>>> entity.body.description
US States
```


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
