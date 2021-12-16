---
title: Open Data Product Specification | Enabling Data Economy | Data Product Business

language_tabs: # must be one of https://git.io/vQNgJ
  - JSON


toc_footers:
  - <a href='https://www.dataproductbusiness.com/'>Data Product Business</a>
  - License <a href='https://creativecommons.org/licenses/by-sa/4.0/'>CC BY-SA 4.0</a>


includes:
  - pricing
  - pipeline
  - sla
  - license
  - provider
  - extensions
  - terms
  - helloworld
  - contributors

search: true

code_clipboard: true

meta:
  - name: description
    content: Open Data Product Specification
---

# OPEN DATA PRODUCT SPECIFICATION

## Purpose

Technical specification of a machine-readable data product metadata model. It defines the objects and attributes as well as the structure of digital data products. The work is based on existing standards (schema.org), best practices and emerging concepts like Data Mesh. The reasoning is that we reuse and proudly copy instead of reinventing the wheel. The specification is shared under Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) license. 

Open Data Product Specification aims to:

* enable interoperability between organizations, data platforms,  marketplaces, and tools. 
* reduce data product metadata conversions and errors between systems and organizations, 
* increase the speed of designing, testing, and implementing data products. 
* speed up tools development around data product design, development and management.
* enable creation of automated data product deployment with standard methods (DataOps)

**Note!** In the "Open Data Product" focus is on the latter words and the prefix 'open' refers to openness of the standard. Any kind of connotations to open data (different thing) are not intentional, intended or desirable. 

This is work in progress. If you see something missing, described inaccurately or plain wrong, or you want to comment the specification, click the button below and proceed forward. 

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
  "visibility":"private",
  "status":"draft",
  "type":"dataset"
}

```

| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
| **name** **\*** | string | max length 256 chars | The name of the product. |
| **productID** **\*** | string | max length 256 chars | Product identifier. |
| **visibility** **\*** | one of | one of: private, organisation, public | The publicity level eg who can see this product. Private - just the creator. Organisation - visible to all in your organisation. Public - visible to all publicly |
| **status** **\*** | one of | one of: announcement, draft, development, testing, acceptance, production, sunset, retired | The status of the product. Lifecycle model discussed in details in here (link). |
| **type** **\*** | one of |  Options: raw data, derived data, dataset, reports, analytic view, 3D visualisation, algorithm, decision support, automated decision-making, bi-directional | The type of the product. Options are derived from examples and lists found from academic literature  | 


## Optional attributes

> Example of document level attribute usage and structure:

```javascript
"Product": {
  "name":"Pets of the year",
  "productID":"123456are",
  "description":"",
  "visibility":"private",
  "status":"draft",
  "version":"0.1",
  "category":"pets",
  "brandSlogan":"passion for the data monetization",
  "type":"dataset",
  "logo":"https://data-product-business.github.io/open-data-product-spec/images/logo-dps-ebd5a97d.png"
}

```

| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
| valueProposition | string  | text content, max length 512 chars  | This is the product's value proposition. Often one or two sentences and crystallizes the value for the customer. |
| description | string | - | The description of the product. Text only. |
| category| array | - | array of categories |
| version | string | The versioning scheme is **major.minor.**. Examples: 1.0, 2.1, 3.15 | The version of the product. |
| logo | URL | Valid URL | URL of the logo. See more from [wikipedia](https://en.wikipedia.org/wiki/URL). |
| brandSlogan | string | - | Brand related slogan like Nike has *just do it* |

<button data-tf-popup="Q1Zo6wE5" data-tf-iframe-props="title=Customer Feedback Survey" style="all:unset;font-family:Helvetica,Arial,sans-serif;display:inline-block;max-width:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;background-color:#FA6B05;color:#000000;font-size:17px;border-radius:3px;padding:0 28px;font-weight:bold;height:42.5px;cursor:pointer;line-height:42.5px;text-align:center;margin:0;text-decoration:none;">Raise an issue</button><script src="//embed.typeform.com/next/embed.js"></script>