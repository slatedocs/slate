## Knowledge Base
Manage knowledge base.

<!-------------------- LIST KNOWLEDGE BASES -------------------->
### List knowledge base

`GET /content/kb`

```shell
# Retrieve branding
curl "https://cloudmc_endpoint/rest/content/kb" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "organizationId": "23910576-d29f-4c14-b663-31d728ff49a5",
      "sources": [
        {
          "createdDate": "2020-07-27T15:46:58Z",
          "lastSyncDate": "2020-09-24T15:54:32Z",
          "id": "585bd805-5b85-44af-9800-a9e55b2f619c",
          "branch": "master",
          "url": "https://github.com/cloudops/cloudmc-standard-kb"
        }
      ],
      "id": "1de30074-dac8-4c8b-8eda-585f9fad9c49",
      "state": "READY",
      "categories": [
        {
          "createdAt": "2020-07-27T15:46:59.000Z",
          "featured": false,
          "externalDocumentation": [
            {
              "language": "en",
              "url": "http://docs.cloudstack.apache.org/en/latest/"
            },
            {
              "language": "es",
              "url": "http://docs.cloudstack.apache.org/en/latest/"
            },
            {
              "language": "fr",
              "url": "http://docs.cloudstack.apache.org/en/latest/"
            }
          ],
          "translations": [
            {
              "language": "en",
              "id": "35b2b5e0-4944-4f92-9ddb-68eb980a31b2",
              "text": "CloudStack Service",
              "type": "title",
              "version": 1
            },
            {
              "language": "en",
              "id": "27cb1d2d-d624-4fe7-b0d1-8677c5f3200a",
              "text": "cloudstack-compute-service",
              "type": "url_slug",
              "version": 1
            }
          ],
          "icon": "fa fa-cloud",
          "rank": 2,
          "id": "47789e16-ef75-4cf8-82f7-747098533e63",
          "gitKey": "cloudstack-compute-service",
          "articles": [
            {
              "createdAt": "2020-07-27T15:47:01.000Z",
              "translations": [
                {
                  "language": "fr",
                  "id": "83297d87-e984-42b8-9356-2edef188b6c5",
                  "text": "Gestion des modèles",
                  "type": "title",
                  "version": 1
                },
                {
                  "language": "fr",
                  "id": "07bec89a-870e-4506-9d45-8ea977b2f9f2",
                  "text": "gestion-des-modeles",
                  "type": "url_slug",
                  "version": 1
                },
                {
                  "language": "fr",
                  "id": "aa2deeee-39a6-40f8-886b-1779c8bdbfa0",
                  "text": "\n\n### Créer un modèle à partir d'une instance existante...",
                  "type": "body",
                  "version": 2
                }
              ],
              "rank": 9,
              "id": "05353b4b-5675-4631-b91a-6872f385c3b5",
              "published": true,
              "gitKey": "cloudstack-compute-service/working-with-instance-templates",
              "updatedAt": "2020-09-24T15:54:36.000Z"
            }
          ],
          "updatedAt": "2020-09-24T15:54:34.000Z"
        }
      ]
    }
  ]
}
```

List the knowledge base configured for the organization.

