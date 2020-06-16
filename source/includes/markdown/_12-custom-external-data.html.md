<hr>
<section>

# Custom External Data

<span class="description">
Custom external data allows a client application to add app-specific metadata to [Tasks](/docs/asana-tasks)
in the API. The custom data includes a string `gid` that can be used to retrieve objects and a data blob that can store
character strings.
</span>

The blob may store unicode-safe serialized data such as JSON or YAML. The external `gid` is capped at 1,024 characters, while data
blobs are capped at 32,768 characters. Each object supporting external data can have one `gid` and one data blob stored
with it. You can also use either or both of those fields.

The external `gid` field is a good choice to create a reference between a resource in Asana and another database, such as
cross-referencing an Asana task with a customer record in a CRM, or a bug in a dedicated bug tracker. Since it is just
a unicode string, this field can store numeric IDs as well as URIs, however, when using URIs extra care must be taken
when forming queries that the parameter is escaped correctly. By assigning an external `gid` you can use the notation
`external:custom_id` to reference your object anywhere that you may use the original object `gid`.

**Note:** that you will need to authenticate with Oauth, as the `gid` and data are app-specific, and these fields are not
visible in the UI. This also means that external data set by one Oauth app will be invisible to all other Oauth apps.
However, the data is visible to all users of the same app that can view the resource to which the data is attached,
so this should not be used for private user data.

| Parameter | Description |
|---|---|
| gid | `"contractor_name"` 	The external `gid`. Max size is 1024 characters. Can be a URI. |
| data | `"{ \"time_estimate\": 3600, \"time_spent\": 1482 }"` The external data blob. Max size is 32,786 characters. |

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
