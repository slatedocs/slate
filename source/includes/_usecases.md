# Use Cases

The following sections describe some common use cases for the API and how to best achieve them.

## Extracting all historical audit data

The API can be used to extract all historical data that your account has access to.

There are several steps to extracting this audit data:

 1. Retrieve all the available audit identifiers
 2. Retrieve the corresponding audit data for each identifier
 3. Retrieve the media associated with each audit

### Retrieve all the available audit identifiers

```shell
curl "https://api.safetyculture.io/audits/search?field=audit_id&field=modified_at" \
  -H "Authorization: Bearer ..."
```

```json
{
  "count": 1000,
  "total": 2023,
  "audits": [
  
  
  
    {
      "audit_id": "audit_01ca38a821504cda885736cccbb9ba40",
      "modified_at": "2015-03-17T03:16:31.072Z"
    },
    {
      "audit_id": "audit_853C17E6040B43DA1DFDDD8E6A4D6D3A",
      "modified_at": "2015-03-24T06:31:47.203Z"
    }
  ]
}
```

To retrieve all of the available audit IDs, you will use the process as described in the  [Search Audits](#search-audits) section of the documentation. You can then use the IDs from the `audit_id` field of each record in the `audits` array.

```shell
curl "https://api.safetyculture.io/audits/search?field=audit_id&field=modified_at&modified_after=2015-03-24T06:31:47.203Z" \
  -H "Authorization: Bearer ..."
```

If you have more than 1000 audits, then you'll see that the amount is limited and the `total` will be greater than the `count` retrieved. In this case, you should make another request, setting the `modified_after` parameter to the date of the last retrieved audit. Repeat this process until all of the audits have been retrieved.

### Retrieve the corresponding audit data for each identifier

```shell
curl "https://api.safetyculture.io/audits/audit_01ca38a821504cda885736cccbb9ba40" \
  -H "Authorization: Bearer ..."
```
  
Given the list of audits retrieved in the previous step, the audits may then be retrieved individually, as described in [Get Audit](#get-audit).

The audit data can then be stored or processed as desired within your own systems, using the [Audit Format](#audit-format) as a guide to the data available.

### Retrieve the media associated with each audit

Finally, you may decide that you need to retrieve the media for some or all of the audits. To do so, for each of the audits retrieved above, find all of the elements that contain media. This includes:

  * All `header_items` with a `media` element
  * All `items` with a `media` element
  * All `options` within an item or header item that contain a `media` element
  * All `responses` within an item or header item that contain a `media` or `image` element
  * All `assets` that contain a `media` element
  
```shell
curl "https://api.safetyculture.io/audits/audit_01ca38a821504cda885736cccbb9ba40/media/9E3BD015-6275-4668-BAF1-296B2F38444C" \
  -o 9E3BD015-6275-4668-BAF1-296B2F38444C.jpg \
  -H "Authorization: Bearer ..."
```
  
The media element is described in the [media reference](#media). It contains an `href` element, that allows you to directly request the required media, if you have not retrieved it already. You can then retrieve it as described in [Get Media](#get-media).

<aside class="warning">
The media associated with all audits can be quite a large quantity. To preserve bandwidth, ensure only the necessary media is retrieved, and is only retrieved once. Media are not updated with the same UUID, so it is unnecessary to retrieve it again to check for updates.
</aside>

## Getting modified audits

Once you have extracted all of the historical data, the next obvious step is to retrieve the modified audits so that you can continue populating your other data stores. This function is also useful for producing regular updates from your audit data, such as a live dashboard.

...