Query Params | &nbsp;
---- | -----------
`organization_id`<br/>*UUID* | Return only the knowledge base for the provided organization id. If not provided, will default to the user's organization.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the knowledge base.
`organization.id`<br/>*UUID* | The organization id that the knowledge base is linked to.
`state`<br/>*string* | The source state. Possible values:  IMPORTING, SYNCHING, READY, ERROR.
`sources`<br/>*Array[Object]* | List of sources associated to the knowledge base
`sources.id`<br/>*UUID* | The source id.
`sources.url`<br/>*string* | The source URL.
`sources.branch`<br/>*string* | The source branch.
`sources.createdDate`<br/>*string* | The date the source was created.
`sources.lastSyncDate`<br/>*string* | The last date the source was synchronized.
`categories.id`<br/>*UUID* | The category id.
`categories.gitKey`<br/>*string* | The category git key.
`categories.rank`<br/>*integer* | The category rank.
`categories.icon`<br/>*string* | The category icon.
`categories.createdAt`<br/>*string* | The creation date.
`categories.updatedAt`<br/>*string* | The update date.
`categories.featured`<br/>*boolean* | If the category needs to be displayed.
`categories.externalDocumentation`<br/>*Array[Object]* | List of URL and language objects. Only either 1) articles, or, 2) external documentation, will be provided for a category (example above shows both only as an example for the object structure).
`categories.externalDocumentation.language`<br/>*string* | Language of the external documentation. This indicates which URL to use based on the help center selected language.
`categories.externalDocumentation.url`<br/>*string* | URL link to the external documentation.
`categories.translations`<br/>*Array[Object]* | The translation objects for the category.
`categories.translations.id`<br/>*UUID* | The id of the translation.
`categories.translations.language`<br/>*string* | The language of the translation.
`categories.translations.text`<br/>*string* | The content of the translation.
`categories.translations.type`<br/>*string* | The type of translation. Possible values are: title or url_slug.
`categories.translations.version`<br/>*integer* | The version of the translation.
`categories.articles`<br/>*Array[Object]* | The list of articles in the category.
`categories.articles.id`<br/>*UUID* | The id of the article.
`categories.articles.published`<br/>*boolean* | If the article is published.
`categories.articles.rank`<br/>*integer* | The article rank.
`categories.articles.gitKey`<br/>*string* | The article git key.
`categories.articles.createdAt`<br/>*string* | The creation date.
`categories.articles.updatedAt`<br/>*string* | The update date.
`categories.articles.translations`<br/>*Array[Object]* | The translation objects for the article.
`categories.articles.translations.id`<br/>*UUID* | The id of the translation.
`categories.articles.translations.language`<br/>*string* | The language of the translation.
`categories.articles.translations.text`<br/>*string* | The content of the translation.
`categories.articles.translations.type`<br/>*string* | The type of translation. Possible values are: title, body or url_slug.
`categories.articles.translations.version`<br/>*integer* | The version of the translation.

<!-------------------- GET KNOWLEDGE BASES -------------------->

### Retrieve knowledge base

`GET /content/kb/:id`

