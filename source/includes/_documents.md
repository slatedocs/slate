# Documents

Documents are the most complex part of Space Invoices, they are the core of our service.

We have taken a lot of care to provide developers with a wide array of options when creating different documents, most importantly we allow you to provide as much or as little data as you wish while the API takes care of the rest base on known data like organization settings, country of origin and country of destination.

## Create New Document

```shell
curl "https://api.spaceinvoices.com/v1/organizations/5a3683ea12d5a67dd0ef2f4d/documents" \
  -H "Authorization: TOKEN" \
  -d _documentClient[name]="Rocket Man" \
  -d _documentClient[country]="USA" \
  -d _documentItems[0][name]="Space suit" \
  -d _documentItems[0][quantity]=2 \
  -d _documentItems[0][unit]="Item" \
  -d _documentItems[0][price]="1000"
```
```javascript
spaceInvoices.documents.create(organization.id, {
  _documentClient: {
    name: "Rocket Man",
    country: "USA"
  },
  _documentItems: [
    {
      name: "Space suit",
      quantity: 2,
      unit: "Item",
      price: 1000
    }
  ]
})
.then(function(document) {
  console.log(document);
})
.catch(function(error) {
  console.error(error);
})
```
> Returns:

```json
{
  "id": "5a3683ea12d5a67dd0ef2f4c",
  "organizationId": "5a3683ea12d5a67dd0ef2f4d",
  "number": "2018-00001",
  "type": "invoice",
  "date": 2018-01-31,
  "dateService": 2018-01-31,
  "dateDue": 2018-02-31,
  "currencyId": "USD",
  "draft": false,
  "canceled": false,
  "sentEmail": false,
  "_documentIssuer": {
    "name": "Space Exploration Techologies corp",
    "address": "Rocket Road",
    "city": "Hawthorne",
    "zip": "CA 90250",
    "country": "USA",
    "IBAN": "123454321 123454321",
    "bank": "Bank Of Amerika"
  },
  "clientId": "5a3683ea12d5a67dd0ef2f4d",
  "_documentClient": {
    "name": "Rocket Man",
    "country": "USA"
  },
  "_documentItems": [{
    "id": "5a3683ea12d5a67dd0ef2f4e",
    "name": "Space suit",
    "quantity": 1,
    "unit": "Item",
    "discount": 0,
    "price": 1000,
    "total": 2000,
    "totalWithTax": 2000,
    "totalDiscount": 0,
    "_documenItemTaxes": []
  }],
  "note": "When paying please use reference number [document number].\nPlease transfer the money to bank account [IBAN] open at [bank].\n\nThank you for your business.",
  "signature": "[company name]",
  "footer": "[organization name], [address], [city] [zip], [country]. IBAN: [IBAN] open at [bank]",
  "_documentTaxes": [],
  "_documentReverseTaxes": [],
  "total": 2000,
  "totalDiscount": 0,
  "totalWithTax": 2000,
  "totalPaid": 0,
  "paidInFull": false,
  "_comments": [],
  "createdAt": 2018-01-31T01:20:11.999Z
}
```

This endpoint creates a new document for given organization.

_This example shows the process of creating an `invoice` providing minimum data._

### HTTP Request

`POST https://api.spaceinvoices.com/v1/organizations/:id/documents`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Organization. |

#### Attributes

