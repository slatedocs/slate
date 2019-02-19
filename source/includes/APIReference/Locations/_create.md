## Create Locations

Add one or more locations to your company.

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/locations</api>

### Properties
_Pass an array of location objects as the value to a 'data' property (see example)._

One or more of the following properties are required to create a location:

|                |             |             |
| -------------: | :---------: | ----------- |
| **addr1** | _String_ | The first line of the street for the address. |
| **addr2** | _String_ | The second line of the street for the address. |
| **city** | _String_ | The city of the address. |
| **state** | _String_ | The state of the address. |
| **zip** | _String_ | The postal code for the address. |
| **county** | _String_ | he country of the address. |

For a full list of properties that may be set on a location, see [the Location object](#the-location-object).

### Status Codes

Each location that is created will come back with a `_status_code` and `_status_message` that will indicate whether the location was created successfully. If there was a problem creating a location, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Location was created successfully. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this location. See the `_status_extra` value for more detail. |

<aside class="notice">
The maximum batch size is <i>50</i> locations. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>

