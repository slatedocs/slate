# Common Use Cases

Use the common use cases below to learn how Affinity API endpoints work.

<aside class="notice">
  <h6>Helpful Tips</h6>
  <ul>
    <li>To reduce API calls, create any initial backfills with the REST API then use <a href="#webhooks">Webhooks</a> to keep data synced. You may want to schedule occasional syncs via the REST API to fixed any inconsistencies</li>
    <li>Your instance may contain multiple fields with the same name (e.g. Last Funding Date). To confirm the field ID, manually make an edit to the field in question and inspect the request payload for the bulk request. The field ID will be listed as <code>entityAttributeId</code>
    <img class="request-payload" src="images/request-payload.png">
    </li>
    <li>The ID for a list, person, organization and opportunity can be found via the URL in the CRM. For a list <code>affinity.affinity.co/lists/[<span class="bold">list_id</span>]</code> and for a company profile <code>affinity.affinity.co/companies/[<span class="bold">company_id</span>]</code></li>
    <li>For large lists, use <code>page_size</code> and <code>page_token</code> parameters in the <code><a href="#get-all-list-entries">GET /lists/list_id}/list-entries</a></code> endpoint to improve performance</li>
  </ul>
</aside>

## Getting Field Values for All List Entries on a List

<ol class="use-case">
  <li>
    <h3>1. Query <code><a href="#get-all-lists">GET /lists</a></code> to get all lists and filter results by list name to get the appropriate list ID</h3>
<pre>
<span>GET /lists Response:</span>
[
  {
    "id": <span class="bold">12058</span>,
    "type": 0,
    "name": "Current Prospects",
    "public": true,
    "owner_id": 477400,
    "list_size": 150
  }
  ...
]
</pre>
  </li>
  <li>
    <h3>2. Query <code><a href="#get-all-list-entries">GET /lists/12058/list-entries</a></code> to get all list entries. Store the <code>entity_id</code> associated with each list entry ID</h3>
<pre>
<span>GET /lists/{list_id}/list-entries Response:</span>
[
  {
    "id": 37605676,
    "list_id": 113859,
    "creator_id": 63842761,
    "entity_id": <span class="bold">7133202</span>,
    "entity_type": 8,
    "created_at": "2021-09-12T16:29:15.962-07:00",
    "entity": {
      "id": 7133202,
      "name": "Affinity Opportunity"
    }
  }
  ...
]
</pre>
  </li>
  <li>
    <h3>3. For each list entry, query <code><a href="#get-field-values">GET /field-values</a></code> with the <code>entity_id</code> from the previous step. Make sure you are passing <code>entity_id</code> through the appropriate parameter (e.g person_id)</h3>
<pre>
<span>GET /field-values Response:</span>
[
  {
    "id": 2448594830,
    "field_id": 61223,
    "list_entry_id": 37605676,
    "entity_type": 0,
    "value_type": 3,
    "entity_id": 7133202,
    "value": 5000.0
  }
  ...
]
</pre>
  </li>
  <li>
    <h3>4. Locate field values for a given set of fields (optional)</h3>
    <ol>
      <li>Query <code><a href="#get-fields">GET /fields</a></code> to get all fields. If the given set of fields are all list-specific, it is helpful to pass along the <code>list_id</code> parameter to prefilter the results</li>
      <li>Filter results of <code><a href="#get-fields">GET /fields</a></code> by field name to get the appropriate field ID</li>
      <li>Cross-reference the <code>field_id</code> from Step 3 with the field ID</li>
    </ol>
<pre>
<span>GET /fields Response:</span>
[
  {
    "id": <span class="bold">61223</span>,
    "name": "Amount",
    "list_id": 12058,
    "value_type": 3,
    "allows_multiple": false,
    "track_changes": true,
  }
  ...
]
</pre>
  </li>
</ol>

## Getting Field Value Changes for Status Fields

<ol class="use-case">
  <li>
    <h3>1. Query <code><a href="#get-all-lists">GET /lists</a></code> and filter results to get the appropriate list ID</h3>
<pre>
<span>GET /lists Response:</span>
[
  {
    "id": <span class="bold">12058</span>,
    "type": 0,
    "name": "Current Prospects",
    "public": true,
    "owner_id": 477400,
    "list_size": 150
  }
  ...
]
</pre>
  </li>
  <li>
    <h3>2. Locate the appropriate status field:</h3>
    <ol>
      <li>Query <code><a href="#get-fields">GET /fields</a></code> to get all fields. If the given set of fields are all list-specific, it is helpful to pass along the list_id parameter to prefilter the results</li>
      <li>Filter results of <code><a href="#get-fields">GET /fields</a></code> by field name and cross-reference the <code>list_id</code> with the appropriate list ID from Step 1 to confirm you have the appropriate status field</li>
    </ol>
<pre>
<span>GET /fields Response:</span>
[
  {
    "id": 61223,
    "name": "<span class="bold">Amount</span>",
    "list_id": <span class="bold">12058</span>,
    "value_type": 3,
    "allows_multiple": false,
    "track_changes": true,
  },
  ...
]
</pre>
  </li>
  <li>
    <h3>3. Query <code><a href="#field-value-changes">GET /field-values-changes</a></code> passing in the <code>id</code> from Step 2</h3>
