# Applications

## Submit an application

> This endpoint can take a multipart form-data POST. You should use this if you need to upload a resume or cover letter.

```html
<!--
EXAMPLE FORM BELOW (simplified):

Please keep in mind that the HTTP Basic Auth API token is a secret key.  Any form posts should be proxied by your own servers.  Any direct post to the /applications POST method would reveal your secret key to anybody that views source--which would be a very bad thing.
-->
<form method="POST" action="!!REQUEST MUST BE PROXIED ON YOUR SERVERS!!" enctype='multipart/form-data'>
  <!-- represents the ID of the job post -->
  <input type="hidden" name="id" value="55555" />
  <!-- place the value of the gh_src URL parameter in the field below -->
  <input type="hidden" name="mapped_url_token" value="token12345" />
  <label>First Name <input type="text" name="first_name" /></label><br/>
  <label>Last Name <input type="text" name="last_name" /></label><br/>
  <label>Email <input type="text" name="email" /></label><br/>
  <label>Phone <input type="text" name="phone" /></label><br/>
  <label>Resume <input type="file" name="resume" /></label><br/>
  <label>Cover Letter <input type="file" name="cover_letter" /></label><br/>
  <label>LinkedIn Profile <input type="text" name="question_5555" /></label><br/>
  <label>Some dropdown
    <select name="question_3333">
      <option></option>
      <option value="1">Yes</option>
      <option value="0">No</option>
    </select>
  </label><br/>
  <label>Multi select with checkboxes<br/>
    <label><input type="checkbox" name="question_2222[]" value="2" /> Red</label><br/>
    <label><input type="checkbox" name="question_2222[]" value="5" /> Orange</label>
  </label><br/>
  <label>
    <input type="checkbox" name="data_compliance[gdpr_processing_consent_given]" value="1" />
    <input type="checkbox" name="data_compliance[gdpr_retention_consent_given]" value="1" />
    {{ORGANIZATION}} has my consent to collect, store, and process my data for the purpose
    of considering me for employment.
  </label>
  <input type="submit" />
</form>
```

> cURL equivalent:

```
curl -X POST \ 
  -H "Content-Type: multipart/form-data" \
  -H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6" \
  -F "first_name=Sammy" \
  -F "last_name=McSamson" \
  -F "email=sammy@example.com" \
  -F "phone=3337778888" \
  -F "location=110 5th Ave New York, NY, 10011" \
  -F "latitude=40.7376671" \
  -F "longitude=-73.9929196" \
  -F "resume=@/path/to/resume/ADA084551.pdf" \
  -F "cover_letter=@/path/to/coverletter/blah.pdf" \
  -F "educations[][school_name_id]=5417077" \
  -F "educations[][degree_id]=5494452"\
  -F "educations[][discipline_id]=5494865" \
  -F "educations[][start_date][month]=8" \
  -F "educations[][start_date][year]=2012" \
  -F "educations[][end_date][month]=5" \
  -F "educations[][end_date][year]=2016" \
  -F "employments[][company_name]=Business Co" \
  -F "employments[][title]=Sales Manager" \
  -F "employments[][start_date][month]=1" \
  -F "employments[][start_date][year]=2016" \
  -F "employments[][end_date][month]=2" \
  -F "employments[][end_date][year]=2018" \
  -F "employments[][current]=false"
  -F "mapped_url_token=token12345" \
  -F "question_12349_url=http://dropbox.com/dl/attachment.pdf" \
  -F "question_12349_url_filename=attachment.pdf" \
  -F "question_12350_content=SGVsbG8sIHdvcmxkIQo=" \
  -F "question_12350_content_filename=something_else.txt" \
  -F "demographic_answers[][question_id]=87" \
  -F "demographic_answers[][answer_options][][answer_option_id]=194" \
  -F "demographic_answers[][question_id]=88" \
  -F "demographic_answers[][answer_options][][answer_option_id]=212" \
  -F "demographic_answers[][answer_options][][text]=Free-form Answer" \
  -F "data_compliance[gdpr_processing_consent_given]=true" \
  -F "data_compliance[gdpr_retention_consent_given]=true" \
  "https://boards-api.greenhouse.io/v1/boards/very_awesome_inc/jobs/127817"
```

> or, you can POST a JSON encoded body (with `Content-Type: application/json`):

