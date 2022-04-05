# Queries
## complexityInfo \([ComplexityInfo](#complexityinfo)\)
```graphql
# the basic structure of the complexityInfo query
{
  complexityInfo {
    score
    maximum
  }
}
```

```graphql
# Example of retriving complexity information from the employee query
{
  employee(id: 20) {
     email
     lastName
  }
  complexityInfo {
    score
    maximum
  }
}
```

The complexity information for the current query. By itself it doesn't tell
us anything. This really comes in handy when paired with other queries.

## contactRelationships \([\[String\]](#string)\)
```graphql
{
  contactRelationships
}
```
The list of valid options for the 'Contact' custom field type

## countries \([\[Country\]](#country)\)

```graphql
# Request all country information for North America
{
  countries(countryCodes: ["USA", "CAN", "MEX"]) {
    countryCode
    name
    states {
      name
      stateCode
      country {
        name
      }
    }
  }
}
```

```graphql
# Request all country information for all countries
{
  countries {
    countryCode
    name
    states {
      name
      stateCode
      country {
        name
      }
    }
  }
}
```
The list of countries

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
countryCodes | [\[String\]](#string) |  |
## customField \([CustomField](#customfield)\)
```graphql
# Request custom field information for a custom field
{
  customField(id: "system.pronouns") {
    id
    name
    fieldType
    multipleChoiceOptions
    customFieldGroup {
      id
      name
    }
    teamCategory {
      id
      name
    }
    createdAt
    updatedAt
  }
}
```
Information about a custom field. The argument must be the permanent field id of the custom field.

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
id | [ID](#id) |  |
## customFields \([CustomFieldConnection](#customfieldconnection)\)
```graphql
# Request the first 5 custom fields after the cursor "NQ=="
{
  customFields(first: 5, after: "NQ==") {
    edges {
      node {
        name
        id
        teamCategory {
          id
          name
        }
        fieldType
        customFieldGroup {
          id
          name
        }
        multipleChoiceOptions
      }
    }
  }
}
```

```graphql
# Request the first 5 custom fields before the cursor "MTA="
{
  customFields(first: 5, before: "MTA=") {
    edges {
      node {
        name
        id
        teamCategory {
          id
          name
        }
        fieldType
        customFieldGroup {
          id
          name
        }
        multipleChoiceOptions
      }
      cursor
    }
  }
}
```

```graphql
# Request the first 10 custom fields with the field type 'text'
{
  customFields(first: 10, fieldTypes: [TEXT]) {
    edges {
      node {
        name
        id
        teamCategory {
          id
          name
        }
        fieldType
        customFieldGroup {
          id
          name
        }
        multipleChoiceOptions
      }
      cursor
    }
  }
}
```

```graphql
# Request the first 10 customFields in the list
{
  customFields(first: 10) {
    edges {
      node {
        name
        id
        teamCategory {
          id
          name
        }
        fieldType
        customFieldGroup {
          id
          name
        }
        multipleChoiceOptions
      }
      cursor
    }
  }
}
```

```graphql
# Request the last 10 customFields in the list
{
  customFields(last: 10) {
    edges {
      node {
        name
        id
        teamCategory {
          id
          name
        }
        fieldType
        customFieldGroup {
          id
          name
        }
        multipleChoiceOptions
      }
      cursor
    }
  }
}
```

```graphql
# Request custom fields with permanent field ids "department" and "location"
{
  customFields(first: 2, ids: ["department", "location"]) {
    edges {
      node {
        name
        id
        teamCategory {
          id
          name
        }
        fieldType
        customFieldGroup {
          id
          name
        }
        multipleChoiceOptions
      }
      cursor
    }
  }
}
```

A collection of custom fields

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
after | [String](#string) | Returns the elements in the list that come after the specified cursor. |
before | [String](#string) | Returns the elements in the list that come before the specified cursor. |
fieldTypes | [\[CustomFieldType\]](#customfieldtype) |  |
first | [Int](#int) | Returns the first _n_ elements from the list. |
ids | [\[ID\]](#id) |  |
last | [Int](#int) | Returns the last _n_ elements from the list. |
## department \([Department](#department)\)
```graphql
{
  department(id: 1) {
    id
    name
    externalId
  }
}
```
A single department

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
id | [Int](#int) |  |
## departments \([DepartmentConnection](#departmentconnection)\)
```graphql
# Request for the first 5 departments after cursor "NQ=="
{
  departments(first: 5, after: "NQ==") {
    edges {
      node {
       id
       name
       externalId
      }
      cursor
    }
  }
}
```

```graphql
# Request for the first 5 departments before cursor "NQ=="
{
  departments(first: 5, before: "NQ==") {
    edges {
      node {
       id
       name
       externalId
      }
      cursor
    }
  }
}
```

```graphql
# Request for first 10 departments in the list
{
  departments(first: 10) {
    edges {
      node {
       id
       name
       externalId
      }
      cursor
    }
  }
}
```

```graphql
# Request for the last 10 departments in the list
{
  departments(last: 10) {
    edges {
      node {
       id
       name
       externalId
      }
      cursor
    }
  }
}
```
All departments

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
after | [String](#string) | Returns the elements in the list that come after the specified cursor. |
before | [String](#string) | Returns the elements in the list that come before the specified cursor. |
first | [Int](#int) | Returns the first _n_ elements from the list. |
last | [Int](#int) | Returns the last _n_ elements from the list. |
## employee \([Employee](#employee)\)
```graphql
# Request for an employee
{
  employee(id: 5) {
    about
    createdAt
    dateOfBirth
    dateOfTermination
    department {
      id
      name
      externalId
    }
    documents {
      id
      file {
        fileUrl
        fileName
        fileSize
      }
    }
    email
    employmentStatus
    firstName
    greenhouseRecruitingData {
      applicationId
    }
    hrManager {
      id
      email
    }
    id
    lastName
    location {
      id
      name
      address
      externalId
    }
    manager {
      id
      email
    }
    middleName
    otherCriteria {
      id
      name
    }
    personalEmail
    phoneNumber
    preferredFirstName
    preferredLastName
    profileImage {
      fileUrl
      fileName
      fileSize
    }
    requiredFieldsCompletedAt
    startDate
    suffix
    title
    updatedAt
    workCountryCode
  }
}

```
```graphql
# Request an employee but limit their customFieldValues to those of specific customFields.
# The customFieldIds argument can be used when you are interested in only getting a specific
# customFieldValues for the employee.
{
  employee(id: 20) {
    customFieldValues(customFieldIds: ["emergency_contact", "favorite_food"]) {
      customField {
        id
        fieldType
      }
      value
    }
  }
}

```

```graphql
# Request an employee and limit their signatureRequests to those that are waiting on a signature or being processed
{
  employee(id: 20) {
    signatureRequests(statuses: [WAITING_FOR_SIGNATURE, BEING_PROCESSED]) {
      counterSigner {
        id
        email
      }
      file {
        fileUrl
      }
      status
      signatureRequestTemplate {
        publicName
        counterSigner {
          id
          email
        }
      }
    }
  }
}


```
An Onboarding employee record

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
id | [Int](#int) |  |
## employees \([EmployeeConnection](#employeeconnection)\)

```graphql
# Request employees after the cursor "NQ=="
{
  employees(first: 25, after: "NQ==") {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
      }
      cursor
    }
  }
}
```

```graphql
# Request employees before the cursor "MTM="
{
  employees(first: 25, before: "MTM=") {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      nodes {
        id
        email
      }
      cursor
    }
  }
}
```

```graphql
# Request only those employees that were createed before 12-13-2021 and after 10-01-2021. For each employee that
# fits that criteria, return their id and work email
{
  employees(first: 25, createdAt: {after: "2021-10-01T00:00:00+00:00", before: "2021-12-31T00:00:00+00:00" }) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
      }
    }
  }
}

```
```graphql
# Request only those employees that have a value (ANY value) set for the "favorite_food" Custom Field. For these employees, return
# ALL of their customFieldValues.
{
  employees(first: 25, customFieldValues: [{id: "favorite_food"}]) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
      }
    }
  }
}

```

```graphql
# Request only those employees that have "Hot Dogs" or "Chicken Nuggets" set for their "favorite_food" Custom Field.
# Because the "favorite_food" Custom Field is of type text, we provide the "textValues" argument (as opposed to
# dateValues or idValues)
{
  employees(
    first: 25,
    customFieldValues: [{id: "favorite_food", textValues: ["Hot Dogs", "Chicken Nuggets"]}]
  ) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        customFieldValues {
          customField {
            id
          }
          value
        }
      }
    }
  }
}

```

```graphql
# Request only those employees that have a value set for their "favorite_food" Custom Field and "Blue" for their
# "favorite_color" Custom Field. For each of these employees, return their ID and work email address.
{
  employees(
    first: 25,
    customFieldValues: [{id: "favorite_food"}, {id: "favorite_color", textValues: ["Blue"]}]
  ) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
      }
    }
  }
}

```

```graphql
# Request employees that have a value set for the "favorite_food" Custom Field. Return each employee's ID and
# customFieldValues, but only return the customFieldValue for the "favorite_food" customField.
{
  employees(
    first: 25,
    customFieldValues: [{ id: "favorite_food" }]
  ) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        customFieldValues(customFieldIds: ["favorite_food"]) {
          customField {
            id
          }
          value
        }
      }
    }
  }
}

```

```graphql
# Request employees that have a date value between "2017-04-13" and "2018-04-13" (exclusive) for the
# "1_year_anniversary" Custom Field. For each of these employees, return their ID and
# the value for the "1_year_anniversary" Custom Field (and only the value for this Custom Field).
{
  employees(
    first: 25,
    customFieldValues: [{ id: "1_year_anniversary", dateValue: { after: "2017-04-13", before: "2018-04-13" } }]
  ) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        customFieldValues(customFieldIds: ["1_year_anniversary"]) {
          customField {
            id
          }
          value
        }
      }
    }
  }
}

```

```graphql
# Request employees that have Employee 35 or Employee 40 set as the value for the "mentor" Custom Field. For each of
# these employees, return their id, work email address, and "about me" text.
{
  employees(
    first: 25,
    customFieldValues: [{id: "mentor", idValues: [35, 40]}]
  ) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
        about
      }
    }
  }
}

```

```graphql
# Request only those employees that have a dateOfBirth between 1989-12-31 and 2000-01-01.
# These dates are exclusive (e.g. someone who was born on 1989-12-31 or 2000-01-01 would not be included.
{
  employees(first: 25, dateOfBirthFilter: { dateFilter: { after: "1989-12-31", before: "2000-01-01" } }) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
        startDate
      }
    }
  }
}

```

```graphql
# Request only those employees that have a department set (department is not null). For each employee that fits the criteria,
# return their id and work email
{
  employees(first: 25, departmentFilter: { anyValue: true }) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
      }
    }
  }
}

```

```graphql
# Request only those employees that lack a department (department is null). For each employee that fits the criteria,
# return their id and work email
{
  employees(first: 25, departmentFilter: { noValue: true }) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
      }
    }
  }
}

```

```graphql
# Request only those employees that are in specific departments. For each employee that fits the criteria,
# return their id and work email
{
  employees(first: 25, departmentFilter: { departmentIds: [1, 3] }) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
      }
    }
  }
}

```

```graphql
# Request only those employees that have specific emails. For each employee that fits the criteria,
# return their id and work email
{
  employees(first: 25, emailFilter: { emails: ["john.doe@example.com"] }) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
      }
    }
  }
}
```

```graphql
# Request only those employees that have specific employment statuses. For each employee that fits the criteria,
# return their id and work email
{
  employees(first: 25, employmentStatusFilter: { employmentStatuses: ["Full-time", "Part-time"] }) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
      }
    }
  }
}
```

```graphql
# Request the first 10 employees in the list, For each employee return their id and work email
{
  employees(first: 10) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
      }
    }
  }
}
```


```graphql
# Request only those employees that have a specific hr manager or managers. For each employee that fits the criteria,
# return their id and work email
{
  employees(first: 25, hrManagerFilter: { hrManagerIds: [1, 2] }) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
      }
    }
  }
}
```

```graphql
# Request the last 10 employees in the list, For each employee return their id and work email
{
  employees(last: 10) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
      }
    }
  }
}
```

```graphql
# Request only those employees that are in a specific location or locations. For each employee that fits the criteria,
# return their id and work email
{
  employees(first: 25, locationFilter: { locationIds: [1, 2] }) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
      }
    }
  }
}
```

```graphql
# Request only those employees that have a specific manager or managers. For each employee that fits the criteria,
# return their id and work email
{
  employees(first: 25, managerFilter: { managerIds: [1, 2] }) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
      }
    }
  }
}
```

```graphql
# Request only those employees that have a specific personal email or emails. For each employee that fits the criteria,
# return their id and work email
{
  employees(first: 25, personalEmailFilter: { personalEmails: ["john.doe@example.com", "jon.doe2@example.com"] }) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
      }
    }
  }
}
```

```graphql
# Request only those employees that have a startDate between 2017-03-25 and 2018-03-25.
# These dates are exclusive (e.g. someone who started on 2017-03-25 or 2018-03-25 would not be included.
{
  employees(first: 25, startDateFilter: { dateFilter: { after: "2017-03-25", before: "2018-03-25" } }) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
        startDate
      }
    }
  }
}

```

```graphql
# Request only those employees that have title "Account Manager". For each employee that fits the criteria,
# return their id and work email
{
  employees(first: 25, titleFilter: { titles: ["Account Manager"] }) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
      }
    }
  }
}

```

```graphql
# Request only those employees in a specific country or countries (using workCountryCode). For each employee that fits the criteria,
# return their id and work email
{
  employees(first: 25, workCountryCodeFilter: { workCountryCodes: ["USA", "CAN"] }) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
      }
    }
  }
}

```

```graphql
# Request only those employees that were updated before 12-13-2021 and after 10-01-2021. For each employee that
# fits that criteria, return their id and work email
{
  employees(first: 25, updatedAt: {after: "2021-10-01T00:00:00+00:00", before: "2021-12-31T00:00:00+00:00" }) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        email
      }
    }
  }
}

```
A collection of Onboarding employee records. The following arguments are depreacated and should be avoided as support for them will be dropped: dateOfBirth, departmentIds, emails, employmentStatuses, hrManagerIds, locationIds, managerIds, personalEmails, startDate, titles, and workCountryCodes. Each of these arguments has a newer, more powerful companion named *Filter. For example, departmentIds has been replaced by the argument departmentFilter - which allows for the specification of department IDs, but also allows for more flexibility (e.g. filtering by lack/presence of a given field - as opposed to filtering by specific values).

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
after | [String](#string) | Returns the elements in the list that come after the specified cursor. |
before | [String](#string) | Returns the elements in the list that come before the specified cursor. |
createdAt | [DateTimeFilter](#datetimefilter) | filter employees based on when they were created |
customFieldValues | [\[CustomFieldValuesInput\]](#customfieldvaluesinput) | filter employees by their custom field values |
dateOfBirthFilter | [DateOfBirthFilter](#dateofbirthfilter) | filter employees by their date of birth |
departmentFilter | [DepartmentFilter](#departmentfilter) | filter employees by their department |
emailFilter | [EmailFilter](#emailfilter) | filter employees by their email |
employmentStatusFilter | [EmploymentStatusFilter](#employmentstatusfilter) | filter employees by their employment status |
first | [Int](#int) | Returns the first _n_ elements from the list. |
hrManagerFilter | [HrManagerFilter](#hrmanagerfilter) | filter employees by their hr manager |
last | [Int](#int) | Returns the last _n_ elements from the list. |
locationFilter | [LocationFilter](#locationfilter) | filter employees by their location |
managerFilter | [ManagerFilter](#managerfilter) | filter employees by their manager |
personalEmailFilter | [PersonalEmailFilter](#personalemailfilter) | filter employees by their personal email |
startDateFilter | [StartDateFilter](#startdatefilter) | filter employees by their start date |
titleFilter | [TitleFilter](#titlefilter) | filter employees by their title |
updatedAt | [DateTimeFilter](#datetimefilter) | filter employees based on when they were last updated |
workCountryCodeFilter | [WorkCountryCodeFilter](#workcountrycodefilter) | filter employees by their work country code |

## employmentStatuses \([\[String\]](#string)\)

```graphql
{
  employmentStatuses
}
```
The list of valid options for Employment Status

## location \([Location](#location)\)
```graphql
{
  location(id: 1) {
    id
    name
    address
    externalId
  }
}
```
A single location

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
id | [Int](#int) |  |
## locations \([LocationConnection](#locationconnection)\)
```graphql
# Request for first 10 locations after cursor "NQ=="
{
  locations(first: 10, after: "NQ==") {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        name
        address
        externalId
      }
      cursor
    }
  }
}
```

```graphql
# Request for first 10 locations before cursor "NQ=="
{
  locations(first: 10, before: "NQ==") {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        name
        address
        externalId
      }
      cursor
    }
  }
}
```

```graphql
# Request for first 10 locations in the list
{
  locations(first: 10) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        name
        address
        externalId
      }
      cursor
    }
  }
}
```

```graphql
# Request for last 10 locations in the list
{
  locations(last: 10) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        name
        address
        externalId
      }
      cursor
    }
  }
}
```
All locations

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
after | [String](#string) | Returns the elements in the list that come after the specified cursor. |
before | [String](#string) | Returns the elements in the list that come before the specified cursor. |
first | [Int](#int) | Returns the first _n_ elements from the list. |
last | [Int](#int) | Returns the last _n_ elements from the list. |
## otherCriteria \([OtherCriterionConnection](#othercriterionconnection)\)
```graphql
# Request for first 10 other criteria after cursor "NQ=="
{
  otherCriteria(first: 10, after: "NQ==") {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        name
        createdAt
        updatedAt
      }
      cursor
    }
  }
}
```

```graphql
# Request for first 10 other criteria before cursor "NQ=="
{
  otherCriteria(first: 10, before: "NQ==") {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        name
        createdAt
        updatedAt
      }
      cursor
    }
  }
}
```

```graphql
# Request for first 10 other criteria in the list
{
  otherCriteria(first: 10) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        name
        createdAt
        updatedAt
      }
      cursor
    }
  }
}
```

```graphql
# Request for last 10 other criteria in the list
{
  otherCriteria(last: 10) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        name
        createdAt
        updatedAt
      }
      cursor
    }
  }
}
```
All other criteria

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
after | [String](#string) | Returns the elements in the list that come after the specified cursor. |
before | [String](#string) | Returns the elements in the list that come before the specified cursor. |
first | [Int](#int) | Returns the first _n_ elements from the list. |
last | [Int](#int) | Returns the last _n_ elements from the list. |
## otherCriterion \([OtherCriterion](#othercriterion)\)
```graphql
{
  otherCriterion(id: 1) {
    id
    name
    createdAt
    updatedAt
  }
}
```
A single other criterion

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
id | [Int](#int) |  |
## rateLimit \([RateLimit](#ratelimit)\)
```graphql
{
  rateLimit {
    cost
    limit
    remaining
    resetAt
  }
}
```
Information about your current API quota

## team \([Team](#team)\)
```graphql
{
  team(id: 1) {
    id
    name
    description
    email
    location
    name
    teamCategory {
      id
      name
    }
  }
}

```
A single team

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
id | [Int](#int) |  |
## teamCategories \([TeamCategoryConnection](#teamcategoryconnection)\)
```graphql
# Request for first 5 team categories after cursor "NQ=="
{
  teamCategories(first: 5, after: "NQ==") {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        name
      }
      cursor
    }
  }
}
```

```graphql
# Request for first 5 team categories before cursor "NQ=="
{
  teamCategories(first: 5, before: "NQ==") {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        name
      }
      cursor
    }
  }
}
```

```graphql
# Request for first 5 team categories in the list
{
  teamCategories(first: 5) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        name
      }
      cursor
    }
  }
}
```

```graphql
# Request for last 5 team categories in the list
{
  teamCategories(last: 10) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        name
      }
      cursor
    }
  }
}
```
All team categories

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
after | [String](#string) | Returns the elements in the list that come after the specified cursor. |
before | [String](#string) | Returns the elements in the list that come before the specified cursor. |
first | [Int](#int) | Returns the first _n_ elements from the list. |
last | [Int](#int) | Returns the last _n_ elements from the list. |
## teamCategory \([TeamCategory](#teamcategory)\)
```graphql
{
  teamCategory(id: 1) {
    id
    name
  }
}
```
A single team category

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
id | [Int](#int) |  |
## teams \([TeamConnection](#teamconnection)\)
```graphql
# Request for first 10 teams after cursor "NQ=="
{
  teams(first: 10, after: "NQ==") {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        name
        description
        email
        location
        name
        teamCategory {
          id
          name
        }
      }
      cursor
    }
  }
}
```

```graphql
# Request for first 10 teams before cursor "NQ=="
{
  teams(first: 10, before: "NQ==") {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        name
        description
        email
        location
        name
        teamCategory {
          id
          name
        }
      }
      cursor
    }
  }
}
```

```graphql
# Request for first 10 teams in the list
{
  teams(first: 10) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        name
        description
        email
        location
        name
        teamCategory {
          id
          name
        }
      }
      cursor
    }
  }
}
```

```graphql
# Request for last 10 teams in the list
{
  teams(last: 10) {
    pageInfo {
      hasNextPage
      endCursor
    }
    edges {
      node {
        id
        name
        description
        email
        location
        name
        teamCategory {
          id
          name
        }
      }
      cursor
    }
  }
}
```
All teams

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
after | [String](#string) | Returns the elements in the list that come after the specified cursor. |
before | [String](#string) | Returns the elements in the list that come before the specified cursor. |
first | [Int](#int) | Returns the first _n_ elements from the list. |
last | [Int](#int) | Returns the last _n_ elements from the list. |
# Mutations
## addDepartment \([AddDepartmentPayload](#adddepartmentpayload)\)
```graphql
# Create a Department
mutation {
  addDepartment(
    addDepartmentInput: {
      name: "Engineering"
      externalId: "123"
    }
  ) {
    department {
      id
      name
      externalId
    }
  }
}
```
Add a new Department

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
addDepartmentInput | [AddDepartmentInput!](#adddepartmentinput) |  | Required
## addLocation \([AddLocationPayload](#addlocationpayload)\)
```graphql
# Create a Location
mutation {
  addLocation(
    addLocationInput: {
      name: "Denver, CO"
      address: "1801 Broadway, 13th Floor, Denver, CO 80202"
      externalId: "123"
    }
  ) {
    location {
      id
      name
      address
      externalId
    }
  }
}
```
Add a new Location

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
addLocationInput | [AddLocationInput!](#addlocationinput) |  | Required
## addPendingHire \([PendingHire](#pendinghire)\)
```graphql
# Create a PendingHire with required information as well as a value for a text Custom Field (long text, confirmable,
# and multiple_choice Custom Fields also take Strings as the "value").
mutation {
  addPendingHire(
    pendingHireInfo: {
      firstName: "Joe"
      lastName: "Schmoe"
      email: "joe123@example.com"
      workCountryCode: "USA"
      customFieldValues: [
        { customFieldId: "favorite_food", value: "Egg McMuffins" }
      ]
    }
  ) {
    firstName
    lastName
    email
    workCountryCode
    customFieldValues(customFieldIds: ["favorite_food"]) {
      customField { id }
      value
    }
  }
}

```

```graphql
# Create a PendingHire with required information as well as a value for a Multiple Select Custom Field. These Custom
# Fields require a JSON Array-formatted string (including escaped quotes) for the "value". Also of note, each of the
# elements in the array must be a valid option for the given Custom Field.
mutation {
  addPendingHire(
    pendingHireInfo: {
      firstName: "Joe"
      lastName: "Schmoe"
      email: "joe123@example.com"
      workCountryCode: "USA"
      customFieldValues: [
        { customFieldId: "required_equipment", value: "[\"Ergonomic Keyboard\", \"Standing Desk\"]" }
      ]
    }
  ) {
    firstName
    lastName
    email
    workCountryCode
    customFieldValues(customFieldIds: ["required_equipment"]) {
      customField { id }
      value
    }
  }
}

```

```graphql
# Create a PendingHire with required information as well as a value for a Team Custom Field. These Custom Fields
# require an ID for the "value."
mutation {
  addPendingHire(
    pendingHireInfo: {
      firstName: "Joe"
      lastName: "Schmoe"
      email: "joe123@example.com"
      workCountryCode: "USA"
      customFieldValues: [
        { customFieldId: "primary_social_club", value: 14 }
      ]
    }
  ) {
    firstName
    lastName
    email
    workCountryCode
    customFieldValues {
      customField { id }
      value
    }
  }
}

```

```graphql
# Create a PendingHire with required information as well as a value for an Address Custom Field. These Custom
# Fields require a JSON Object-formatted string (including escaped quotes) for the "value".
mutation {
  addPendingHire(
    pendingHireInfo: {
      firstName: "Joe"
      lastName: "Schmoe"
      email:"joe123@example.com"
      workCountryCode: "USA"
      customFieldValues: [
        {
          customFieldId: "address",
          value: "{\"address_line_1\":\"123 Test Street\",\"address_line_2\":\"Apartment 1\",\"city\":\"Pawnee\", \"state\":\"IN\", \"zipcode\":\"12345\",\"country\":\"USA\"}"
        }
      ]
    }
  ) {
    firstName
    lastName
    email
    workCountryCode
    customFieldValues(customFieldIds: ["address"]) {
      customField { id }
      value
    }
  }
}

```

```graphql
# Create a PendingHire with required information as well as a value for a Contact Custom Field. These Custom
# Fields require a JSON Object-formatted string (including escaped quotes) for the "value".
mutation {
  addPendingHire(
    pendingHireInfo: {
      firstName: "Joe"
      lastName: "Schmoe"
      email:"joe123@example.com"
      workCountryCode: "USA"
      customFieldValues: [
        {
          customFieldId: "emergency_contact",
          value: "{\"first_name\": \"Joe\", \"last_name\": \"Schmoe\", \"email\":\"jschmoe@aol.com\", \"phone\": \"123.456.7890\", \"relationship\": \"Other\"}" }
      ]
    }
  ) {
    firstName
    lastName
    email
    workCountryCode
    customFieldValues(customFieldIds: ["emergency_contact"]) {
      customField { id }
      value
    }
  }
}

```

```graphql
# Create a PendingHire with required information as well as a value for a Date Custom Field. These Custom Fields
# require a String formatted as such: YYYY-MM-DD.
mutation {
  addPendingHire(
    pendingHireInfo: {
      firstName: "Joe"
      lastName: "Schmoe"
      email:"joe123@example.com"
      workCountryCode: "USA"
      customFieldValues: [
        { customFieldId: "fully_vested", value: "2019-12-12" }
      ]
    }
  ) {
    firstName
    lastName
    email
    workCountryCode
    customFieldValues(customFieldIds: ["fully_vested"]) {
      customField { id }
      value
    }
  }
}

```
Add a Pending Hire to Greenhouse Onboarding

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
pendingHireInfo | [AddPendingHireInput!](#addpendinghireinput) |  | Required
## deleteDepartment \([DeleteDepartmentPayload](#deletedepartmentpayload)\)
```graphql
# Delete a department by the department id
mutation {
  deleteDepartment(deleteDepartmentInput: {id: 1}) {
    deletedDepartmentId
  }
}
```
Delete a Department

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
deleteDepartmentInput | [DeleteDepartmentInput!](#deletedepartmentinput) |  | Required
## deleteLocation \([DeleteLocationPayload](#deletelocationpayload)\)
```graphql
# Delete a location by the location id
mutation {
  deleteLocation(deleteLocationInput: {id: 1}) {
    deletedLocationId
  }
}
```
Delete a Location

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
deleteLocationInput | [DeleteLocationInput!](#deletelocationinput) |  | Required
## updateDepartment \([UpdateDepartmentPayload](#updatedepartmentpayload)\)
```graphql
# Update a department's name. Must provide the id of an existing department
mutation {
  updateDepartment(
    updateDepartmentInput: {
      id: 1
      name: "Data Science"
      externalId: "123"
    }
  ) {
    department {
      id
      name
      externalId
    }
  }
}
```
Update a Department

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
updateDepartmentInput | [UpdateDepartmentInput!](#updatedepartmentinput) |  | Required
## updateEmployeeProfile \([Employee](#employee)\)
```graphql
# Update an employee's work email address, date of birth, and department. Return these fields to confirm the change.
mutation {
  updateEmployeeProfile(
    id: 25,
    employeeUpdates: {
      email: "new_email_address@example.com"
      dateOfBirth: "1985-04-07"
      department: 1
    }
  ) {
    email
    dateOfBirth
    department {
      id
    }
  }
}

```

```graphql
# Update/create the value for a text, long text, confirmable, or multiple_choice Custom Field. For Custom Fields of
# these types, provide a string for the value. Here we update the "favorite_food" Custom Field Value (a text Custom
# Field) to "Egg McMuffins". We ask for the employee's customFieldValues, but we limit them to those that
# belong to the "favorite_food" Custom Field. E.g. we filter out the irrelevant customFieldValues.
mutation {
  updateEmployeeProfile(
    id: 20,
    employeeUpdates: {
      customFieldValues: [
        { customFieldId: "favorite_food", value: "Egg McMuffins" }
      ]
    }
  ) {
    customFieldValues(customFieldIds: ["favorite_food"]) {
      customField {
        id
      }
      value
    }
  }
}

```

```graphql
# Update/create the value for a Multiple Select Custom Field. For these Custom Fields, "value" must be a string
# representing a JSON Array (including escaped quotation marks).  Also of note, each of the values of this array must
# be one of the pre-defined values for the given Custom Field.  Here, we set the "required_equipment" Custom Field Value
# to contain "Ergonomic Keyboard" and "Standing Desk". We then request the updated Employee's value for this Custom Field
# to confirm the change.
mutation {
  updateEmployeeProfile(
    id: 20,
    employeeUpdates: {
      customFieldValues: [
        { customFieldId: "required_equipment", value: "[\"Ergonomic Keyboard\", \"Standing Desk\"]" }
      ]
    }
  ) {
    customFieldValues(customFieldIds: ["required_equipment"]) {
      customField {
        id
        fieldType
      }
      value
    }
  }
}

```

```graphql
# Update/create the value for a Team Custom Field. For Custom Fields of type "Team" we provide an ID as the
# value.  This value represents the ID of the new Team.  Here we change the this employees "primary_social_club" to be
# Team 14.  These Team IDs can be found by utilizing the team query.
mutation {
  updateEmployeeProfile(
    id: 20,
    employeeUpdates: {
      customFieldValues: [
        { customFieldId: "primary_social_club", value: 14 }
      ]
    }
  ) {
    customFieldValues(customFieldIds: ["primary_social_club"]) {
      customField {
        id
        fieldType
      }
      value
    }
  }
}

```

```graphql
# Update/create the value for an Address Custom Field. These Custom Fields require a String value.  This String value
# must be a JSON Object (with quotes escaped accordingly).
mutation {
  updateEmployeeProfile(
    id: 20,
    employeeUpdates: {
      customFieldValues: [
        {
          customFieldId: "address",
          value: "{\"address_line_1\":\"123 Test Street\",\"address_line_2\":\"Apartment 1\",\"city\":\"Pawnee\", \"state\":\"IN\", \"zipcode\":\"12345\",\"country\":\"USA\"}"
        }
      ]
    }
  ) {
    customFieldValues(customFieldIds: ["address"]) {
      customField {
        id
      }
      value
    }
  }
}

```

```graphql
# Update/create the value for a Contact Custom Field. These Custom Fields require a String value. This String value
# must be a JSON Object (with quotes escaped accordingly).
mutation {
  updateEmployeeProfile(
    id: 20,
    employeeUpdates: {
      customFieldValues: [
        {
          customFieldId: "emergency_contact",
          value: "{\"first_name\": \"Joe\", \"last_name\": \"Schmoe\", \"email\":\"jschmoe@aol.com\", \"phone\": \"123.456.7890\", \"relationship\": \"Other\"}" }
      ]
    }
  ) {
    customFieldValues(customFieldIds: ["emergency_contact"]) {
      customField {
        id
        fieldType
      }
      value
    }
  }
}

```

```graphql
# Update/create the value for a date Custom Field. These Custom Fields require a String formatted as such: YYYY-MM-DD
mutation {
  updateEmployeeProfile(
    id: 20,
    employeeUpdates: {
      customFieldValues: [
        { customFieldId: "fully_vested", value: "2019-12-12" }
      ]
    }
  ) {
    customFieldValues(customFieldIds: ["fully_vested"]) {
      customField {
        id
        fieldType
      }
      value
    }
  }
}

```

```graphql
# Terminate an employee. Both employment status and date of termination are required.
# Date of termination can be in the past for immediate termination or in the future.
mutation {
  updateEmployeeProfile(
    id: 20,
    employeeUpdates: {
      employmentStatus: "Terminated"
      customFieldValues: {
        customFieldId: "system.date_of_termination"
        value: "2020-01-01"
      }
    }
  ) {
    id
    employmentStatus
    dateOfTermination
  }
}

```
Update an employee's profile

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
employeeUpdates | [UpdateEmployee!](#updateemployee) |  | Required
id | [ID!](#id) |  | Required
## updateLocation \([UpdateLocationPayload](#updatelocationpayload)\)
```graphql
# Update a location. Must provide the id of an existing location.
mutation {
  updateLocation(
    updateLocationInput: {
      id: 22
      name: "San Francisco, CA"
      address: "575 Market Street, Suite #1750, San Francisco, CA 94105"
      externalId: "123"
    }
  ) {
    location {
      id
      name
      address
      externaId
    }
  }
}
```
Update a Location

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
updateLocationInput | [UpdateLocationInput!](#updatelocationinput) |  | Required
# Types
## AddDepartmentPayload
The result of running an addDepartment mutation

Field | Type | Description
--------- | ----------- | -----------
department | [Department](#department) | The new department

## AddLocationPayload
The result of running an addLocation mutation

Field | Type | Description
--------- | ----------- | -----------
location | [Location](#location) | The new location

## ComplexityInfo
Information about the current request's complexity. If the complexity exceeds the maxium, the request will fail

Field | Type | Description
--------- | ----------- | -----------
maximum | [Int!](#int) |
score | [Int!](#int) |

## Country
A country

Field | Type | Description
--------- | ----------- | -----------
countryCode | [String!](#string) |
name | [String!](#string) |
states | [\[State!\]!](#state) |

## CustomField
Represents a single CustomField record for your company. CustomFields can be stored and displayed in a variety of ways. The types are described via the [CustomFieldTypes](#customfieldtypes) enum.

Field | Type | Description
--------- | ----------- | -----------
createdAt | [DateTime!](#datetime) |
customFieldGroup | [CustomFieldGroup](#customfieldgroup) |
fieldType | [CustomFieldType!](#customfieldtype) | The field type determines how users input and view the data for this field.
id | [String!](#string) | A unique identifier for this CustomField.
multipleChoiceOptions | [\[String!\]](#string) |
name | [String!](#string) | The name of this custom field as users would see it inside Greenhouse Onboarding.
teamCategory | [TeamCategory](#teamcategory) |
updatedAt | [DateTime!](#datetime) |

## CustomFieldConnection
The connection type for CustomField.

Field | Type | Description
--------- | ----------- | -----------
edges | [\[CustomFieldEdge\]](#customfieldedge) | A list of edges.
nodes | [\[CustomField\]](#customfield) | A list of nodes.
pageInfo | [PageInfo!](#pageinfo) | Information to aid in pagination.

## CustomFieldEdge
An edge in a connection.

Field | Type | Description
--------- | ----------- | -----------
cursor | [String!](#string) | A cursor for use in pagination.
node | [CustomField](#customfield) | The item at the end of the edge.

## CustomFieldGroup
A Group of Custom Field

Field | Type | Description
--------- | ----------- | -----------
id | [ID!](#id) |
name | [String!](#string) |

## CustomFieldValue
A Custom Field Value Record

Field | Type | Description
--------- | ----------- | -----------
createdAt | [DateTime!](#datetime) |
customField | [CustomField!](#customfield) |
updatedAt | [DateTime!](#datetime) |
value | [Value](#value) | A different type of value will be stored based upon the field type of the [CustomField](#customfield). Some types have the data stored as a nested object. Note that the type is a scalar named [Value](#value). Even though it appears to be an object, you are not able to use GraphQL to determine its shape.
valueUpdatedAt | [DateTime!](#datetime) | The time of the most recent update to this field.

## DeleteDepartmentPayload
The result of running an deleteDepartment mutation

Field | Type | Description
--------- | ----------- | -----------
deletedDepartmentId | [ID](#id) | The ID of the department that was just deleted

## DeleteLocationPayload
The result of running an deleteLocation mutation

Field | Type | Description
--------- | ----------- | -----------
deletedLocationId | [ID](#id) | The ID of the location that was just deleted

## Department
Represents a single department in your company. Employees may belong to zero or one department. Departments are used in a variety of ways in Greenhouse Onboarding, including permissions and onboarding plans.

Field | Type | Description
--------- | ----------- | -----------
createdAt | [DateTime!](#datetime) |
externalId | [String](#string) |
id | [ID!](#id) |
name | [String!](#string) |
updatedAt | [DateTime!](#datetime) |

## DepartmentConnection
The connection type for Department.

Field | Type | Description
--------- | ----------- | -----------
edges | [\[DepartmentEdge\]](#departmentedge) | A list of edges.
nodes | [\[Department\]](#department) | A list of nodes.
pageInfo | [PageInfo!](#pageinfo) | Information to aid in pagination.

## DepartmentEdge
An edge in a connection.

Field | Type | Description
--------- | ----------- | -----------
cursor | [String!](#string) | A cursor for use in pagination.
node | [Department](#department) | The item at the end of the edge.

## Document
Represents a single document attached to an [Employee](#employee).

Field | Type | Description
--------- | ----------- | -----------
createdAt | [DateTime!](#datetime) |
file | [File](#file) | Contains the file payload.
id | [ID!](#id) |
updatedAt | [DateTime!](#datetime) |

## Employee
A single Employee that works for your company. Employees have first class fields (e.g. title, start_date, email), and they also hold custom_field_values for user defined custom fields. These secondary values are held within the customFieldValues array.

Field | Type | Description
--------- | ----------- | -----------
about | [String](#string) | A brief description of the employee. This information is displayed on both the employee's profile and is also featured prominently in the Welcome Experience for any new hires that report to this employee.
createdAt | [DateTime!](#datetime) |
customFieldValues | [\[CustomFieldValue!\]](#customfieldvalue) | A list of all other profile information for this employee. Administrators can configure these fields on the [Settings > Custom Fields](https://onboarding.greenhouse.io/settings/fields) page.
dateOfBirth | [Date](#date) | Note that only administrators can see the birth year for employees
dateOfTermination | [Date](#date) | This information is only available on terminated employees
department | [Department](#department) |
documents | [\[Document!\]](#document) | These are documents that came over from Greenhouse Recruiting or were attached directly to the employee profile. This does _not_ include E-Signature requests.
email | [String](#string) | The employee's work email. They need this in order to sign in.
employmentStatus | [String](#string) | [Valid options](#employmentstatuses-string)
firstName | [String](#string) |
greenhouseRecruitingData | [GreenhouseRecruitingData](#greenhouserecruitingdata) | The Greenhouse Recruiting 'hired' webhook data
hrManager | [Employee](#employee) | The employee's HR Manager.
id | [ID!](#id) |
lastName | [String](#string) |
location | [Location](#location) |
manager | [Employee](#employee) | This employee's direct manager.
middleName | [String](#string) |
otherCriteria | [\[OtherCriterion!\]](#othercriterion) |
personalEmail | [String](#string) | The employee's personal email.
phoneNumber | [String](#string) |
preferredFirstName | [String](#string) | This is the name that your employee prefers to go by. If this value is set, Greenhouse Onboarding will display this name everywhere in the product instead of the employee's legal name.
preferredLastName | [String](#string) | This is the name that your employee prefers to go by. If this value is set, Greenhouse Onboarding will display this name everywhere in the product instead of the employee's legal name.
profileImage | [File](#file) | A file containing the employee's profile image. This image is displayed in emails, reports and directory pages.
signatureRequests | [\[SignatureRequest!\]](#signaturerequest) | These are E-Signature requests initiated through Greenhouse Onboarding. Keep in mind that these requests can be in a number of different states in their lifecycle and may not always have a signed document available to download.
startDate | [Date](#date) |
suffix | [String](#string) |
title | [String](#string) | The employee's job title.
updatedAt | [DateTime!](#datetime) |
workCountryCode | [String!](#string) |

## EmployeeConnection
The connection type for Employee.

Field | Type | Description
--------- | ----------- | -----------
edges | [\[EmployeeEdge\]](#employeeedge) | A list of edges.
nodes | [\[Employee\]](#employee) | A list of nodes.
pageInfo | [PageInfo!](#pageinfo) | Information to aid in pagination.

## EmployeeEdge
An edge in a connection.

Field | Type | Description
--------- | ----------- | -----------
cursor | [String!](#string) | A cursor for use in pagination.
node | [Employee](#employee) | The item at the end of the edge.

## File
A File record

Field | Type | Description
--------- | ----------- | -----------
expiresAt | [DateTime](#datetime) | The time when the URL will expire. After this time, you will need to generate a new URL.
fileName | [String](#string) | The original name of the file.
fileSize | [Int](#int) | The file size, in bytes
fileUrl | [String](#string) | An expiring URL you can use to download the file.

## GreenhouseRecruitingData
Greenhouse Recruiting 'Candidate hired' webhook data

Field | Type | Description
--------- | ----------- | -----------
applicationId | [ID!](#id) | Greenhouse Recruiting application ID
rawData | [String!](#string) | Greenhouse Recruiting 'Candidate hired' webhook payload

## Location
Represents a single location in your company. Employees may belong to zero or one location. Locations are used in a variety of ways in Greenhouse Onboarding, including permissions and onboarding plans.

Field | Type | Description
--------- | ----------- | -----------
address | [String](#string) |
createdAt | [DateTime](#datetime) |
externalId | [String](#string) |
id | [ID](#id) |
name | [String](#string) |
updatedAt | [DateTime](#datetime) |

## LocationConnection
The connection type for Location.

Field | Type | Description
--------- | ----------- | -----------
edges | [\[LocationEdge\]](#locationedge) | A list of edges.
pageInfo | [PageInfo!](#pageinfo) | Information to aid in pagination.

## LocationEdge
An edge in a connection.

Field | Type | Description
--------- | ----------- | -----------
cursor | [String!](#string) | A cursor for use in pagination.
node | [Location](#location) | The item at the end of the edge.

## Mutation


Field | Type | Description
--------- | ----------- | -----------
addDepartment | [AddDepartmentPayload](#adddepartmentpayload) | Add a new Department
addLocation | [AddLocationPayload](#addlocationpayload) | Add a new Location
addPendingHire | [PendingHire](#pendinghire) | Add a Pending Hire to Greenhouse Onboarding
deleteDepartment | [DeleteDepartmentPayload](#deletedepartmentpayload) | Delete a Department
deleteLocation | [DeleteLocationPayload](#deletelocationpayload) | Delete a Location
updateDepartment | [UpdateDepartmentPayload](#updatedepartmentpayload) | Update a Department
updateEmployeeProfile | [Employee](#employee) | Update an employee's profile
updateLocation | [UpdateLocationPayload](#updatelocationpayload) | Update a Location

## OtherCriterion
A tag that can be used to refine on onboarding plan

Field | Type | Description
--------- | ----------- | -----------
createdAt | [DateTime](#datetime) |
id | [ID](#id) |
name | [String](#string) |
updatedAt | [DateTime](#datetime) |

## OtherCriterionConnection
The connection type for OtherCriterion.

Field | Type | Description
--------- | ----------- | -----------
edges | [\[OtherCriterionEdge\]](#othercriterionedge) | A list of edges.
pageInfo | [PageInfo!](#pageinfo) | Information to aid in pagination.

## OtherCriterionEdge
An edge in a connection.

Field | Type | Description
--------- | ----------- | -----------
cursor | [String!](#string) | A cursor for use in pagination.
node | [OtherCriterion](#othercriterion) | The item at the end of the edge.

## PageInfo
Information about pagination in a connection.

Field | Type | Description
--------- | ----------- | -----------
endCursor | [String](#string) | When paginating forwards, the cursor to continue.
hasNextPage | [Boolean!](#boolean) | When paginating forwards, are there more items?
hasPreviousPage | [Boolean!](#boolean) | When paginating backwards, are there more items?
startCursor | [String](#string) | When paginating backwards, the cursor to continue.

## PendingHire
A Pending Hire Record

Field | Type | Description
--------- | ----------- | -----------
about | [String](#string) |
createdAt | [DateTime](#datetime) |
customFieldValues | [\[CustomFieldValue\]](#customfieldvalue) |
dateOfBirth | [Date](#date) |
department | [Department](#department) |
email | [String](#string) |
employmentStatus | [String](#string) | [Valid options](#employmentstatuses-string)
firstName | [String](#string) |
hrManager | [Employee](#employee) |
id | [ID](#id) |
lastName | [String](#string) |
location | [Location](#location) |
manager | [Employee](#employee) |
personalEmail | [String](#string) |
phoneNumber | [String](#string) |
preferredFirstName | [String](#string) |
preferredLastName | [String](#string) |
startDate | [Date](#date) |
title | [String](#string) |
updatedAt | [DateTime](#datetime) |
workCountryCode | [String](#string) |

## RateLimit
Information about your current API quota

Field | Type | Description
--------- | ----------- | -----------
cost | [Int](#int) | The cost of this query. This amount was deducted from your previous quota.
limit | [Int](#int) | Your quota for the given period.
remaining | [Int](#int) | The remaining balance for your quota. Any calls that exceed this value will be throttled.
resetAt | [DateTime](#datetime) | The time when your quota is reset to its maximum value.

## SignatureRequest
An E-Signature Request for assigned to an [Employee](#employee).

Field | Type | Description
--------- | ----------- | -----------
counterSigner | [Employee](#employee) | The employee responsible for counter-signing this document, if applicable.
createdAt | [DateTime](#datetime) |
file | [File](#file) | This is available only for completed signatures.
id | [ID](#id) |
signatureRequestTemplate | [SignatureRequestTemplate!](#signaturerequesttemplate) |
status | [SignatureRequestStatus](#signaturerequeststatus) |
updatedAt | [DateTime](#datetime) |

## SignatureRequestTemplate
A template used when assigning signature requests.

Field | Type | Description
--------- | ----------- | -----------
counterSigner | [Employee](#employee) | The default employee responsible for counter-signing documents created from this template, if applicable. Individual SignatureRequest objects can override the counter signer.
createdAt | [DateTime](#datetime) |
name | [String](#string) | The name of the template. This is the label administrators will see.
publicName | [String](#string) | The public-facing name of the template. This is the name the new hire will see. If this is null, new hires will see the name field.
updatedAt | [DateTime](#datetime) |

## State
A state

Field | Type | Description
--------- | ----------- | -----------
country | [Country](#country) |
name | [String](#string) |
stateCode | [String](#string) |

## Team
A Team record

Field | Type | Description
--------- | ----------- | -----------
description | [String](#string) |
email | [String](#string) |
id | [ID](#id) |
location | [String](#string) |
name | [String](#string) |
teamCategory | [TeamCategory](#teamcategory) |

## TeamCategory
A Team Category Record

Field | Type | Description
--------- | ----------- | -----------
id | [ID](#id) |
name | [String](#string) |

## TeamCategoryConnection
The connection type for TeamCategory.

Field | Type | Description
--------- | ----------- | -----------
edges | [\[TeamCategoryEdge\]](#teamcategoryedge) | A list of edges.
pageInfo | [PageInfo!](#pageinfo) | Information to aid in pagination.

## TeamCategoryEdge
An edge in a connection.

Field | Type | Description
--------- | ----------- | -----------
cursor | [String!](#string) | A cursor for use in pagination.
node | [TeamCategory](#teamcategory) | The item at the end of the edge.

## TeamConnection
The connection type for Team.

Field | Type | Description
--------- | ----------- | -----------
edges | [\[TeamEdge\]](#teamedge) | A list of edges.
pageInfo | [PageInfo!](#pageinfo) | Information to aid in pagination.

## TeamEdge
An edge in a connection.

Field | Type | Description
--------- | ----------- | -----------
cursor | [String!](#string) | A cursor for use in pagination.
node | [Team](#team) | The item at the end of the edge.

## UpdateDepartmentPayload
The result of running an updateDepartment mutation

Field | Type | Description
--------- | ----------- | -----------
department | [Department](#department) | The updated department

## UpdateLocationPayload
The result of running an updateLocation mutation

Field | Type | Description
--------- | ----------- | -----------
location | [Location](#location) | The updated location

# Input Objects
## AddDepartmentInput
The input object used to add a [Department](#department).

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
externalId | [String](#string) |  |
name | [String](#string) |  | Required

## AddLocationInput
The input object used to add a [Location](#location).

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
address | [String](#string) |  |
externalId | [String](#string) |  |
name | [String](#string) |  | Required

## AddPendingHireInput
Specify the properties of a new PendingHire

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
about | [String](#string) |  |
customFieldValues | [\[UpdateCustomFieldValue\]](#updatecustomfieldvalue) |  |
dateOfBirth | [Date](#date) |  |
department | [ID](#id) |  |
email | [String](#string) |  | Required
employmentStatus | [String](#string) | [Valid options](#employmentstatuses-string) |
firstName | [String!](#string) |  | Required
hrManager | [ID](#id) |  |
lastName | [String!](#string) |  | Required
location | [ID](#id) |  |
manager | [ID](#id) |  |
middleName | [String](#string) |  |
personalEmail | [String](#string) |  |
phoneNumber | [String](#string) |  |
preferredFirstName | [String](#string) |  |
preferredLastName | [String](#string) |  |
startDate | [Date](#date) |  |
suffix | [String](#string) |  |
title | [String](#string) |  |
workCountryCode | [String!](#string) |  | Required

## CustomFieldValuesInput
Limit employees to those that satisfy the specified CustomFieldValue criteria. Note: CustomFieldValues that belong to a CustomField with a CustomFieldType of "MASKED", are not filterable by textValues

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
dateValue | [DateFilter](#datefilter) |  |
id | [String!](#string) |  | Required
idValues | [\[Int\]](#int) |  |
textValues | [\[String\]](#string) |  |

## DateFilter
Specify a range of dates using after (exclusive >), before (exclusive <), or on (exact match)

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
after | [Date](#date) |  |
before | [Date](#date) |  |
on | [Date](#date) |  |

## DateOfBirthFilter
Filter employees based on their date of birth

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
anyValue | [Boolean](#boolean) |  |
dateFilter | [DateFilter](#datefilter) |  |
noValue | [Boolean](#boolean) |  |

## DateTimeFilter
Specify a range of datetimes using after (exclusive >), before (exclusive <)

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
after | [DateTime](#datetime) |  |
before | [DateTime](#datetime) |  |

## DeleteDepartmentInput
The input object used to delete a [Department](#department).

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
id | [ID!](#id) |  | Required

## DeleteLocationInput
The input object used to delete a [Location](#location).

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
id | [ID!](#id) |  | Required

## DepartmentFilter
Filter employees based on their department

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
anyValue | [Boolean](#boolean) |  |
departmentIds | [\[Int\]](#int) |  |
noValue | [Boolean](#boolean) |  |

## EmailFilter
Filter employees based on their email address

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
anyValue | [Boolean](#boolean) |  |
emails | [\[String\]](#string) |  |
noValue | [Boolean](#boolean) |  |

## EmploymentStatusFilter
Filter employees based on their Employment Status

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
anyValue | [Boolean](#boolean) |  |
employmentStatuses | [\[String\]](#string) | [Valid options](#employmentstatuses-string) |
noValue | [Boolean](#boolean) |  |

## HrManagerFilter
Filter employees based on their HR Manager

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
anyValue | [Boolean](#boolean) |  |
hrManagerIds | [\[Int\]](#int) |  |
noValue | [Boolean](#boolean) |  |

## LocationFilter
Filter employees based on their location

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
anyValue | [Boolean](#boolean) |  |
locationIds | [\[Int\]](#int) |  |
noValue | [Boolean](#boolean) |  |

## ManagerFilter
Filter employees based on their Manager

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
anyValue | [Boolean](#boolean) |  |
managerIds | [\[Int\]](#int) |  |
noValue | [Boolean](#boolean) |  |

## PersonalEmailFilter
Filter employees based on their personal email address

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
anyValue | [Boolean](#boolean) |  |
noValue | [Boolean](#boolean) |  |
personalEmails | [\[String\]](#string) |  |

## StartDateFilter
Filter employees based on their start date

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
anyValue | [Boolean](#boolean) |  |
dateFilter | [DateFilter](#datefilter) |  |
noValue | [Boolean](#boolean) |  |

## TitleFilter
Filter employees based on their title

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
anyValue | [Boolean](#boolean) |  |
noValue | [Boolean](#boolean) |  |
titles | [\[String\]](#string) |  |

## UpdateCustomFieldValue
Used to update an employee's Custom Field Value

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
customFieldId | [ID!](#id) |  | Required
value | [Value](#value) |  |

## UpdateDepartmentInput
The input object used to update a [Department](#department).

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
externalId | [String](#string) |  |
id | [ID!](#id) |  | Required
name | [String](#string) |  |

## UpdateEmployee
The input object used to update an [Employee](#employee).

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
about | [String](#string) |  |
customFieldValues | [\[UpdateCustomFieldValue\]](#updatecustomfieldvalue) |  |
dateOfBirth | [Date](#date) |  |
department | [ID](#id) |  |
email | [String](#string) | The employee's work email. They need this in order to sign in |
employmentStatus | [String](#string) | [Valid options](#employmentstatuses-string) |
firstName | [String](#string) |  |
hrManager | [ID](#id) |  |
lastName | [String](#string) |  |
location | [ID](#id) |  |
manager | [ID](#id) |  |
middleName | [String](#string) |  |
otherCriteria | [\[ID\]](#id) |  |
personalEmail | [String](#string) |  |
phoneNumber | [String](#string) |  |
preferredFirstName | [String](#string) |  |
preferredLastName | [String](#string) |  |
profileImage | [URL](#url) |  |
startDate | [Date](#date) |  |
suffix | [String](#string) |  |
title | [String](#string) |  |
workCountryCode | [String](#string) |  |

## UpdateLocationInput
The input object used to update a [Location](#location).

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
address | [String](#string) |  |
externalId | [String](#string) |  |
id | [ID!](#id) |  | Required
name | [String](#string) |  |

## WorkCountryCodeFilter
Filter employees based on their work country code

Argument | Type | Description | Required
--------- | ----------- | ----------- | -----------
anyValue | [Boolean](#boolean) |  |
noValue | [Boolean](#boolean) |  |
workCountryCodes | [\[String\]](#string) |  |

# Scalars
## Boolean
Represents `true` or `false` values.

## Date
Representation of a date in YYYY-MM-DD format.

## DateTime
Representation of datetime in ISO8601.

## Float
Represents signed double-precision fractional values as specified by [IEEE 754](http://en.wikipedia.org/wiki/IEEE_floating_point).

## ID
Represents a unique identifier that is Base64 obfuscated. It is often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `"VXNlci0xMA=="`) or integer (such as `4`) input value will be accepted as an ID.

## Int
Represents non-fractional signed whole numeric values. Int can represent values between -(2^31) and 2^31 - 1.

## String
Represents textual data as UTF-8 character sequences. This type is most often used by GraphQL to represent free-form human-readable text.

## URL
A URL-formatted String

## Value
The actual value of a Custom Field Value. This type is capable of holding both Strings and Integers. Its content will
depend on the fieldType of its corresponding customField.

### text, long_text
* Allowed Type(s): String
* Must be less than 3000 chars

### multiple_choice
* Allowed Type(s): String
* Must exactly match one of the customField's options

### multiple_select
* Allowed Type(s): String. Must be a JSON Array encoded string (with escaped quotes) e.g. `"[\"Option A\", \"Option B\"]"`
* Each option must be a String that exactly matches one of the customField's options

### team
* Allowed Type(s): String or Integer
* Value must be valid Team ID
* The Team specified by the ID must have the same teamCategory as the customField

### employee
* Allowed Type(s): String or Integer
* Provided value must be valid Employee ID

### address
* Allowed Type(s): String. Must be a JSON Object encoded string (with escaped quotes) e.g. `"{\"key\": \"value\"}"`
* Provided value must be valid Employee ID
* All values must be Strings
* Must provide `address_line_1`, `city`, `state`, `country`
* `country` must be a valid countryCode.
* `country` must match the `workCountryCode` of the employee
* `state` must be a valid stateCode
* `state` must be a valid stateCode for the provided countryCode.

### contact
* Allowed Type(s): String. Must be a JSON Object encoded string (with escaped quotes) e.g. `"{\"key\": \"value\"}"`
* All values in the JSON Object must be Strings.
* Must provide `first_name`, `last_name`, and `relationship`
* must provide at least one of: `email` or `phone`
* `relationship` must be one of:
* Child
* Domestic Partner
* Domestic Partner Child
* Friend
* Grandparent
* Parent
* Sibling
* Spouse
* Other

### date
* Allowed Type(s): String
* Must formatted as YYYY-MM-DD

### legal_name
* Allowed Type(s): String. Must be a JSON Object encoded string (with escaped quotes) e.g. `"{\"key\": \"value\"}"`
* All values in the JSON Object must be Strings.
* Must provide `first_name` and `last_name`

### preferred_name
* Allowed Type(s): String. Must be a JSON Object encoded string (with escaped quotes) e.g. `"{\"key\": \"value\"}"`
* All values in the JSON Object must be Strings.

# Enums
NOTE: Enums are unquoted in user input but quotes in API output.
## CustomFieldType
Possible type values for CustomFieldValues

Value | Description
--------- | ---------
ADDRESS | Displayed as group of inputs. Stored as JSON.
CONTACT | Displayed as group of inputs. Stored as JSON.
COUNTRY | Displayed as a dropdown. Stored as a String.
DATE | Displayed as a datepicker. Stored as a DateTime
EMPLOYEE | Displayed as a dropdown of employees. Stored as an Employee ID.
IMAGE | Displayed as an image. Stored as a File.
LEGAL_NAME | Displayed as a group of inputs. Stored as JSON.
LONG_TEXT | Displayed as a multiline text box. Stored as a String.
MASKED | Displayed as a single line text field (hidden in application). Stored as a String.
MULTIPLE_CHOICE | Displayed as a dropdown. Stored as a String.
MULTIPLE_SELECT | Displayed as a tag field. Stored as an Array of Strings.
PREFERRED_NAME | Displayed as a group of inputs. Stored as JSON.
TEAM | Displayed as a dropdown of teams. Stored as a Team ID.
TEXT | Displayed as a single line text field. Stored as a String.

## SignatureRequestStatus
Possible status values for a Signature Request

Value | Description
--------- | ---------
BEING_PROCESSED | Document is being processed by our E-Signature Vendor.
CANCELED | Signature request has been terminated.
COMPLETED | Document has been successfully signed and verified.
ERROR | Could not be completed due to an error processing the E-Signature.
WAITING_FOR_COUNTER_SIGNATURE | Document awaiting counter-signer signature.
WAITING_FOR_SIGNATURE | Waiting for the employee to sign the document.

