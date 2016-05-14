---
title: Datil API

language_tabs:
  - shell: cURL
  - python: Python
  - csharp: C#

toc_footers:
  - <a href='#'>Sign up for an API key</a>
  - <a href='http://github.com/tripit/slate'>Documentation powered by Slate</a>

includes:
  - en/invoices
  - en/credit-notes
  - en/retentions
  - en/waybills
  - en/debit-notes
  - en/common
  - en/errors
  - en/webhooks

search: true
---

# Introduction

Integrate e-billing into your internet apps. The Datil API allows you to issue electronic documents in Ecuador including: invoices, withholdings, credit notes, debit notes and waybills.

The API is designed around [REST](http://en.wikipedia.org/wiki/Representational_State_Transfer), leveraging standard HTTP verbs and response codes.

Each section of this documentation describes e-billing capabilities available as a resource that you can access via HTTP from any programming language.

Issuing electronic documents is an asynchronous process. This means that although the API responds to your requests immediately, it will execute multiple steps in the background to have your document approved. This process may take up to 5 seconds. Once completed, you can query the status of the document or receive a notification with the result.

## Issuance process

The process includes the following steps:

1. __Creation__: The e-document is persisted for future use.
2. __Signature__: Using a digital certificate, an electronic signature is applied to the e-document according to the cryptographic algorithm specified by each country tax regulations.
3. __Sending__: The e-document is submitted to the country tax authority for authorization.
4. __Authorization Query__: The tax authority service is queried for an authorization response.
5. __Customer notification__: The recipient (customer or supplier) is notified about the new e-document issued. If the authorization fails, the merchant receives a notification detailing the errors. In this case, the receipient does not get notified.

<aside class="notice">
<strong>Remember:</strong> This whole process is executed in the background by Datil after each API request.
</aside>

## Content type

All operations receive and return data in [JSON](http://www.json.org/) format. You must specify the content type when sending POST requests:

`Content-Type: application/json`

# Authentication

To get an API key, sign in to your account at
[app.datil.co](https://app.datil.co) and look for "API key" in "_Configuración_".

<img src="https://s3-us-west-2.amazonaws.com/static-files/datil-py-blurred-api-key.png">

Include your API key as an HTTP header in all your requests:

`X-Key: <your-api-key>`

To issue or re-issue e-documents you need to send your digital certificate password. This password is provided to the account owner at the time of setup.

Include it in every issuance or re-issuance request:

`X-Password: <digital-certificate-password>`

Please, store these credentials in a safe place.
