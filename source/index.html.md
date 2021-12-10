---
title: Open Data Product Specification by Data Product Business

language_tabs: # must be one of https://git.io/vQNgJ
  - JSON
  - XML


toc_footers:
  - <a href='https://www.dataproductbusiness.com/'>Data Product Business</a>
  - License <a href='https://creativecommons.org/licenses/by-sa/4.0/'>CC BY-SA 4.0</a>


includes:
  - pricing
  - pipeline
  - sla
  - license
  - provider
  - helloworld

search: true

code_clipboard: true

meta:
  - name: description
    content: Open Data Product Specification
---

# OPEN DATA PRODUCT SPECIFICATION

## Purpose

Technical specification of a machine-readable data product metadata model. It defines the objects and attributes as well as the structure of digital data products. The work is based on existing standards and best practices. For is example schema.org definitions are used whenever it makes sense. The reasoning is that we reuse and proudly copy instead of reinventing the wheel. The specification is shared under Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) license. 

Open Data Product Specification aims to:

* enable interoperability between organizations, data platforms,  marketplaces, and tools. 
* reduce data product metadata conversions and errors between systems and organizations, 
* increase the speed of designing, testing, and implementing data products. 
* enable creation of automated data product deployment with standard methods (DataOps)

Just like Data Product in Data Mesh concept, Open Data Product dessribes..... self-sovereign 

**Note!** In the "Open Data Product" focus is on the latter words and the prefix 'open' refers to openness of the standard. Any kind of connotations to open data (different thing) are not intentional, intended or desirable. 

This is work in progress. If you see something missing, described inaccurately or plain wrong, or you want to comment the specification, click the button below and proceed forward. 

<button data-tf-popup="Q1Zo6wE5" data-tf-iframe-props="title=Customer Feedback Survey" style="all:unset;font-family:Helvetica,Arial,sans-serif;display:inline-block;max-width:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;background-color:#FA6B05;color:#000000;font-size:17px;border-radius:3px;padding:0 28px;font-weight:bold;height:42.5px;cursor:pointer;line-height:42.5px;text-align:center;margin:0;text-decoration:none;">Raise an issue</button><script src="//embed.typeform.com/next/embed.js"></script>

## What is a data product?

As a strategic resource for companies, data is considered an asset that, like any other material good, has a financial
value and whose management generates costs. Data created, collected or used in individual business processes can be sold to other organisations as raw or processed data, so that it no longer serves as an enabler of products, but is the product itself. This leads to the paradigm that data assets can be monetised by exchanging and trading data between organisations as data products and services. 

There are multiple definitions for data product, but in this specification we adopt Simon O'Regan's definition as *a product whose primary objective is to use data to facilitate and end goal*. 

While many of the standard Product Development Rules apply — solve a customer need, learn from feedback, prioritise relentlessly, etc. — data has different characteristics compared to tangible products that prevent the direct transfer of established processes and rules of trading goods, especially in terms of pricing mechanisms.

In trading data, there is less willingness to pay. For example, data buyers often do not recognise the potential value of data items because it cannot be fully disclosed prior to purchase (known as the ‘Arrow paradox’). 

In addition, there is often a lack of notion that the creation, processing, storage and distribution of high-quality data is a major cost factor for the data provider. Another obstacle is the lack of trust and security causing potential data providers to fear that competitors could benefit from disclosure of in-house data.

One of the aims of this specification is to tackle above mentioned issues which hinder the growth of data ecosystem and market volatility. 

<button data-tf-popup="Q1Zo6wE5" data-tf-iframe-props="title=Customer Feedback Survey" style="all:unset;font-family:Helvetica,Arial,sans-serif;display:inline-block;max-width:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;background-color:#FA6B05;color:#000000;font-size:17px;border-radius:3px;padding:0 28px;font-weight:bold;height:42.5px;cursor:pointer;line-height:42.5px;text-align:center;margin:0;text-decoration:none;">Raise an issue</button><script src="//embed.typeform.com/next/embed.js"></script>

## Document structure

**LEFT COLUMN: Navigation**

The left column is navigation which enables fluent and easy movement around the specification. 

**MIDDLE COLUMN: Principles and components**

The middle column contains detailed information about the included components and related options. This is the theory part. 

Note! Mandatory elements and attributes are marked with **bold names** and **\*** in the definition tables. https://schema.org provided ready-made definitions are applied when ever possible instead of re-inventing the wheel. 

**RIGHT COLUMN: Examples**

The right column contains JSON formatted examples of how the specification is used. In the future other output formats are added on request basis. 

> Example of JSON formatted snippet from the Open Data Product specification:

```javascript
"monitoring": {

  "url": "https://monitoring.com"
}
```

<aside class="notice">
The JSON examples are not based on any real data product, but exemplify the usage of Open Data Product Specification. 

</aside>


# Document level attributes

Here's the list of attributes which can occur at the document root level. Mandatory attributes are listed in separate table and marked with **bolded names** and asterix **\***. Next to the mandatory attributes is an example. The same logic applies to the optional attributes as well. Optional attributes are listed in own table and examples are given on the right column. 

## Mandatory attributes

> Example of document level attribute usage and structure:

```javascript
"Product": {
  "name":"Pets of the year",
  "productID":"123456are",
  "description":"",
  "visibility":"private",
  "status":"draft",
  "version":"0.1",
  "category":"",
  "logo":"https://data-product-business.github.io/open-data-product-spec/images/logo-dps-ebd5a97d.png"
}

```

| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
| **valueProposition** **\*** | string  | text content, max length 512 chars  | This is the product's value proposition. Often one or two sentences and crystallizes the value for the customer. |
| **name** **\*** | string | max length 256 chars | The name of the product. |
| **productID** **\*** | string | max length 256 chars | Product identifier. |
| **description** **\*** | string | - | The description of the product. Text only. |
| **visibility** **\*** | one of | one of: private, organisation, public | The publicity level eg who can see this product. Private - just the creator. Organisation - visible to all in your organisation. Public - visible to all publicly |
| **status** **\*** | one of | one of: announcement, draft, development, testing, acceptance, production, retired | The status of the product. Lifecycle model discussed in details in here (link). |
| **version** **\*** | string | The versioning scheme is **major.minor.**. Examples: 1.0, 2.1, 3.15 | The version of the product. |
| **logo** **\*** | URL | - | URL of the logo. See more from [wikipedia](https://en.wikipedia.org/wiki/URL). |

<button data-tf-popup="Q1Zo6wE5" data-tf-iframe-props="title=Customer Feedback Survey" style="all:unset;font-family:Helvetica,Arial,sans-serif;display:inline-block;max-width:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;background-color:#FA6B05;color:#000000;font-size:17px;border-radius:3px;padding:0 28px;font-weight:bold;height:42.5px;cursor:pointer;line-height:42.5px;text-align:center;margin:0;text-decoration:none;">Raise an issue</button><script src="//embed.typeform.com/next/embed.js"></script>