```
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Basic MGQwMzFkODIyN2VhZmE2MWRjMzc1YTZjMmUwNjdlMjQ6" \
  -d '{
    "first_name": "Sammy",
    "last_name": "McSamson",
    "email": "sammy@example.com",
    "phone": "3337778888",
    "location": "110 5th Ave New York, NY, 10011",
    "latitude": "40.7376671",
    "longitude": "-73.9929196",
    "resume_text": "I have many years of experience as an expert basket weaver...",
    "cover_letter_text": "I have a very particular set of skills, skills I have acquired over a very long career. Skills that make me...",
    "gender": 2,
    "race": 4,
    "veteran_status": 3,
    "disability_status": 3,
    "question_12345": "Here is some short text for the first question",
    "question_12346": 1,
    "question_12347": 5869311,
    "question_12348": [5869319,5869317],
    "question_12349_url": "http://dropbox.com/dl/attachment.pdf",
    "question_12349_url_filename": "attachment.pdf",
    "question_12350_content": "SGVsbG8sIHdvcmxkIQo=",
    "question_12350_content_filename": "something_else.txt",
    "educations": [
      {
        "school_name_id" : "1403524",
        "degree_id": "1403534",
        "discipline_id": "1403605",
        "start_date": { "month": "1", "year": "1989"},
        "end_date": { "month": "2", "year": "1990"}
      },
      {
        "school_name_id" : "1401063",
        "degree_id": "1403525",
        "discipline_id": "1403608",
        "start_date": { "month": "1", "year": "2011"},
        "end_date": { "month": "2", "year": "2012"}
      }
    ],
    "employments": [
      {
        "company_name": "Business Co.",
        "title": "Sales Manager",
        "start_date": {
          "month": "1",
          "year": "2016"
        },
        "end_date": {
          "month": "2",
          "year": "2018"
        },
        "current": "false"
      }
    ],
    "mapped_url_token":"token12345",
    "demographic_answers":[
      {
        "question_id": 87,
        "answer_options": [
          {
            "answer_option_id": 194
          }
        ]
      },
      {
        "question_id": 88,
        "answer_options": [
          {
            "answer_option_id": 212,
            "text": "Free-form Answer"
          }
        ]
      }
    ]
  },
  "data_compliance": {
    "gdpr_processing_consent_given": true
    "gdpr_retention_consent_given": true
  }' \
  "https://boards-api.greenhouse.io/v1/boards/very_awesome_inc/jobs/127817"
```

