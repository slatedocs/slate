## Version

the go~mus API version is _4.1-rc-2_

Note: the current API version is a release candidate, features and specs might change until final release.

The system and api version is available at each instance:

`GET https://demo.gomus.de/api/v4/version`

```shell
curl "https://demo.gomus.de/api/v4/version"
```

> The above command returns JSON structured like this:

```json
{
    "version": {
      "system": "2.7.1",
      "api": "4.1-rc-2"
    }
}
```