# Organizations

Any given account can have multiple organizations either by creating them or by being given access to them from other account holders.

This is especially useful when there is a need to manage multiple organizations as they are created for users that might signup to a certain product.

An organization holds a reference to most of the information that is created through the API.

## Create New Organization

```shell
curl "https://api.spaceinvoices.com/v1/accounts/:id/organizations" \
  -H "Authorization: TOKEN" \
  -d name="Space Exploration Technologies corp" \
  -d address="Rocket Road" \
  -d city="Hawthorne" \
  -d zip="CA 90250" \
  -d country="USA" \
  -d IBAN="123454321 123454321" \
  -d bank="Bank Of America"
```
```javascript
spaceInvoices.organizations.create(accountId, {
  name: "Space Exploration Technologies corp",
  address: "Rocket Road",
  city: "Hawthorne",
  zip: "CA 90250",
  country: "USA",
  IBAN: "123454321 123454321",
  bank: "Bank Of America"
})
.then(function(organization) {
  console.log(organization);
})
.catch(function(error) {
  console.error(error);
});
```

> Returns:

```json
{
  "id": "5a3683ea12d5a67dd0ef2f4c",
  "name": "Space Exploration Technologies corp",
  "address": "Rocket Road",
  "city": "Hawthorne",
  "zip": "CA 90250",
  "country": "USA",
  "IBAN": "123454321 123454321",
  "bank": "Bank Of Amerika",
  "_defaults": [
    {
      "name": "image_logo",
      "value": ""
    }, {
      "name": "image_signature",
      "value": ""
    }, {
      "name": "invoice_note",
      "value": "When paying please use reference number [document number].\nPlease transfer the money to bank account [IBAN] open at [bank].\n\nThank you for your business."
    }, {
      "name": "estimate_note",
      "value": "When paying please use reference number [document number].\n
        Please transfer the money to bank account [IBAN] open at [bank]."
    }, {
      "name": "advance_note",
      "value": "Thank you for your payment."
    }, {
      "name": "signature",
      "value": "[organization name]"
    }, {
      "name": "footer",
      "value": "[organization name], [address], [city] [zip], [country]. IBAN: [IBAN] open at [bank]"
    }, {
      "name": "email_reminder",
      "value": "Dear customer,\n\nthis is a friendly reminder that the invoice [document number] is due on [document due].\n\nThank you and best regards,\n[organization name]"
    }, {
      "name": "email_document",
      "value": ""
    }, {
      "name": "currencyId",
      "value": "USD"
    }, {
      "name": "color_main",
      "value": "0082c9"
    }, {
      "name": "invoice_dueDays",
      "value": "30"
    }, {
      "name": "invoice_dueDays",
      "value": "30"
    }
  ],
  "locale": "en",
  "active": true,
  "supportPin": "12345",
  "brand": "space-invoices"
}
```

This endpoint creates a new organization.

### HTTP Request

`POST https://api.spaceinvoices.com/v1/accounts/:id/organizations`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of account. |

#### Arguments

|      |     |
| ---: | --- |
| name **required** | Name of company or other type of organization. |
| address | Street or similar address. |
| address2 | Address line 2. |
| city | City name. |
| zip | Zip / post code. |
| country **required** | ISO 3166 county. [Wikipedia](https://en.wikipedia.org/wiki/ISO_3166-1) _The country parameter is used to apply some smart defaults to the organization being created including default tax rates and texts (both may be effected by taxSubject property in some cases)._ |
| taxSubject _default is *false*_ | Specify if the organization is subject to tax. _Property effects creation of default tax rates and texts._ |
| taxNumber | String VAT / GST / etc. tax identification number. |
| companyNumber | String registration or similar identification number. |
| IBAN | Bank account number. |
| website | Website address. |
| locale _default is *en*_ | ISO 639-1 locale code. [Wikipedia](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) _Effects language of default texts and system messages._ |
| brand _default is *space-invocies*_ | Brand source identification for internal use. |

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |
| id | Unique ID of model instance |
| _defaults | Array of objects. _Collection of organization's default settings._ _Can be used for custom settings._ [toggle definition](#expand) |
| name | Unique (to orgnization) name of setting. |
| value | Value of setting. |
| [](#empty) | |
| active | Boolean indicator if organization is active (enabled). |
| supportPin | 5 digit number used to match organization requesting support. |