#<a name="accounting-categories-section"></a> Accounting categories

## Attributes

Attr. name |  Constraints
---------- |  -----------
prefix | READ ONLY
name | READ ONLY
kind | READ ONLY. `income`, `expenses` or `assets`

<aside class="notice">
  Please note that the accounting categories' ID is not the same as the accounting number. At Quipu we use several accounting books,
  so two different categories can have the same accounting number if they belong to different accounting books.
  In order to identify an accounting category, like when you are about to create an invoice, please always use its ID.
</aside>

## Listing accounting categories

> Example request

```shell
curl "https://getquipu.com/accounting_categories" \
  -H "Authorization: Bearer 818abe1ea4a1813999a47105892d50f3781320c588fb8cd2927885963e621228" \
  -H "Accept: application/vnd.quipu.v1+json"
```

> Example response

```shell
{
  "data": [{
    "id": "234",
    "type": "accounting_categories",
    "attributes": {
      "name": "Gastos de investigación",
      "prefix": 200,
      "kind": "assets"
    }
  }, {
    "id": "235",
    "type": "accounting_categories",
    "attributes": {
      "name": "Desarrollo",
      "prefix": 201,
      "kind": "assets"
      }
  }, {
    "id": "236",
    "type": "accounting_categories",
    "attributes": {
      "name": "Concesiones administrativas",
      "prefix": 202,
      "kind": "assets"
    }
  }, {
    "id": "237",
    "type": "accounting_categories",
    "attributes": {
      "name": "Propiedad industrial",
      "prefix": 203,
      "kind": "assets"
    }
  }, {
    "id": "238",
    "type": "accounting_categories",
    "attributes": {
      "name": "Fondo de comercio",
      "prefix": 204,
      "kind": "assets"
    }
  }, {
    "id": "239",
    "type": "accounting_categories",
    "attributes": {
      "name": "Derechos de traspaso",
      "prefix": 205,
      "kind": "assets"
    }
  },

  ...

}
```

`GET /accounting_categories`

### Available filters

Filter name | Description | Valid values | Example
------------| ------------| ------------ | -------
kind | Filter resources by kind | `expenses`, `income`, or `assets` | `/accounting_categories?filter[kind]=expenses`
prefix | filter categories with the given accounting numbers | List of prefixes separated by comma | `/accounting_categories?filter[prefix]=601,603,608`


## Getting an accounting category

> Example request

```shell
curl "https://getquipu.com/accounting_categories/132" \
  -H "Authorization: Bearer 818abe1ea4a1813999a47105892d50f3781320c588fb8cd2927885963e621228" \
  -H "Accept: application/vnd.quipu.v1+json"
```

> Example response

```shell
{
  "data": [{
    "id": "132",
    "type": "accounting_categories",
    "attributes": {
      "name": "Ventas de mercaderías",
      "prefix": 700,
      "kind": "income"
    }
  }
}
```

`GET /accounting_categories/:accounting_category_id`