<pre>
<span>GET /field-values-changes Response:</span>
[
  {
    "id": 7,
    "entity_attribute_id": 106,
    "changer": {
        "id": 2,
        "type": 1,
        "first_name": "Alice",
        "last_name": "Doe",
        "primary_email": "alice@affinity.co",
        "emails": [
            "alice@affinity.co"
        ]
    },
    "changed_at": "2021-09-17T10:43:12.781-04:00",
    "action_type": 2,
    "list_entry_id": 15709964,
    "person": {
        "id": 2,
        "type": 1,
        "first_name": "John",
        "last_name": "Doe",
        "primary_email": "jdoe@alumni.stanford.edu",
        "emails": [
            "jdoe@alumni.stanford.edu"
        ]
    },
    "company": null,
    "opp": null,
    "value": {
        "id": 30,
        "text": "In Progress",
        "rank": 1,
        "color": 3
    },
    "entity_id": 38706,
    "field_id": <span class="bold">61223</span>
    }
  ...
]
</pre>
  </li>
  <li>
    <h3>4. Filter results of <code><a href="#field-value-changes">GET /field-values-changes</a></code> (e.g.: If you only want status field changes for a specific organization in your list, search by the <code>list_entry_id</code>).</h3>
<pre>
<span>GET /field-values-changes Response:</span>
[
  {
    "id": 7,
    "entity_attribute_id": 106,
    "changer": {
        "id": 2,
        "type": 1,
        "first_name": "Alice",
        "last_name": "Doe",
        "primary_email": "alice@affinity.co",
        "emails": [
            "alice@affinity.co"
        ]
    },
    "changed_at": "2021-09-17T10:43:12.781-04:00",
    "action_type": 2,
    "list_entry_id": <span class="bold">15709964</span>,
    "person": {
        "id": 2,
        "type": 1,
        "first_name": "John",
        "last_name": "Doe",
        "primary_email": "jdoe@alumni.stanford.edu",
        "emails": [
            "jdoe@alumni.stanford.edu"
        ]
    },
    "company": null,
    "opp": null,
    "value": {
        "id": 30,
        "text": "In Progress",
        "rank": 1,
        "color": 3
    },
    "entity_id": 38706,
    "field_id": 61223
    }
  ...
]
</pre>
  </li>

</ol>

## Getting the Strongest Relationship Strength Connection to an Organization on a List

<ol class="use-case">
  <li>
    <h3>1. Query <code><a href="#get-all-lists">GET /lists</a></code> to get all lists and filter results to get the appropriate list ID</h3>
<pre>
<span>GET /lists Response:</span>
[
  {
    "id": <span class="bold">12058</span>,
    "type": 0,
    "name": "Current Prospects",
    "public": true,
    "owner_id": 477400,
    "list_size": 150
  }
  ...
]
</pre>
  </li>
  <li>
    <h3>2. Query <code><a href="#get-all-list-entries">GET /lists/12058/list-entries</a></code> to get all list entries. Store the <code>entity_id</code> associated with each list entry ID</h3>
<pre>
<span>GET /lists/{list_id}/list-entries Response:</span>
[
  {
    "id": 37605676,
    "list_id": 12058,
    "creator_id": 63842761,
    "entity_id": <span class="bold">7133202</span>,
    "entity_type": 8,
    "created_at": "2021-09-12T16:29:15.962-07:00",
    "entity": {
      "id": 7133202,
      "name": "Affinity",
      "domain": "affinity.co",
      "domains": [
        "affinity.co"
      ],
      "crunchbase_uuid": null,
      "global": false
    }
  }
  ...
]
</pre>
  </li>
  <li>
    <h3>3. For each list entry, query <code><a href="#get-a-specific-organization">GET /organizations/{organization_id}</a></code> to get all list people associated with the organization. Store the <code>person_ids</code> associated with each organization</h3>
<pre>
<span>GET /organizations/7133202 Response:</span>
{
  "id": 7133202,
  "name": "Affinity",
  "domain": "affinity.co",
  "domains": ["affinity.co"],
  "crunchbase_uuid": null,
  "global": false,
  "person_ids": [<span class="bold">89734, 117270, 138123, 274492, 304848, ...</span>],
  "list_entries": [
    {
      "id": 389,
      "list_id": 26,
      "creator_id": 38603,
      "entity_id": 7133202,
      "entity_type": 0,
      "created_at": "2020-12-11T02:26:56.537-08:00",
    }
    ...
  ]
}
</pre>
  </li>
  <li>
    <h3>4. For each person ID from Step 3, query <code><a href="#fetch-a-relationship-strength">GET /relationships-strengths</a></code> passing in the person ID. Once all person IDs have been looped through, filter for the highest <code>strength</code></h3>
<pre>
<span>GET /relationships-strengths Response:</span>
[
  {
    "internal_id": 26317,
    "external_id": 89734,
    "strength": <span class="bold">0.5</span>
  }
  ...
]
</pre>
  </li>
</ol>

## Useful Resources

<ul>
  <li><a target="_blank" href="/postman/collection.json">Postman Collection</a> (Right-click and save as JSON then import into <a href="https://www.postman.com/" target="_blank">Postman</a>)</li>
  <li><a target="_blank" href="https://zapier.com/apps/affinity/integrations">Affinity Zapier Integrations</a></li>
  <li><a target="_blank" href="https://tray.io/documentation/connectors/service/affinity">Affinity Tray Connectors</a></li>
</ul>