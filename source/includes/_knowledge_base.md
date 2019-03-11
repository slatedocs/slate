# Knowledge-Base APIs

Does not require authentication.

## Load Root Groups With Related Data

Loads root groups, each with related data.

```APIs
GET https://dev.zoomsymbols.com/api/knowledge-base/loadRootGroupsWithRelatedData
```

> Response

```json
{
  "error": null
  "result": {
     "groupContentProps": {
         "title": null,
         "groups": [{
             "id": 42,
             "title": "FAQ",
             "description": "",
             "urlSegment": "faq",
             "listOrder": 1,
             "parentId": null,
             "fullUrl": "/knowledge-base/g42/faq"
       },
     ...
    ],
    "urlPrefix": ""   
  },
    "itemContentProps": null,
    "sideNavProps": null,
    "backButtonUrl": false,
    "activeSearchKeyword": false,
    "searchResults": null
  }
}
```

## Load Group With Related Data

Loads a single group with related data.

```APIs
GET https://dev.zoomsymbols.com/api/knowledge-base/loadGroupWithRelatedData
```

> Parameters

```
id: group_id
```

> Response

```json
{
  "error": null,
  "result": {
     "groupContentProps": {
         "id": 42,
         "title": "FAQ",
         "groups": [{
             "id": 43,
             "title": "General",
             "description": "",
             "urlSegment": "general",
             "listOrder": 1,
             "parentId": 42,
             "fullUrl": "/knowledge-base/g43/faq/general"
         }]
     },
     ...
}
```


## Load Item With Related Data

Loads a single item with related data.

```APIs
GET https://dev.zoomsymbols.com/api/knowledge-base/loadItemWithRelatedData
```

> Parameters

```
id: item_id
```

> Response

```json
{
  "error": null,
  "result": {
     "groupContentProps": null,
     "itemContentProps": {
          "item": {
           "id": 22,
           "title": "World Most Valuable Brands",
           "urlSegment": "world-most-valuable-brands",
           "listOrder": 40,
           "parentId": 47,
           "article": "xxxxx",
           "fullUrl": "knowledge-base/xxx/apps/xxxxxxx"
           }
     },
   ...
  }
}
```


## Load Search Results With Related Data

Display the result of a search query with related data.

```APIs
GET https://dev.zoomsymbols.com/api/knowledge-base/loadSearchResultsWithRelatedData
```

> Parameters

```
keyword: your_keyword
```

> Response

```json
{
  "error": null,
  "result": {
     "groupContentProps": null,
     "itemContentProps": null,
     "sideNavProps": {
          "item": [],
          "selectedItemId": 0
     },
   "backButtonUrl": "/knowledge-base",
   "activeSearchKeyword": "market",
   "searchResults": [{
        "type": "g",
        "id": 46,
        "title": "Markets",
        "fullUrl": "/knowledge-base/g46/apps/markets",
        "sectionTitles": ["Apps"]
   }, {
       "type": "i",
       "id": 21,
       "title": "\"Markets\" App - Quick Intro video",
       "fullUrl": "/knowledge-base/i21/apps/markets/global-markets-overview",
       "sectionTitles": ["Markets", "Apps"]
    }]
  }
}
```
