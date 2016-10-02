# Locales

Use the `locale` parameter to query content in different languages for any request. The first language will always be used as the main (fallback and default) language.

## Get List of Available Locales

`GET https://demo.gomus.de/api/v4/locales`

```shell
curl "https://demo.gomus.de/api/v4/locales"
```

> The above command returns JSON structured like this:

```json
{
    "locales": [
        "de",
        "en"
        ]
}
```

## Multi-Locale support

go~mus supports multiple locales for authenticated requests. Using the `locale` parameter as an array will return
every translatable attribute as a hash with the requested locales as keys and the translations as values.

Note that only available locales (see above) are valid for multi locale requests.

### Mulit-Locale example

The following example will require the ticket details in german and english at once.

`GET https://demo.gomus.de/api/v4/ticket/1?locale[]=de&locale[]=en`

```shell
curl "https://demo.gomus.de/api/v4/ticket/1?locale[]=de&locale[]=en`
```

> The above example command returns JSON structured like this:

```json
{
    "ticket": {
        "id": 1,
        "title": {
          "en": "regular ticket",
          "de": "Ticket regulär"
        },
        "sub_title": {
          "en": "for visitors",
          "de": "für Besucher"
        },
        "description": {
          "en": "description",
          "de": "Beschreibung"
        },
        
        ...
    }
}   
```