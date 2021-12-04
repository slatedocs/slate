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

# Open Data Product Specification

## Purpose

Technical specification of a machine-readable data product metadata model, which enables interoperability between operators, data platforms, marketplaces, and tools. Additional purpose is to reduce data model conversions between systems and organisatons, increase the speed of designing, testing and implementing data products. The specification is shared under Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) license. 

**Note!** In the "Open Data Product" focus is on the latter words and the prefix 'open' refers to openness of the standard. Any kind of connotations to open data (different thing) are not intentional, intended or desirable. 

This is work in progress. 

## Structure

**Left column: Navigation**

The left column is navigation which enables fluent and easy movement around the specification. 

**Middle column: Principles and components**

The middle column contains detailed information about the included components and related options. This is the theory part. 

Note! Mandatory elements and attributes are marked with **bold names** and **\*** in the definition tables. https://schema.org provided ready-made definitions are applied when ever possible instead of re-inventing the wheel. 

**Right column: Examples**

The right column contains JSON formatted examples of how the specification is used. 

> Example of JSON formatted snippet from the Open Data Product specification:

```javascript
"monitoring": {

  "url": "https://monitoring.com"
}
```

<aside class="notice">
The JSON examples are not based on any real data product, but exemplify the usage of Open Data Product Specification. 

</aside>


