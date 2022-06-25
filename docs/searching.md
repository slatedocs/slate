The following filtering parameters are available

| Parameter      | Description |
| -----------    | ----------- |
| category       |  Used to specified which resource to pull eg: laboratory or vitalsigns |
| _count         |  It is used to control the number of records to return inside the bundle, by default is 50 records, we recommend using this parameter wisely to avoid timeout errors. |
| date           | When the date parameter is used, it must be use in the form of &date=OpMM/DD/YYY where OP is the Operator for that date, the following are the allow values: <ul><li>eq (==)</li><li>ne (! =)</li><li>lt (< )</li><li>gt (>)</li><li>ge (>=)</li><li>Le ( <=)</li></ul>|
| page | It used for paging, for examples how to use this, refer to section FHIR paging |
| id | It used to return only the record for a given subjectID |
| researchstudy | MSK IRB number used to identify ** |
| studyid | (Not yet available) SponsorID |