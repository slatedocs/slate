## registration object

registration objects have the following attributes:

####id

A unique identifier for this registration.

####profile_type

profileType identifier for this registration.

####data

An array of objects, each of which has a `form_name` and a `value` attribute.

### registration.create

> Request example:

```JSON
{
   "data" : [
      {
         "value" : "Tester",
         "form_name" : "last_name"
      },
      {
         "value" : "Joe",
         "form_name" : "first_name"
      },
      {
         "value" : "joe.tester@example.com",
         "form_name" : "email"
      },
      {
         "value" : "12345",
         "form_name" : "zip"
      },
      {
         "value" : "M",
         "form_name" : "tshirt_size"
      },
      {
         "value" : "English",
         "form_name" : "fluent_languages"
      },
      {
         "value" : "Mandarin Chinese",
         "form_name" : "fluent_languages"
      },
      {
         "value" : 5,
         "form_name" : "birthdate_day"
      },
      {
         "value" : 4,
         "form_name" : "birthdate_month"
      },
      {
         "value" : 1972,
         "form_name" : "birthdate_year"
      }
   ],
   "profile_type" : 1
}
```

> Response example:

```JSON
{
   "seconds" : "0.082992",
   "jsonrpc" : "2.0",
   "id" : "31",
   "result" : {
      "id" : 43
   }
}
```

<span class="tryit" id="registration-create-tryit"></span>
Creates a new registration record.

Parameters: `profile_type` must be specified. `data` must be specified and must include any required registration form fields.

User pictures and resumes are not yet supported.

date, month/day, or month/year types should be given in two or three separate fields (e.g. birthdate_day, birthdate_month, birthdate_year) with integer values.

Response: On success, an `id` attribute will provide the identifier for the new registration.

