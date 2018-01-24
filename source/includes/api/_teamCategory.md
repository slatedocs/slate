## teamCategory object

teamCategory objects have the following attributes:

####id

A unique identifier for this category.

####category

The numeric identifier for the workgroup category to which this team category belongs.

####label

The label for this team category.

### teamCategory.list

> Request example:

```JSON
{}
```

> Response example:

```JSON
{
   "seconds" : "0.051276",
   "jsonrpc" : "2.0",
   "id" : "21",
   "result" : [
      {
         "label" : "Sales",
         "category" : 1,
         "id" : 2743
      }
   ]
}
```

<span class="tryit" id="teamcategory-list-tryit"></span>
Lists all current team categories.

### teamCategory.create

> Request example:

```JSON
{
   "label" : "Sales",
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
      "label" : "Sales",
      "category" : 1,
      "id" : 2351
   }
}
```

<span class="tryit" id="teamcategory-create-tryit"></span>
Creates a new team category.

Only five (5) team categories are allowed.

Required parameters:

####category

The numeric identifier for the category.

####label

The label for this category.

Response: On success, the created teamCategory will be returned.

### teamCategory.update

> Request example:

```JSON
{
   "label" : "Corporate Relations",
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
      "label" : "Corporate Relations",
      "category" : 3,
      "id" : 2334
   }
}
```

<span class="tryit" id="teamcategory-update-tryit"></span>
Updates the label on a team category.

Required parameters:

####id

The unique identifier for the category.

####label

The new label for this category.

Response: On success, the updated teamCategory will be returned

### teamCategory.delete

> Request example:

```JSON
{
   "id" : 2313
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

<span class="tryit" id="teamcategory-delete-tryit"></span>
Deletes a team category.

Required parameters:

####id

The unique identifier for the category.

Response: On success, an empty results will be returned