|      |     |
| ---: | --- |
| number _default is *YYYY-0000n+1*_ | String, unique (to Document type and Organization) Document number. _Auto populated with next number based on document type._ |
| type _default is *invoice*_ | Type of document (`invoice`, `estimate` or `advance` ). _Determines type of document, note that different document types contain different properties, rules and funcionalities. For example `invoice` can have Payments logged and contains `dateService` property. Document type cannot be switched once set to instance._ |
| draft _default is *false*_ | Boolean, if invoice a draft. _If set to `true` the property cannot go back to `false`. Only present if `type` is `invoice`._ |
| date _default is *today*_ | Javascript date, date of Document. _Represents date the Document was issued. Time is trimmed._ |
| dateDue _default is *today + default due days*_ | Javascript date, date invoice is due. _Auto populated using Organization's default due days from today. Only present on `type` invoice. Time is trimmed._ |
| dateService | Javascript date, date service was started or conducted. _Only present on `type` invoice. Time is trimmed._ |
| dateServiceTo | Javascript date, date service period ends. _Only present on `type` invoice. Time is trimmed._ |
| currencyId | ISO 4217 currency code. [Wikipedia](https://en.wikipedia.org/wiki/ISO_4217) _If not provided the Organization's default currency is used._ |
| clientId | ID reference to Organization's Client. _If provided `_documentClient` object gets populated using referenced Client._ |
| _documentClient | Object containting client data. _Property is optional if `clientId` is provided._ _Any key defined in object will be used instead of loaded client data._ _If `clientId` is not provided the data in object is saved to Organization's Clients and referenced in document ie. the `clientId` is auto populated._ [toggle definition](#expand) |
| name **required** | Name of client. _Required only if `clientId` not provided on Document._ |
| address | Address of Client. |
| address2 | Address line 2 of Client. |
| city | City of Client. |
| zip | Zip / postal code of Client. |
| country | Country of Client. |
| companyNumber | String, organization registration or similar number of Client. |
| taxNumber | String, organization VAT / GST or similar tax number of Client. |
| [](#empty) | |
| _documentIssuer | Object containting issuer data. _Property is automatically populated with Organization data._ _Any key that is provided in object is used instead._ [toggle definition](#expand) |
| name | Name of issuer. |
| address | Address of issuer. |
| address2 | Address line 2 of issuer. |
| city | City of issuer. |
| zip | Zip / postal code of issuer. |
| country | Country of issuer. |
| companyNumber | String, organization registration or similar number of issuer. |
| taxNumber | String, organization VAT / GST or similar tax number of issuer. |
| IBAN | Bank account number of issuer. |
| bank | Bank of issuer. |
| website | Website address of issuer. |
| [](#empty) | |
| _documentItems **required** | Collection of objects containing document line items. [toggle definition](#expand) |
| itemId | ID reference to Organization's item. _If provided the item properties are populated from referenced item._ _Any key that is provided will is used instead._ |
| name **required** | Name of item. _Optional if `isSeparator` is set to `true`._ |
| description | Description of item. |
| quantity | Number, quantity of items. |
| unit | Unit of measurement for item ie. Item / Service / Meter / etc. |
| price | Number, price per single item. |
| _documentItemTaxes | Collection of objects containing item taxes. [toggle definition](#expand-inner) |
| taxId | ID reference to Organization's Tax. _If provided `rate`, `recoverable` and `compund` are auto populated. Note that the `rate` is chosen based on `date` property of document if Tax has multiple valid rates._ |
| rate | Number, tax rate percent. |
| recoverable | Boolean if tax is recoverable. |
| reverseCharged | Boolean if tax is reverse (self) charged. _Reverse charged tax is not applied to totals and is added to document's revese taxes collection._ |
| compound | Boolean if tax is compound. _Compund tax is added on top of all other taxes applied to item._ |
| [](#empty-inner) | |
| isSepatator _default is *false*_ | Boolean, indicates if item is separator. _Used for visually seaprating line items and naming groups of line items._ _If `true` all properties except `name` and `description` are ignored._ |
| [](#empty) | |
| note | Text note for Document. _Populated with Organizaion default if not provided. May contain shortcode notations which get parsed to data on PDF or when `parseForDisplay` flag is provided._ |
| signature | Text signature for Document. _Populated with Organizaion default if not provided. May contain shortcode notations which get parsed to data on PDF or when `parseForDisplay` flag is provided._ |
| footer | Text footer for Document. _Populated with Organizaion default if not provided. May contain shortcode notations which get parsed to data on PDF or when `parseForDisplay` flag is provided._ |
| decimalPlaces _default is *4*_ | Number of decimal places the Document items are trimmed and rounded to in calculations. _Should be 4 in most cases._ |

### HTTP Response

#### Attributes

|      |     |
| ---: | --- |
| id | Unique ID of model instance. |
| organizationId | ID of related organization. |
| canceled | Boolean, is invoice canceled. _Only present if Document type is invoice._ |
| sentEmail | Boolean, has Document been ever sent by email. |
| sentSnailMail | Boolean, has Document been ever sent by regular post. |
| _documentItems | Array of objects containing Document items. [toggle definition](#expand) |
| total | Number, total price of Document item including quantity and discount. _Excludes taxes._ |
| totalTax | Number, total value of tax on Document item including quantity, discount and taxes. |
| totalWithTax | Number, total price of Document item including quantity, discount and taxes. |
| totalDiscount | Number, total discount of Document item including quantity. |
| [](#empty) | |
| _documentTaxes | Array of objects containing unique Taxes and their amount present on Document. [toggle definition](#expand) |
| tax | Number, Tax rate percent. |
| base | Total value used to calculate given Tax. |
| totalTax | Total value of given Tax on Document. |
| [](#empty) | |
| _documentReverseTaxes | Array of objects containing unique reverse (self) Taxes and their amount present on Document. [toggle definition](#expand) |
| tax | Number, Tax rate percent. |
| base | Total value used to calculate given Tax. |
| totalTax | Total value of given Tax on Document. |
| [](#empty) | |
| total | Number, Document total including all Item totals, excluding Taxes. |
| totalDiscount | Number, total value of all discounts applied to Document. |
| totalWithTax | Number, Document total of all Items including Taxes. |
| totalPaid | Number, total amount of payments logged for invoice. _Only present if `type` is `invoice`._ |
| paidInFull | Boolean, if Document's logged payments amount to at least it's totalWithTax amount or more. _Only present if `type` is `invoice`._ |
| hasUnit | Boolean, if Document contains at least one Document item with `unit` set. _Used internaly to more easily determine if unit column needs to be displayed when rendering Document view. Only present if `type` is `invoice`._ |
| _comments | Array of objects containing user comments on Document. |
| createAt | Timestamp of model instance creation. |

## List documents

```shell
curl "https://api.spaceinvoices.com/v1/organizations/5a3683ea12d5a67dd0ef2f4d/documents?filter[where][type]=invoice" \
  -H "Authorization: TOKEN"
```
```javascript
var queryParams = {
  filter: {
    where: {
      type: "invoice",
    }
  }
}

spaceInvoices.documents.list(organizationId, queryParams)
.then(function(documents) {
  console.log(documents);
})
.catch(function(error) {
  console.error(error);
});
```
> Returns:

```json
[
  {
    "id": "5a3683ea12d5a67dd0ef2f4c",
    "organizationId": "5a3683ea12d5a67dd0ef2f4d",
    "number": "2018-00001",
    "type": "invoice",
    "date": 2018-01-31,
    "dateService": 2018-01-31,
    "dateDue": 2018-02-31,
    "currencyId": "USD",
    "draft": false,
    "canceled": false,
    "sentEmail": false,
    "_documentIssuer": {
      "name": "Space Exploration Techologies corp",
      "address": "Rocket Road",
      "city": "Hawthorne",
      "zip": "CA 90250",
      "country": "USA",
      "IBAN": "123454321 123454321",
      "bank": "Bank Of Amerika"
    },
    "clientId": "5a3683ea12d5a67dd0ef2f4d",
    "_documentClient": {
      "name": "Rocket Man",
      "country": "USA"
    },
    "_documentItems": [{
      "id": "5a3683ea12d5a67dd0ef2f4e",
      "name": "Space suit",
      "quantity": 1,
      "unit": "Item",
      "discount": 0,
      "price": 1000,
      "total": 2000,
      "totalWithTax": 2000,
      "totalDiscount": 0,
      "_documenItemTaxes": []
    }],
    "note": "When paying please use reference number 2018-00001.\nPlease transfer the money to bank account 123454321 123454321 open at Bank Of America.\n\nThank you for your business.",
    "signature": "Space Exploration Technologies corp",
    "footer": "Space Exploration Technologies corp, Rocket Road, Hawthorne CA 90250, USA. IBAN: 123454321 123454321 open at Bank Of America",
    "_documentTaxes": [],
    "_documentReverseTaxes": [],
    "total": 2000,
    "totalDiscount": 0,
    "totalWithTax": 2000,
    "totalPaid": 0,
    "paidInFull": false,
    "_comments": [],
    "createdAt": 2018-01-31T01:20:11.999Z
  }
]
```

This endpoint return a list of all Organization's documents optionaly filtered if latter are passed in query params.

### HTTP Request

`GET https://api.spaceinvoices.com/v1/organizations/:id/documents`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of organization. |
| filter | Object containing query filters. See [Filters](#filters) section for more details. |
| parseShortcodes _default is *true*_ | Boolean, if shortcodes in `note`, `signature` and `footer` should be parsed to their respective values. |

## Get Document by ID

```shell
curl "https://api.spaceinvoices.com/v1/documents/5a3683ea12d5a67dd0ef2f4c" \
  -H "Authorization: TOKEN"
```
```javascript
spaceInvoices.documents.getById(documentId, queryParams)
.then(function(document) {
  console.log(document);
})
.catch(function(error) {
  console.error(error);
})
```

> Returns:

```json
{
  "id": "5a3683ea12d5a67dd0ef2f4c",
  "organizationId": "5a3683ea12d5a67dd0ef2f4d",
  "number": "2018-00001",
  "type": "invoice",
  "date": 2018-01-31,
  "dateService": 2018-01-31,
  "dateDue": 2018-02-31,
  "currencyId": "USD",
  "draft": false,
  "canceled": false,
  "sentEmail": false,
  "_documentIssuer": {
    "name": "Space Exploration Techologies corp",
    "address": "Rocket Road",
    "city": "Hawthorne",
    "zip": "CA 90250",
    "country": "USA",
    "IBAN": "123454321 123454321",
    "bank": "Bank Of Amerika"
  },
  "clientId": "5a3683ea12d5a67dd0ef2f4d",
  "_documentClient": {
    "name": "Rocket Man",
    "country": "USA"
  },
  "_documentItems": [{
    "id": "5a3683ea12d5a67dd0ef2f4e",
    "name": "Space suit",
    "quantity": 1,
    "unit": "Item",
    "discount": 0,
    "price": 1000,
    "total": 2000,
    "totalWithTax": 2000,
    "totalDiscount": 0,
    "_documenItemTaxes": []
  }],
  "note": "When paying please use reference number 2018-00001.\nPlease transfer the money to bank account 123454321 123454321 open at Bank Of America.\n\nThank you for your business.",
  "signature": "Space Exploration Technologies corp",
  "footer": "Space Exploration Technologies corp, Rocket Road, Hawthorne CA 90250, USA. IBAN: 123454321 123454321 open at Bank Of America",
  "_documentTaxes": [],
  "_documentReverseTaxes": [],
  "total": 2000,
  "totalDiscount": 0,
  "totalWithTax": 2000,
  "totalPaid": 0,
  "paidInFull": false,
  "_comments": [],
  "createdAt": 2018-01-31T01:20:11.999Z
}
```

This endpoint return a document by it's ID.

### HTTP Request

`GET https://api.spaceinvoices.com/v1/documents/:id`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of document. |
| filter | Object containing query filters. See [Filters](#filters) section for more details. |
| parseShortcodes _default is *true*_ | Boolean, if shortcodes in `note`, `signature` and `footer` should be parsed to their respective values. |

## Edit document
<!-- TODO: Edit document -->

## Delete document
<!-- TODO: Delete document -->
