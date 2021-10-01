# Data Model

## Overview

The three top-level objects in Affinity are Persons, Organizations, and Opportunities, and everything in the product is centered around these three resources. We refer to a data model that is a person, organization, or opportunity as an Entity.

The data stored in Affinity can be easily understood as a spreadsheet, with many rows, columns and cells. For each part of a spreadsheet, there are directly equivalent data models in Affinity.

<p>The List view in Affinity represents the spreadsheet itself. A List is a collection of many rows, and the Affinity equivalent of a row is a <span class="list-entry">List Entry</span>. Each column in a spreadsheet is represented by a "Field". There are three types of Fields in Affinity: <span class="global-field">Global Fields</span>, <span class="list-specific-field">List-specific Fields</span> and Smart Fields.</p>

<p>The data in each cell is represented by a "Field Value". There are both regular <span class="field-value">Field Values</span> and <span class="smart-field-value">Smart Field Values</span>.</p>

<img class="crm-field-mappings" src="images/crm-field-mappings.png">

<div class="container-pills">
  <div class="pill list-entry">List Entry</div>
  <div class="pill global-field">Global Field</div>
  <div class="pill list-specific-field">List-specific Field</div>
  <div class="pill field-value">Field Value</div>
  <div class="pill smart-field-value">Smart Field Value</div>
</div>

<aside class="notice">
  <h6>Note</h6>
  <p>When working with Affinity's API, it is important to understand the differences between how data is organized in the CRM versus the API.</p>
  <p>Although Smart Fields show up as a column in the List, they <span class="bold">do not</span> exist in the API in the same way <span class="global-field">Global Fields</span> and <span class="list-specific-field">List-specific Fields</span> ones do.</p>
  <p>To retrieve <span class="smart-field-value">Smart Field Values</span>, see the <a href="#retrieving-field-values">Retrieving Field Values</a> section.</p>
</aside>

## Default Fields

By default, Affinity creates some fields for you automatically. Below are the fields created by type:

<div class="container-table">
  <div class="column">
    <h3 class="global-field">Global Fields</h3>
    <ul>
      <li>Location</li>
      <li>Industry</li>
      <li>Job Titles</li>
      <li>LinkedIn URL</li>
      <li>Phone Number</li>
      <li>Connections</li>
      <li>Source of Introduction</li>
      <li>Lists</li>
      <li>Crunchbase Data</li>
      <li>Affinity Data</li>
      <li>Pitchbook Data</li>
    </ul>
  </div>
  <div class="column">
    <h3 class="smart-field-value">Smart Fields</h3>
    <ul>
      <li>First Email</li>
      <li>Last Email</li>
      <li>First Event (First Meeting)</li>
      <li>Next Event (Next Meeting)</li>
      <li>Last Event (Last Meeting)</li>
      <li>Last Interaction</li>
      <li>Date Added</li>
    </ul>
  </div>
  <div class="column">
    <h3 class="list-specific-field">List-specific Fields</h3>
    <ul>
      <li>Status</li>
      <li>Owners</li>
      <li>Amount</li>
    </ul>
  </div>
</div>