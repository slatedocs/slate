## attestationType object

`attestationType` objects have the following attributes:

#### id

Unique identifier (UUID) for this attestation. Automatically generated with [`attestationType.create`](#attestationtype-create).

#### name

Name of the attestation type (255-character string). _Must be unique._ **Required.**

#### enabled

Boolean for whether this attestation type is enabled. _Default is true._

#### hold_account

Boolean for whether accounts with this attestation type will be put on hold on when the account falls into an "expired" state (i.e., it has attestations of this type that have expired, and currently has no active attestations of this type). _Used only with advanced onboarding._ _Default is false._

#### auto_activation

Boolean for whether a new [`attestation`](#attestation-object) record defaults to active. _Default is true._

#### name_required
#### start_date_required
#### end_date_required
#### document_required

Setting for whether the [`attestation`](#attestation-object) field is required for an attestation of this type. When one of these settings is changed, the attestations of that type are not modified, though whether they are `valid` may change. `optional`: in the API and UI, but not required to be valid. `required`: in the API and UI, and required to be valid. `optional`: not in the API or UI, and not required to be valid. _One of `optional`, `required`, `unused`. Default is `optional`._

**EXAMPLE 1**: If an attestation has a `start_date` and then the attestation type's `start_date_required` is set to `unused`, the record will be treated as though its `start_date` is blank, though the stored `start_date` will not change.

**EXAMPLE 2**: If `start_date_required` is then changed to `optional` or `required`, the stored `start_date` will be used.

**EXAMPLE 3**: If the stored `start_date` is blank and `start_date_required` is changed from `optional` or `unused` to `required`, the attestation will no longer be valid.


### attestationType.list

> Request example:

```JSON
{
  "select" : {
    "workgroup" : "226084"
  }
}
```

> Response example:

```JSON
{
  "id" : "1",
  "jsonrpc" : "2.0",
  "result" : {
    "attestationTypes" : [
      {
        "auto_activation" : false,
        "document_required" : "optional",
        "enabled" : true,
        "end_date_required" : "optional",
        "hold_account" : false,
        "id" : "01234567-890a-bcde-f012-3456789abcde"
        "name" : "Contract",
        "name_required" : "optional",
        "permissions" : "{}",
        "start_date_required" : "optional"
      },
      {
        "auto_activation" : false,
        "document_required" : "optional",
        "enabled" : true,
        "end_date_required" : "optional",
        "hold_account" : false,
        "id" : "12345678-90ab-cdef-0123-456789abcdef"
        "name" : "Certifications",
        "name_required" : "optional",
        "permissions" : "{}",
        "start_date_required" : "optional"
      }
    ]
  },
  "seconds" : "0.089939"
}
```

<span class="tryit" id="attestationtype-list-tryit"></span>
Returns attestation type records for the org.

#### Response

On success, the selected attestation type records will be returned in the `"attestationTypes"` key.
