## Operations

*   [List Categories](#list-categories)
*   [Get a Category](#get-a-category)
*   [Get a Count of Categories](#get-a-count-of-categories)
*   [Create a Category](#create-a-category)
*   [Update a Category](#update-a-category)
*   [Delete a Category](#delete-a-category)
*   [Delete All Categories](#delete-all-categories)

## List Categories

Gets the list of categories. (Default sorting is by category id, from lowest to highest.)

*   [OAuth](#list-categories-oauth)
>`GET /stores/{store_hash}/v2/categories`
*   [Basic Auth](#list-categories-basic)
>`GET /api/v2/categories`


### Filters

Filter parameters can be added to the URL query string to select specific categories in the collection.

| Parameter | Type | Example |
| --- | --- | --- |
| `parent_id` | string | `/api/v2/categories?parent_id={value}` |
| `name` | string | `/api/v2/categories?name={value}` |
| `is_visible` | string | `/api/v2/categories?is_visible={value}` |
| `min_id` | int | `/api/v2/categories?min_id={value}` |
| `max_id` | int | `/api/v2/categories?max_id={value}` |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 categories are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/categories?page={number}` |
| `Limit` | int | `/api/v2/categories?limit={count}` |

```json
[
  {
    "id": 1,
    "parent_id": 0,
    "name": "Shop Mac",
    "description": "",
    "sort_order": 0,
    "page_title": "",
    "meta_keywords": "",
    "meta_description": "",
    "layout_file": "category.html",
    "parent_category_list": [
      1
    ],
    "image_file": "",
    "is_visible": true,
    "search_keywords": "",
    "url": "/shop-mac/"
  }
]
```

## Get a Category

Gets a single category.

*   [OAuth](#get-a-category-oauth)
>`GET /stores/{store_hash}/v2/categories/{id}`
*   [Basic Auth](#get-a-category-basic)
>`GET /api/v2/categories/{id}`

```json
{
  "id": 10,
  "parent_id": 1,
  "name": "Xmen toys",
  "description": "",
  "sort_order": 2,
  "page_title": "",
  "meta_keywords": null,
  "meta_description": null,
  "layout_file": "category.html",
  "parent_category_list": [
    1,
    10
  ],
  "image_file": "d/apiy2uz6q__69888.jpg",
  "is_visible": true,
  "search_keywords": "",
  "url": "/xmen-toys/"
}
```

## Get a Count of Categories

Gets a count of the total number of categories in the store.

*   [OAuth](#get-a-count-of-categories-oauth)
>`GET /stores/{store_hash}/v2/categories/count`
*   [Basic Auth](#get-a-count-of-categories-basic)
>`GET /api/v2/categories/count`

```json
{
  "count": 10
}
```

## Create a Category

Creates a new category.

*   [OAuth](#create-a-category-oauth)
>`POST /stores/{store_hash}/v2/categories`
*   [Basic Auth](#create-a-category-basic)
>`POST /api/v2/categories`

### Read-only Properties

The following properties of the category are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `parent_category_list`

### Requirements

The following properties of the category are required. The request won’t be fulfilled unless these properties are valid.

*   `name`

### Notes

To maximize system performance, Bigcommerce caps the number of categories that can be added to a store at 16,000. If your POST causes the store to exceed the maximum of 16,000 categories, Bigcommerce will return a 403 error.

In addition, Bigcommerce caps the total number of parent categories at seven. If your `POST` includes the ID of a parent category in the `parent_id` field, Bigcommerce will check that parent category and its parent and so on to determine the total number of parent categories. If your `POST` would cause the total number of parent categories to exceed seven, Bigcommerce will return a 403 error.

```curl
{
  "name": "Xmen toys"
}
```

```json
{
  "id": 10,
  "parent_id": 1,
  "name": "Xmen toys",
  "description": "",
  "sort_order": 2,
  "page_title": "",
  "meta_keywords": null,
  "meta_description": null,
  "layout_file": "category.html",
  "parent_category_list": [
    1,
    10
  ],
  "image_file": "d/apiy2uz6q__69888.jpg",
  "is_visible": true,
  "search_keywords": "",
  "url": "/xmen-toys/"
}
```
## Update a Category

Updates an existing category.

*   [OAuth](#update-a-category-oauth)
>`PUT /stores/{store_hash}/v2/categories/{id}`
*   [Basic Auth](#update-a-category-basic)
>`PUT /api/v2/categories/{id}`

### Read-only Properties

The following properties of the category are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `parent_category_list`

### Requirements

The following properties of the category are required. The request won’t be fulfilled unless these properties are valid.

### Notes

To maximize system performance, Bigcommerce caps the total number of parent categories at seven. If your `PUT` includes the ID of a parent category in the `parent_id` field, Bigcommerce will check the parent and any children of the current category to determine the total number of parent categories. If your `PUT` would cause the total number of parent categories to exceed the maximum of seven, Bigcommerce will return a 403 error.

```json
{
  "id": 10,
  "parent_id": 1,
  "name": "Xmen toys",
  "description": "",
  "sort_order": 2,
  "page_title": "",
  "meta_keywords": null,
  "meta_description": null,
  "layout_file": "category.html",
  "parent_category_list": [
    1,
    10
  ],
  "image_file": "d/apiy2uz6q__69888.jpg",
  "is_visible": true,
  "search_keywords": "",
  "url": "/xmen-toys/"
}
```

## Delete a Category

Deletes a category.


*   [OAuth](#delete-a-category-oauth)
>`DELETE /stores/{store_hash}/v2/categories/{id}`
*   [Basic Auth](#delete-a-category-basic)
>`DELETE /api/v2/categories/{id}`

## Delete All Categories

Deletes all the categories in the store.

*   [OAuth](#delete-all-categories-oauth)
>`DELETE /stores/{store_hash}/v2/categories`
*   [Basic Auth](#delete-all-categories-basic)
>`DELETE /api/v2/categories`

### Notes

>The DELETE all categories operation will not succeed unless the store has zero products. If any products in the store belong to any categories, the entire operation will fail. Therefore, if you really want to delete all the categories of the store, you must first delete all of the products in the store.