Use this endpoint to submit a new application. This endpoint accepts a multipart form POST representing a job application. Application forms are job-specific and will be constructed via the "questions" array available via the [Job method](#retrieve-a-job). Please see the [Job method](#retrieve-a-job) documentation for instructions on submitting location information through the API.

Note that when submitting an application through this method, Greenhouse will not confirm the inclusion of required fields. Validation for required fields must be done on the client side, as Greenhouse will not reject applications that are missing required fields.

<aside class="warning">
  This method requires HTTP Basic Auth over SSL/TLS: the Basic Auth username is your API key (found on the API Credentials page). No password is required.
</aside>

<aside class="notice">
  In general, we would encourage customers to make use of the Embedded Job Application before going to the trouble of building their own form. Our application form is well tested, validated, battle-hardened, and has built-in spam protection measures. Building your own form can introduce a number of challenges which are typically not worth the additional effort.
</aside>

### HTTP Request

`POST https://boards-api.greenhouse.io/v1/boards/{board_token}/jobs/{id}`

Parameter | Description
 --------- | -----------
 board_token | Job Board URL token.  If you're submitting an application for a job post on an internal job board, use `"internal"`.
 id | Job post ID. Both internal and external job posts are allowed.

### Request Headers

Parameter | Description
--------- | -----------
Authorization | This header should include a basic authorization with a **Base64 encoded** API key
Content-Type | Required if the request contains an attachment

### Request Parameters

Parameter | Description
--------- | -----------
*mapped_url_token | If present, the `gh_src` URL parameter, which is used to indicate the referral source of this application.
first_name | Applicant's first name
last_name | Applicant's last name
email | Applicant's email address
*phone | Applicant's phone number
*location | Applicant's street address
*latitude | Applicant's home latitude. This is a *hidden* field and should not be exposed directly to the applicant.
*longitude | Applicant's home longitude. This is a *hidden* field and should not be exposed directly to the applicant.
*resume | *Please see below for details.*
*cover_letter | *Please see below for details.*
*educations | An array of education objects. Each education object should have five fields: `school_name_id`, `degree_id`, `discipline_id`, `start_date`, and `end_date`. You can get the `school_name_id`, `degree_id`, `discipline_id` from our [List Schools](#list-schools), [List Degrees](#list-degrees), and [List Disciplines](#list-disciplines) endpoints. `start_date` and `end_date` will use a hash of month and year.
*employments | An array of employments objects. Each employment object should have: `company_name`, `title`, `start_date`, and `current` (must be `true` or `false`). If `current` is `false`, must have `end_date`. `start_date` and `end_date` will use a hash of month and year.
*demographic_answers | An array of demographic answer objects, applicable only if your organization has Greenhouse Inclusion and demographic questions are enabled on the job post. Each object must have a `question_id` field. The `answer_options` field is an array of objects, one for each `answer_option_id` the candidate selected. For answer options which support free-form responses, a `text` field may also be supplied with the candidate's hand-typed answer. Note that these questions are always optional, so the `answer_options` array may be empty, null, or omitted if the candidate did not make any selections.
*data_compliance | An object representing an candidate's answer to required data compliance questions. This field is dependent on your organization's privacy and compliance configuration and is only applicable in some cases. Example: `{ "gdpr_processing_consent_given": true, "gdpr_retention_consent_given": false }`.

### Submitting Attachments

We support 4 methods of uploading attachments when submitting a candidate application:

1. Submit the attachment via direct upload using multipart/form-data.
2. Submit the attachment via direct upload using application/json. 
3. Submit a path to the attachment on an external server.
4. Submit the plaintext file contents.

</br>

**Resume Attachments**

Method | Content-Type | Required Fields | Example 
--------- | ----------- | ----------- | -----------
Direct upload | multipart/form-data  | "resume" | "resume": "@/Users/UserName/Documents/resume.pdf" *(this example is specific to cURL)*
Direct upload | application/json | "resume_content", "resume_content_filename" | "resume_content": "SGVsbG8sIHdvcmxkIQo=", "resume_content_filename": "resume.pdf"
Path to file on external server  | multipart/form-data *or* application/json | "resume_url", "resume_url_filename" | "resume_url": "https://example.com/resume.pdf", "resume_url_filename": "resume.pdf"
Plaintext file contents | multipart/form-data *or* application/json | "resume_text" | "resume_text": "This is my awesome resume!"

</br>

**Cover Letter Attachments**

Method | Content-Type | Required Fields | Example
--------- | ----------- | ----------- | -----------
Direct upload | multipart/form-data | "cover_letter" | "cover_letter": "@/Users/UserName/Documents/coverletter.pdf" *(this example is specific to cURL)*
Direct upload | application/json | "cover_letter_content", "cover_letter_content_filename" | "cover_letter_content": "SGVsbG8sIHdvcmxkIQo=", "cover_letter_content_filename": "coverletter.pdf"
Path to file on external server  | multipart/form-data *or* application/json | "cover_letter_url", "cover_letter_url_filename" | "cover_letter_url": "https://example.com/coverletter.pdf", "cover_letter_url_filename": "coverletter.pdf"
Plaintext file contents | multipart/form-data *or* application/json | "cover_letter_text" | "cover_letter_text": "This is my awesome cover letter!"

</br>

**Custom Question Attachments**

Method | Content-Type | Required Fields | Example
--------- | ----------- | ----------- | -----------
Direct upload | multipart/form-data | "question_12345" | "question_12345": "@/Users/UserName/Documents/attachment.pdf" *(this example is specific to cURL)*
Direct upload | application/json | "question_12345_content", "question_12345_content_filename" | "question_12345_content": "SGVsbG8sIHdvcmxkIQo=", "question_12345_content_filename": "attachment.pdf"
Path to file on external server  | multipart/form-data *or* application/json | "question_12345_url", "question_12345_url_filename" | "question_12345_url": "https://example.com/attachment.pdf", "question_12345_url_filename": "attachment.pdf"

### Collecting Applicant Location

Here is the suggested workflow for populating `location`, `latitude` and `longitude`:

1. The applicant begins typing a location in your `location` text box.
2. As the applicant types, your app makes a call to the [Google Places Autocomplete API](https://developers.google.com/maps/documentation/javascript/places-autocomplete)
to retrieve suggested location names (e.g. New York, NY, United States)
and the `place_id` associated with each location (e.g. `ChIJOwg_06VPwokRYv534QaPC8g`).
3. Your app displays the suggested location names to the applicant.
4. The applicant selects a suggested location.
5. Your app uses the `place_id` from the previous API call to retrieve the latitude and
longitude for the selected location using the [Google Place Details API](https://developers.google.com/maps/documentation/javascript/places#place_details).
6. Your app populates the hidden `latitude` and `longitude` fields with the result of
this API call.

Note that all 3 fields must be included. If only `location` is sent and `latitude` and `longitude` are omitted, `location` will be ignored entirely.

### Validations on POST Requests

**Job validations:**

* The job must be live and published
* The job board must be live and published
* The job post ID must exist on the job board with the supplied board_token

**Field validations:** 

* `first_name`, `last_name`, and `email` fields are required 
* `first_name`, `last_name`, and `email` fields cannot be greater than 255 characters long
* `first_name`, `last_name`, and `phone` fields must not contain a URL
* `email` field must contain a valid email address
* `educations` object must contain valid `school_name_id`, `degree_id`, `discipline_id`, `start_date`, and `end_date`
* `employments` object must contain `company_name`, `title`, `start_date` and `current` (must be `true` or `false`). If *current=false*, must contain `end_date`
* `start_date` must be before `end_date`
* Field values must match the field type specified on the job post question

**Attachments:**

* Must be a supported file type (pdf, doc, docx, txt, rtf)
* File size must be > 0 bytes

