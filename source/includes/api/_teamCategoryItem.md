## teamCategoryItem object

teamCategoryItem objects have the following attributes:

####id

A unique identifier for this category item.

####category

The numeric identifier for the category of this item.

####name

The name for this category item.

### teamCategoryItem.list

> Request example:

```JSON
{
   "select" : {
      "category" : 3
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.051276",
   "jsonrpc" : "2.0",
   "id" : "21",
   "result" : {
      "count" : 2,
      "page" : {
         "this" : {
            "batch" : 10,
            "start" : 1
         }
      },
      "items" : [
         {
            "name" : "Inside Sales",
            "category" : 3,
            "id" : 2329
         },
         {
            "name" : "Outside Sales",
            "category" : 3,
            "id" : 2327
         }
      ]
   }
}
```

<span class="tryit" id="teamcategoryitem-list-tryit"></span>
Lists all items associated with a team category. Uses [pagination](#pagination).

Optional parameters: `select` object with a `category` attribute identifying a single numerical category of items to be returned. E.g. `
{select:{category:3}}`

### teamCategoryItem.add

> Request example:

```JSON
{
   "name" : "Inside Sales",
   "category" : 1
}
```

> Response example:

```JSON
{
   "seconds" : "0.051276",
   "jsonrpc" : "2.0",
   "id" : "21",
   "result" : {
      "name" : "Inside Sales",
      "category" : 1,
      "id" : 2335
   }
}
```

<span class="tryit" id="teamcategoryitem-add-tryit"></span>
Creates a new item under a team category.

Required parameters:

####id

A unique identifier for this category item.

####name

The name for this category item.

Response: On success, the created teamCategoryItem will be returned.

### teamCategoryItem.update

> Request example:

```JSON
{
   "name" : "SE Regional",
   "id" : 2334
}
```

> Response example:

```JSON
{
   "seconds" : "0.051276",
   "jsonrpc" : "2.0",
   "id" : "21",
   "result" : {
      "name" : "SE Regional",
      "category" : 2,
      "id" : 2334
   }
}
```

<span class="tryit" id="teamcategoryitem-update-tryit"></span>
Updates the name of an item within a team category.

Required parameters:

Required parameters:

####id

A unique identifier for this category item.

####name

The name for this category item.

Response: On success, the updated teamCategoryItem will be returned

### teamCategoryItem.delete

> Request example:

```JSON
{
   "id" : 2432
}
```

> Response example:

```JSON
{
   "seconds" : "0.051276",
   "jsonrpc" : "2.0",
   "id" : "21",
   "result" : {}
}
```

<span class="tryit" id="teamcategoryitem-delete-tryit"></span>
Deletes an item within a team category.

Required parameters:

####id

The unique identifier for the category item.

Response: On success, an empty results will be returned

