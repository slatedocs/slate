# Slicer

## List Slicer Profiles

```shell
curl -X GET https://api.simplyprint.io/{id}/slicer/ListProfiles \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
  "status": true,
  "message": null,
  "profiles": [
    {
      "id": 785,
      "name": "Prusa profile",
      "for_printers": null,
      "org": true
    }
  ]
}
```

This endpoint returns a list overview of slicer profiles that the user has access to. Includes personal and company profiles.

### Request

`GET /{id}/slicer/ListProfiles`

### Response

| Field | Type | Description |
| ----- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
| `profiles` | array | An array of profile objects. |
| `profiles.*.id` | integer | The ID of the profile. |
| `profiles.*.name` | string | The name of the profile. |
| `profiles.*.for_printers` | array | The printers ids that this profile is made for. |
| `profiles.*.org` | boolean | True if this profile is owned by the company, and not by the user. |

## Get Slicer Profile

```shell
curl https://api.simplyprint.io/{id}/slicer/Get?id=1234 \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
  "status": true,
  "message": null,
  "profile": {
    "id": 785,
    "name": "Prusa profile",
    "settings": {
      "sliceHeight": 0.2,
      "sliceFillSparse": 30,
      "sliceShells": 2,
      "sliceShellOrder": "in-out",
      "sliceTopLayers": 3,
      "sliceSolidLayers": 2,
      "sliceBottomLayers": 2,
      "outputFillMult": 1.1,
      "sliceFillAngle": 45,
      "outputShellMult": 1,
      "outputCoastDist": 0,
      "sliceSolidMinArea": 5,
      "sliceMinHeight": 0,
      "sliceLayerStart": "center",
      "sliceFillType": "hex",
      "sliceFillRate": 130,
      "outputSparseMult": 1.1,
      "sliceFillOverlap": 35,
      "firstSliceHeight": 0.2,
      "firstLayerLineMult": 100,
      "firstLayerFillRate": 35,
      "firstLayerRate": 10,
      "firstLayerPrintMult": 1,
      "firstLayerFanSpeed": 0,
      "sliceSupportOutline": 1,
      "sliceSupportAngle": 1,
      "sliceSupportDensity": 25,
      "sliceSupportSize": 6,
      "sliceSupportOffset": 0.4,
      "sliceSupportGap": 0,
      "sliceSupportSpan": 5,
      "sliceSupportArea": 0.25,
      "sliceSupportExtra": 0,
      "outputBrimCount": 0,
      "outputBrimOffset": 2,
      "outputRaftSpacing": 0.3,
      "outputSeekrate": 150,
      "outputFanLayer": 2,
      "fanSpeed": 100,
      "outputRetractDist": 1,
      "outputRetractSpeed": 100,
      "outputRetractDwell": 0,
      "outputRetractWipe": 2,
      "outputShortPoly": 50,
      "zHopDistance": 0,
      "antiBacklash": 0,
      "gcodePause": 0,
      "newLayerGcode": "",
      "firstLayerBeltLead": 0,
      "firstLayerBeltBump": 0,
      "firstLayerFlatten": 0,
      "firstLayerBrimIn": 0,
      "sliceSupportEnable": 0,
      "outputRaft": 0,
      "outputLayerRetract": 0
    },
    "for_printers": null,
    "org": true
  }
}
```

This endpoint can be used to get a slicer profile by its ID. This includes the settings of the profile.

### Request

`GET /{id}/printers/Delete`

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer | yes | The id of the profile to fetch. |

### Response

| Field | Type | Description |
| ----- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
| `profile` | object | The profile object. |
| `profile.id` | integer | The ID of the profile. |
| `profile.name` | string | The name of the profile. |
| `profile.settings` | object | The settings of the profile. |
| `profile.for_printers` | array | The printers ids that this profile is made for. |
| `profile.org` | boolean | True if this profile is owned by the company, and not by the user. |

## Save or Create Slicer Profile

```shell
curl https://api.simplyprint.io/{id}/slicer/SaveProfile?id=1234 \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

TODO

## Delete Slicer Profile

```shell
curl -X GET https://api.simplyprint.io/{id}/slicer/DeleteProfile?id=1234 \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
  "status": true,
  "message": null
}
```

| Required permissions | Description |
| -------------------- | ----------- |
| `SLICER_ORG_PROFILES` | If the profile is owned by the company. |

This endpoint can be used to delete a slicer profile by its ID.

### Request

`GET /{id}/printers/Delete`

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer | yes | The id of the profile to delete. |

### Response

| Field | Type | Description |
| ----- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
