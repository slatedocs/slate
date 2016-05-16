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

Issuing electronic documents (e-documents) is an asynchronous process. This means that although the API responds to your requests immediately, it will execute multiple steps in the background to have your e-document authorized. This process may take up to 5 seconds. Once completed, you can query the status of the document or receive a notification with the result.

## Issuance process

The following steps are executed by Datil:

1. __Creation__: The e-document is persisted for future reference.
2. __Signature__: Using the merchant digital certificate, the e-document is electronically signed in compliance with the [XAdES](https://www.w3.org/TR/XAdES/) standard and each tax authority data formats.
3. __Sending__: The e-document is submitted to the tax authority web service for authorization.
4. __Authorization Query__: Datil queries the tax authority web service for an authorization response.
5. __Customer notification__: An email notification is sent to the e-document recipient. If the authorization fails, the issuer receives an email brief of the errors and the recipient is not notified.

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
