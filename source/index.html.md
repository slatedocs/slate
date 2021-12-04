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
  - quality
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

Technical specification of a machine-readable data product metadata model, which enables interoperability between operators, data platforms, marketplaces, and tools. Additional purpose is to reduce data model conversions between systems and organisatons, increase the speed of designing, testing and implementing data products. The specification is shared under Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) license. 

**Note!** In the "Open Data Product" focus is on the latter words and the prefix 'open' refers to openness of the standard. Any kind of connotations to open data (different thing) are not intentional, intended or desirable. 

This is work in progress. If you see something missing, described inaccurately or plain wrong, or you need other comment the specification, click the button below and proceed forward. 

<button class="button-5" role="button">Raise an issue</button>


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
   .....
```

| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
| **valueProposition** **\*** | string  | text content, max length 512 chars  | This is the product's value proposition. Often one or two sentences and crystallizes the value for the customer. |
|  |  |  |  |

<button class="button-5" role="button">Raise an issue</button>