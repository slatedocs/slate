#<a name="accounting-subcategories-section"></a> Accounting subcategories

## Attributes

Attr. name |  Constraints
---------- |  -----------
suffix | REQUIRED. Must be unique within an accounting category
name | REQUIRED

## Relationships

Relationship name | Constraints
----------------- | -----------
accounting_category | REQUIRED

## Listing accounting subcategories

> Example request

```shell
curl "https://getquipu.com/accounting_subcategories" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

> Example response

```shell
{
  "data": [{
    "id": "19482",
    "type": "accounting_subcategories",
    "attributes": {
      "name": "Oficina",
      "suffix": 1
    },
    "relationships": {
      "accounting_category": {
        "data": {
          "id": "43",
          "type": "accounting_categories"
        }
      }
    }
  }, {
    "id": "19483",
    "type": "accounting_subcategories",
    "attributes": {
      "name": "Raw",
      "suffix": 2
    },
    "relationships": {
      "accounting_category": {
        "data": {
          "id": "43",
          "type": "accounting_categories"
        }
      }
    }
  }, {

  ...

  }]
}
```

`GET /accounting_subcategories`

### Available filters

You can filter accounting subcategories by its accounting category id by passing an array of comma separated ids, for example `GET /accounting_subcategories?filter[accounting_category_id]=43,44,48`.

## Getting an accounting subcategory

> Example request

```shell
curl "https://getquipu.com/accounting_subcategories/19482" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

> Example response

```shell
{
  "data": {
    "id": "19482",
    "type": "accounting_subcategories",
    "attributes": {
      "name": "Oficina",
      "suffix": 1
    },
    "relationships": {
      "accounting_category": {
        "data": {
          "id": "43",
          "type": "accounting_categories"
        }
      }
    }
  }
}
```

`GET /accounting_subcategories/:accounting_subcategory_id`

## Creating an accounting subcategory

> Example request

```shell
curl "https://getquipu.com/accounting_subcategories" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json" \
  -H "Content-Type: application/vnd.quipu.v1+json" \
  -d '{
        "data": {
          "type": "invoices",
          "attributes": {
            prefix: 2,
            name: "Vestuario"
          },
          "relationships": {
            "accounting_category": {
              "data" {
                id: 43,
                type: "accounting_categories"
              }
            }
          }
        }
      }'
```

`POST /accounting_subcategories`

## Updatinig an accounting subcategory

> Example request

```shell
curl "https://getquipu.com/accounting_subcategories/19482" \
  -X PATCH
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json" \
  -H "Content-Type: application/vnd.quipu.v1+json" \
  -d '{
        "data": {
          "type": "invoices",
          "attributes": {
            name: "Transporte"
          }
        }
      }'
```

`(PUT|PATCH) /accounting_subcategories/:accounting_subcategory_id`

## Deleting an accounting category

> Example request

```shell
curl "https://getquipu.com/accounting_subcategories/19482" \
  -X DELETE
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json" \
```

`DELETE /accounting_subcategories/:accounting_subcategory_id`
