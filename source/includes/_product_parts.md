## `/products/<imei>/parts`

### Description

> A `GET` request to this endpoint will return a complete list of parts and related data currently associated with that unit.

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/000000000000/parts"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.put(url=url, headers=headers)

    print r.json()
    >>> {
        "message": "Parts found.",
        "status": "success",
        "data": {
            "10737": {
              "created_at": "2015-07-02T11:50:23",
              "created_by": "d.mclean@bboxx.co.uk",
              "modified_at": null,
              "part_id": 10737,
              "part_product_linker": {
                "added_repair_id": null,
                "created_at": "2015-07-02T11:50:25",
                "created_by": "d.mclean@bboxx.co.uk",
                "date_added": "2015-07-02T11:50:24",
                "date_removed": null,
                "modified_at": null,
                "part_id": 10737,
                "part_product_linker_id": 10719,
                "product_imei": "013950005303699",
                "removed_repair_id": null,
                "replaced_part_id": null
              },
              "part_type": {
                "created_at": "2015-04-10T10:48:40",
                "created_by": "d.mclean@bboxx.co.uk",
                "description": "A SIM card provided and activated by Vodafone",
                "erp_code": null,
                "modified_at": null,
                "name": "Vodafone SIM",
                "part_type_id": 1,
                "serial_number_category": "known"
              },
              "part_type_id": 1,
              "replacement_part_types": [
                {
                  "created_at": "2015-04-10T10:48:40",
                  "created_by": "d.mclean@bboxx.co.uk",
                  "description": "A SIM card provided and activated by Vodafone",
                  "erp_code": null,
                  "modified_at": null,
                  "name": "Vodafone SIM",
                  "part_type_id": 1,
                  "serial_number_category": "known"
                },
                {
                  "created_at": "2015-04-10T10:49:38",
                  "created_by": "d.mclean@bboxx.co.uk",
                  "description": "A SIM card provided and activated by Wireless Logic",
                  "erp_code": null,
                  "modified_at": null,
                  "name": "Wireless Logic SIM",
                  "part_type_id": 2,
                  "serial_number_category": "known"
                }
              ],
              "serial_number": "204043256110756"
            },
            "308501": {
              "created_at": "2016-06-14T09:48:39.622906",
              "created_by": "h.he@bboxx.co.uk",
              "modified_at": null,
              "part_id": 308501,
              "part_product_linker": {
                "added_repair_id": null,
                "created_at": "2016-06-14T09:48:40.486927",
                "created_by": "h.he@bboxx.co.uk",
                "date_added": "2016-06-14T09:48:40.748124",
                "date_removed": null,
                "modified_at": null,
                "part_id": 308501,
                "part_product_linker_id": 307244,
                "product_imei": "013950005303699",
                "removed_repair_id": null,
                "replaced_part_id": null
              },
              "part_type": {
                "created_at": "2016-03-10T15:40:46.578552",
                "created_by": "d.mclean@bboxx.co.uk",
                "description": "5A fuse",
                "erp_code": null,
                "modified_at": null,
                "name": "5A Fuse",
                "part_type_id": 13,
                "serial_number_category": "unknown"
              },
              "part_type_id": 13,
              "replacement_part_types": [
                {
                  "created_at": "2016-03-10T15:40:46.578552",
                  "created_by": "d.mclean@bboxx.co.uk",
                  "description": "5A fuse",
                  "erp_code": null,
                  "modified_at": null,
                  "name": "5A Fuse",
                  "part_type_id": 13,
                  "serial_number_category": "unknown"
                }
              ],
              "serial_number": "tCXYvInR0xwCQpzAnJS76dPfHMr1uTMmFRZs7Jj49to0P2wxzCPAfYzie2AvncZF"
            },
        }
```
This endpoint is designed to for use during repairs of the Unit. A `GET` request to this endpoint will return:

* The parts present on the unit
* The parts historically used on the unit
* The date and time that the part was added (or removed)
* The allowed replacements for each part
* Details of the part_type for each part


### Endpoint

    | value
---:|:------
__endpoint__ | `/products/<imei>/parts`
__method__ | `GET`
__url_params__ | `product_imei` _(str)_
__payload__ | None
__response__ | 200
__permissions | `OVERVIEW`


### Response

The format of the data returned by this endpoint is a dictionary where the keys are part_ids and the value is another dictionary of the data associated with the part.

<code>part_id: {part_data}</code>


Where `{part_data}` is a dictionary as follows:

<code>{         "part_id": { id },         "part_type_id": {type_id },         "serial_number": { serial },
"part_product_linker": { linker dict }         "part_type": { part_type_dict }         "replacement_part_types": [ list-
of-replacement-part_type-objects ]         "created_at": { timestamp },         "created_by": { user },
"modified_at": { timestamp },   }</code>

You can see an example of the full object in the code snippet to the right.

The intended use for this endpoint is for implementing repairs to BBOXX Units.


