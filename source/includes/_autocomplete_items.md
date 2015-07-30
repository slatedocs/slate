# Autocomplete Items

Suggestions that are shown in the autocomplete results are called `items`.  `items` can be full product names (with metadata including images and descriptions) or simple search terms.

## Add an Item

```shell
curl -X POST -H "Content-Type: application/json" \
  -d '{"item_name":"power drill","keywords":["battery-powered","drills","drywall"], \
  "suggested_score":36,"url":"http://www.mysite.com/power_drill","autocomplete_section":"products_autocomplete"}' \
  -u"[your token]:" "https://ac.constructor.io/v1/item?autocomplete_key=[your_autocomplete_key]"
```

```javascript
constructorio.add(
  { item_name: "power_drill", autocomplete_section: "standard" },
  function(error, response) {
    console.log(response);
  }
);
```

> The above command returns a 204 Success response on success.

To add an item to your autocomplete index, use the `POST /item` call. The `item_name` is required. You can also pass in an optional `suggested_score` between 1-100, which will influence the item's initial ranking relative to other item scores (the higher the score, the higher in the list of suggestions the item will appear). You can also optionally pass in the item's `keywords` to give us more meta information and help us better determine how and where to display the item when autocompleting. If you would like to add an item that points to a direct link, just pass in that link as a `url`. Finally, if your autocomplete has multiple sections, like categories, search suggestions, and direct links to products, you must specify which section you are adding an item to. You can do this with the `autocomplete_section` parameter.

### HTTP Request

`POST https://ac.constructor.io/v1/item?autocomplete_key=[your_autocomplete_key]`

### JSON Parameters

Parameter | Required? | Description
--------- | ------- | -----------
item_name | Yes | The name of the item, as it will appear in the autocomplete suggestions
suggested_score | No | A number between 1-100 that will influence the item's initial ranking relative to other item scores (the higher the score, the higher in the list of suggestions the item will appear)
keywords | No | An array of keywords for this item.  Keywords are useful if you want a product name to appear when a user enters a searchterm that isn't in the product name iteslf.
url | No | A URL to directly send the user after selecting the item
autocomplete_section | No | Your autocomplete suggestions can have multiple sections like "Products" and "Search Suggestions".  This indicates which section this item is for.

## Remove an Item

```javascript
constructorio.remove(
  { item_name: "power_drill", autocomplete_section: "standard" },
  function(error, response) {
    console.log(response);
  }
);
```

```shell
curl -X DELETE -H "Content-Type: application/json" -d '{"item_name":"power drill","autocomplete_section":"products_autocomplete"}' \
  -u "[your token]:" "https://ac.constructor.io/v1/item?autocomplete_key=[your_autocomplete_key]"
```

> The above command returns a 204 Success response on success.

To remove an item from your autocomplete index (if, for instance, a product has been discontinued), issue a `DELETE /item` call. Note: this will remove all meta-information such as keywords we currently have on the item. If your autocomplete has multiple sections (i.e. products, categories, and search suggestions), you must specify the name of the autocomplete section from which you're removing an item.

### HTTP Request

`DELETE https://ac.constructor.io/v1/item?autocomplete_key=[your_autocomplete_key]`

### JSON Parameters

Parameter | Required? | Description
--------- | ----------- | ----------`
item_name | Yes | The name of the item, as it will appear in the autocomplete suggestions
autocomplete_section | No | Your autocomplete suggestions can have multiple sections like "Products" and "Search Suggestions".  This indicates which section this item is for.

## Modify an Item

```javascript
constructorio.modify(
  {
    item_name: "power_drill",
    autocomplete_section: "standard",
    url: "http://www.mysite.com/power_drill",
  },
  function(error, response) {
    console.log(response);
  }
);
```

```shell
curl -X PUT -H "Content-Type: application/json" -d '{"item_name":"power drill","keywords":["concrete","power tools","drills","drywall"],"suggested_score":20,"url":"http://www.mysite.com/power_drill","autocomplete_section":"products_autocomplete"}' \
  -u "[your token]:" "https://ac.constructor.io/v1/item?autocomplete_key=[your_autocomplete_key]"
```

> The above command returns a 204 Success response on success.

To modify an item already in your autocomplete index, use the `PUT /item` call. The `item_name` is required. You can also pass in an optional `suggested_score` between 1-100, which will influence the item's initial ranking relative to other item scores (the higher the score, the higher in the list of suggestions the item will appear). You can also optionally pass in the item's `keywords` to give us more meta information and help us better determine how and where to display the item when autocompleting. If the item should point to a direct link, just pass in that link as a `url`. Finally, if your autocomplete has multiple sections, like categories, search suggestions, and direct links to products, you must specify in which section you are modifying an item. You can do this with the `autocomplete_section` parameter.

Note: modifying an item replaces all meta information, such as keywords, we previously had on the item, but does not update the score unless you provide a new suggested_score.

### HTTP Request

`PUT https://ac.constructor.io/v1/item?autocomplete_key=[your_autocomplete_key]`

### JSON Parameters

Parameter | Required? | Description
--------- | ----------- | ----------
item_name | Yes | The name of the item, as it will appear in the autocomplete suggestions
suggested_score | No | A number between 1-100 that will influence the item's initial ranking relative to other item scores (the higher the score, the higher in the list of suggestions the item will appear)
keywords | No | An array of keywords for this item.  Keywords are useful if you want a product name to appear when a user enters a searchterm that isn't in the product name iteslf.
url | No | A URL to directly send the user after selecting the item
autocomplete_section | No | Your autocomplete suggestions can have multiple sections like "Products" and "Search Suggestions".  This indicates which section this item is for.
