## Branding
Manage branding.

<!-------------------- LIST BRANDINGS -------------------->
### List brandings

`GET /brandings`

```shell
# Retrieve branding
curl "https://cloudmc_endpoint/rest/brandings" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "671f113c-dbbb-4478-be9c-90765b3259e5",
      "factory": false,
      "defaultLanguage": "en",
      "organization": {
        "id": "23910576-d29f-4c14-b663-31d728ff49a5"
      },
      "activeLanguages": "en,fr,es",
      "defaultTimezone": "America/Montreal",
      "applicationName": "CloudMC application",
      "artifacts": [
        {
          "createdAt": "2020-09-14T11:42:52.000Z",
          "name": "android-chrome-144x144.png",
          "id": "642c73cf-d675-4b6f-826b-72d1a240542e",
          "mimeType": "image/png",
          "type": "FAVICON",
          "content": "iVBOR...kJggg==",
          "updatedAt": "2020-09-14T11:42:52.000Z"
        }
      ]
    }
  ]
}
```

List the branding configured for the organization.

Query Params | &nbsp;
---- | -----------
`organization_id`<br/>*UUID* | Return only the branding for the provided organization id. If not provided, will default to the user's organization.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the branding.
`organization.id`<br/>*UUID* | The organization id that the branding is linked to.
`defaultLanguage`<br/>*string* | The default language.
`activeLanguages`<br/>*Array[string]* | List of the possible languages.
`defaultTimezone`<br/>*string* | The default timezone.
`applicationName`<br/>*string* | The application name displayed to the user.
`factory`<br/>*boolean* | If the branding is the factory branding.
`artifacts`<br/>*Array[Object]* | The list of artifacts linked to the branding. This includes the custom css, colours css, logos, favicons.
`artifacts.id`<br/>*UUID* | The artifact id.
`artifacts.name`<br/>*string* | The artifact name.
`artifacts.mimeType`<br/>*string* | The mime type of the artifact.
`artifacts.type`<br/>*string* | The artifact type. The possibles values are: LOGO, LOGO_SQUARE, FAVICON, CUSTOM_CSS, COLORS.
`artifacts.content`<br/>*string* | The artifact content.
`artifacts.createdAt`<br/>*string* | The artifact creation date.
`artifacts.updatedAt`<br/>*string* | The artifact update date.



<!-------------------- GET BRANDING -------------------->

### Retrieve branding

`GET /brandings/:id`

```shell
# Retrieve knowledge base
curl "https://cloudmc_endpoint/rest/brandings/671f113c-dbbb-4478-be9c-90765b3259e5" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "671f113c-dbbb-4478-be9c-90765b3259e5",
    "factory": false,
    "defaultLanguage": "en",
    "organization": {
      "id": "23910576-d29f-4c14-b663-31d728ff49a5"
    },
    "activeLanguages": "en,fr,es",
    "defaultTimezone": "America/Montreal",
    "applicationName": "CloudMC application",
    "artifacts": [
      {
        "createdAt": "2020-09-14T11:42:52.000Z",
        "name": "android-chrome-144x144.png",
        "id": "642c73cf-d675-4b6f-826b-72d1a240542e",
        "mimeType": "image/png",
        "type": "FAVICON",
        "content": "iVBOR...kJggg==",
        "updatedAt": "2020-09-14T11:42:52.000Z"
      }
    ]
  }
}
```
Retrieve the branding associated to the id.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the branding.
`organization.id`<br/>*UUID* | The organization id that the branding is linked to.
`defaultLanguage`<br/>*string* | The default language.
`activeLanguages`<br/>*Array[string]* | List of the possible languages.
`defaultTimezone`<br/>*string* | The default timezone.
`applicationName`<br/>*string* | The application name displayed to the user.
`factory`<br/>*boolean* | If the branding is the factory branding.
`artifacts`<br/>*Array[Object]* | The list of artifacts linked to the branding. This includes the custom css, colours css, logos, favicons.
`artifacts.id`<br/>*UUID* | The artifact id.
`artifacts.name`<br/>*string* | The artifact name.
`artifacts.mimeType`<br/>*string* | The mime type of the artifact.
`artifacts.type`<br/>*string* | The artifact type. The possibles values are: LOGO, LOGO_SQUARE, FAVICON, CUSTOM_CSS, COLORS.
`artifacts.content`<br/>*string* | The artifact content.
`artifacts.createdAt`<br/>*string* | The artifact creation date.
`artifacts.updatedAt`<br/>*string* | The artifact update date.