```shell
# Retrieve trial settings
curl "https://cloudmc_endpoint/rest/content/kb/671f113c-dbbb-4478-be9c-90765b3259e5" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": {
    "organizationId": "23910576-d29f-4c14-b663-31d728ff49a5",
    "sources": [
      {
        "createdDate": "2020-07-27T15:46:58Z",
        "lastSyncDate": "2020-09-24T15:54:32Z",
        "id": "585bd805-5b85-44af-9800-a9e55b2f619c",
        "branch": "master",
        "url": "https://github.com/cloudops/cloudmc-standard-kb"
      }
    ],
    "id": "1de30074-dac8-4c8b-8eda-585f9fad9c49",
    "state": "READY",
    "categories": [
      {
        "createdAt": "2020-07-27T15:46:59.000Z",
        "featured": false,
        "externalDocumentation": [
            {
              "language": "en",
              "url": "http://docs.cloudstack.apache.org/en/latest/"
            },
            {
              "language": "es",
              "url": "http://docs.cloudstack.apache.org/en/latest/"
            },
            {
              "language": "fr",
              "url": "http://docs.cloudstack.apache.org/en/latest/"
            }
          ],
        "translations": [
          {
           "language": "en",
           "id": "35b2b5e0-4944-4f92-9ddb-68eb980a31b2",
           "text": "CloudStack Service",
           "type": "title",
           "version": 1
          },
          {
            "language": "en",
            "id": "27cb1d2d-d624-4fe7-b0d1-8677c5f3200a",
            "text": "cloudstack-compute-service",
            "type": "url_slug",
            "version": 1
          }
        ],
        "icon": "fa fa-cloud",
        "rank": 2,
        "id": "47789e16-ef75-4cf8-82f7-747098533e63",
        "gitKey": "cloudstack-compute-service",
        "articles": [
          {
            "createdAt": "2020-07-27T15:47:01.000Z",
            "translations": [
              {
                "language": "fr",
                "id": "83297d87-e984-42b8-9356-2edef188b6c5",
                "text": "Gestion des modèles",
                "type": "title",
                "version": 1
              },
              {
                "language": "fr",
                "id": "07bec89a-870e-4506-9d45-8ea977b2f9f2",
                "text": "gestion-des-modeles",
                "type": "url_slug",
                "version": 1
              },
              {
                "language": "fr",
                "id": "aa2deeee-39a6-40f8-886b-1779c8bdbfa0",
                "text": "\n\n### Créer un modèle à partir d'une instance existante...",
                "type": "body",
                "version": 2
              }
            ],
            "rank": 9,
            "id": "05353b4b-5675-4631-b91a-6872f385c3b5",
            "published": true,
            "gitKey": "cloudstack-compute-service/working-with-instance-templates",
            "updatedAt": "2020-09-24T15:54:36.000Z"
          }
        ],
        "updatedAt": "2020-09-24T15:54:34.000Z"
      }
    ]
  }
}
```
Retrieve the branding associated to the id.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the knowledge base.
`organization.id`<br/>*UUID* | The organization id that the knowledge base is linked to.
`state`<br/>*string* | The source state. Possible values:  IMPORTING, SYNCHING, READY, ERROR.
`sources`<br/>*Array[Object]* | List of sources associated to the knowledge base
`sources.id`<br/>*UUID* | The source id.
`sources.url`<br/>*string* | The source URL.
`sources.branch`<br/>*string* | The source branch.
`sources.createdDate`<br/>*string* | The date the source was created.
`sources.lastSyncDate`<br/>*string* | The last date the source was synchronized.
`categories.id`<br/>*UUID* | The category id.
`categories.gitKey`<br/>*string* | The category git key.
`categories.rank`<br/>*integer* | The category rank.
`categories.icon`<br/>*string* | The category icon.
`categories.createdAt`<br/>*string* | The creation date.
`categories.updatedAt`<br/>*string* | The update date.
`categories.featured`<br/>*boolean* | If the category needs to be displayed.
`categories.externalDocumentation`<br/>*Array[Object]* | List of URL and language objects. Only either 1) articles, or, 2) external documentation, will be provided for a category (example above shows both only as an example for the object structure).
`categories.externalDocumentation.language`<br/>*string* | Language of the external documentation. This indicates which URL to use based on the help center selected language.
`categories.externalDocumentation.url`<br/>*string* | URL link to the external documentation.
`categories.translations`<br/>*Array[Object]* | The translation objects for the category.
`categories.translations.id`<br/>*UUID* | The id of the translation.
`categories.translations.language`<br/>*string* | The language of the translation.
`categories.translations.text`<br/>*string* | The content of the translation.
`categories.translations.type`<br/>*string* | The type of translation. Possible values are: title or url_slug.
`categories.translations.version`<br/>*integer* | The version of the translation.
`categories.articles`<br/>*Array[Object]* | The list of articles in the category.
`categories.articles.id`<br/>*UUID* | The id of the article.
`categories.articles.published`<br/>*boolean* | If the article is published.
`categories.articles.rank`<br/>*integer* | The article rank.
`categories.articles.gitKey`<br/>*string* | The article git key.
`categories.articles.createdAt`<br/>*string* | The creation date.
`categories.articles.updatedAt`<br/>*string* | The update date.
`categories.articles.translations`<br/>*Array[Object]* | The translation objects for the article.
`categories.articles.translations.id`<br/>*UUID* | The id of the translation.
`categories.articles.translations.language`<br/>*string* | The language of the translation.
`categories.articles.translations.text`<br/>*string* | The content of the translation.
`categories.articles.translations.type`<br/>*string* | The type of translation. Possible values are: title, body or url_slug.
`categories.articles.translations.version`<br/>*integer* | The version of the translation.
