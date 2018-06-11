## attestation object

`attestation` objects have the following attributes:

#### id

Unique identifier (UUID) for this attestation. Automatically generated with [`attestation.create`](#attestation-create).

#### attestation_type_id

ID for the related [`attestationType` object](#attestationtype-object). **Required.**

#### account

The account identifier for this attestation. **Either account or external_account is required.**

#### external_account

The external account identifier for this attestation. **Either account or external_account is required.**

#### active

Boolean for whether this attestation is active. *Default is the `auto_activation` setting of the [`attestationType`](#attestationtype-object).*

#### valid

Boolean for whether this attestation is valid, based on whether it meets the requirements of the [`attestationType`](#attestationtype-object) (for example, if `name_setting` is `required` in the type, and `name` is `NULL` in the attestation, the attestation is invalid).  An invalid attestation will not be used for shift conflict checking.

#### name

Name of the `attestation` object (255-character string). Optional (depending on [`attestationType`](#attestationtype-object) settings).

#### start_date

Date at which this attestation starts; null if attestation extends indefinitely into the past. Optional (depending on [`attestationType`](#attestationtype-object) settings).

#### end_date

Date at which this attestation ends; null if attestation extends indefinitely into the future. Optional (depending on [`attestationType`](#attestationtype-object) settings).

#### timezone

An "Olson" timezone name, e.g. `America/Los_Angeles`. See [IANA Time Zone Database](https://www.iana.org/time-zones) for more information. Default is the timezone of the account, or if not set, the site.

#### document

Boolean for whether this attestation has an attached document.


Additionally, there is a special kind of `attestation` objects called an "exemption" record, used for when an account is exempt from that [`attestationType`](#attestationtype-object). It is created/deleted with separate methods ([`attestation.exempt`](#attestation-exempt) and [`attestation.unexempt`](#attestation-unexempt)), and never modified.


Exemption `attestation` objects have the following attributes:

#### id

Unique identifier (UUID) for this attestation. Automatically generated with [`attestation.create`](#attestation-create).

#### account

The account identifier for this attestation. **Either account or external_account is required.**

#### external_account

The external account identifier for this attestation. **Either account or external_account is required.**

#### exempt

Boolean for whether this attestation is an exemption record.
