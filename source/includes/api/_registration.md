## registration object

registration objects have the following attributes:

####id

A unique identifier for this registration.

####profile_type

profileType identifier for this registration.

####data

An array of objects, each of which has a `form_name` and a `value` attribute.

### registration.create

<script>tryit('registration.create')</script> 

Creates a new registration record.

Parameters: `profile_type` must be specified. `data` must be specified and must include any required registration form fields.

User pictures and resumes are not yet supported.

date, month/day, or month/year types should be given in two or three separate fields (e.g. birthdate_day, birthdate_month, birthdate_year) with integer values.

Response: On success, an `id` attribute will provide the identifier for the new registration.

