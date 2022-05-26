## Email Settings

<!-------------------- LIST EMAIL SETTINGS -------------------->

### List email settings

`GET /email_settings`

```shell
# Retrieve email settings
curl "https://cloudmc_endpoint/api/v2/email_settings" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "mailgunPrivateKey": "VALIDPRIVATEKEY",
      "smtpHost": "valid.host",
      "smtpFromAddress": "valid.address@domain.com",
      "smtpUsername": "valid.username@gmail.com",
      "organization": {
          "id": "fb1b2caf-4ca4-4c45-b094-faa84bdabc47"
      },
      "smtpPort": 2,
      "mailgunDomain": "valid.mailgun.domain",
      "smtpPassword": "coolPassword",
      "smtpUseSsl": false,
      "id": "dc30f9a6-1edc-11eb-92b6-0242ac120003"
    }
  ]
}
```
List the email settings configured for the organization.

Query Params | &nbsp;
---- | -----------
`organization_id`<br/>*UUID* | Return only the settings for the provided organization id. If not provided, will default to the user's organization.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured email settings' id.
`organization.id`<br/>*UUID* | The organization id that the email settings are linked to.
`smtpHost`<br/>*string* | Hostname or IP address of your SMTP mail server (e.g. smtp.yourcompany.com).
`smtpFromAddress`<br/>*string* | Email address used in the 'sender address' (or 'from') field.
`smtpUsername`<br/>*string* | If your SMTP host requires authentication, specify the username of these authentication credentials here.
`smtpPassword`<br/>*string* | If your SMTP host requires authentication, specify the password associated with the username you specified.
`smtpPort`<br/>*integer* | SMTP port number, usually 25 for SMTP or 465 for SMTPS.
`smtpUseSsl`<br/>*boolean* | Set to true if your SMTP host uses the SSL protocol.
`mailgunDomain`<br/>string* | Domain name for the MailGun service.
`mailgunPrivateKey`<br/>*string* | Private key for the MailGun service.

<!-------------------- GET EMAIL SETTINGS -------------------->

### Retrieve email settings

`GET /email_settings/:id`

```shell
# Retrieve knowledge base
curl "https://cloudmc_endpoint/api/v2/email_settings/dc30f9a6-1edc-11eb-92b6-0242ac120003" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": {
    "mailgunPrivateKey": "VALIDPRIVATEKEY",
    "smtpHost": "valid.host",
    "smtpFromAddress": "valid.address@domain.com",
    "smtpUsername": "valid.username@gmail.com",
    "organization": {
      "id": "fb1b2caf-4ca4-4c45-b094-faa84bdabc47"
    },
    "smtpPort": 2,
    "mailgunDomain": "valid.mailgun.domain",
    "smtpPassword": "coolPassword",
    "smtpUseSsl": false,
    "id": "dc30f9a6-1edc-11eb-92b6-0242ac120003"
  }
}
```
Retrieve the email settings associated to the email settings id.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured email settings' id.
`organization.id`<br/>*UUID* | The organization id that the email settings are linked to.
`smtpHost`<br/>*string* | Hostname or IP address of your SMTP mail server (e.g. smtp.yourcompany.com).
`smtpFromAddress`<br/>*string* | Email address used in the 'sender address' (or 'from') field.
`smtpUsername`<br/>*string* | If your SMTP host requires authentication, specify the username of these authentication credentials here.
`smtpPassword`<br/>*string* | If your SMTP host requires authentication, specify the password associated with the username you specified.
`smtpPort`<br/>*integer* | SMTP port number, usually 25 for SMTP or 465 for SMTPS.
`smtpUseSsl`<br/>*boolean* | Set to true if your SMTP host uses the SSL protocol.
`mailgunDomain`<br/>string* | Domain name for the MailGun service.
`mailgunPrivateKey`<br/>*string* | Private key for the MailGun service.


<!-------------------- UPDATE EMAIL SETTINGS -------------------->

### Update email settings

`PUT /email_settings/:id`

```shell
# Updates an existing email settings for an organization
curl -X PUT "https://cloudmc_endpoint/api/v2/email_settings/dc30f8f7-1edc-11eb-92b6-0242ac120003 \
   -H "MC-Api-Key: your_api_key"
   -H "Content-Type: application/json" \
   -d "request-body"
```

> Request body example:

```json
{
  "organization": {
    "id": "ce77d759-c015-4a92-b594-3f7119867e1f"
  },
  "mailgunPrivateKey": "VALIDPRIVATEKEY",
  "smtpHost": "valid.host",
  "smtpFromAddress": "valid.address@domain.com",
  "smtpUsername": "valid.username@gmail.com",
  "smtpPort": 2,
  "mailgunDomain": "valid.mailgun.domain",
  "smtpPassword": "coolPassword",
  "smtpUseSsl": false,
  "id": "dc30f8f7-1edc-11eb-92b6-0242ac120003"
}
```
> The above command return JSON structured like this:

```json
{
  "data": {
    "mailgunPrivateKey": "VALIDPRIVATEKEY",
    "smtpHost": "valid.host",
    "smtpFromAddress": "valid.address@domain.com",
    "smtpUsername": "valid.username@gmail.com",
    "organization": {
      "id": "ce77d759-c015-4a92-b594-3f7119867e1f"
    },
    "smtpPort": 2,
    "mailgunDomain": "valid.mailgun.domain",
    "smtpPassword": "coolPassword",
    "smtpUseSsl": false,
    "id": "dc30f8f7-1edc-11eb-92b6-0242ac120003"
  }
}
```

Updates the email settings of an organization.

Required | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured email settings' id.
`organization.id`<br/>*UUID* | The organization id that the email settings are linked to. It cannot be changed.

Optional | &nbsp;
---------- | -----------
`smtpHost`<br/>*string* | Hostname or IP address of your SMTP mail server (e.g. smtp.yourcompany.com).
`smtpFromAddress`<br/>*string* | Email address used in the 'sender address' (or 'from') field.
`smtpUsername`<br/>*string* | If your SMTP host requires authentication, specify the username of these authentication credentials here.
`smtpPassword`<br/>*string* | If your SMTP host requires authentication, specify the password associated with the username you specified.
`smtpPort`<br/>*integer* | SMTP port number, usually 25 for SMTP or 465 for SMTPS.
`smtpUseSsl`<br/>*boolean* | Set to true if your SMTP host uses the SSL protocol.
`mailgunDomain`<br/>string* | Domain name for the MailGun service.
`mailgunPrivateKey`<br/>*string* | Private key for the MailGun service.
