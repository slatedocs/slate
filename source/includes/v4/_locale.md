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
