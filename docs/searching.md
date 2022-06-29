Filtering parameters are **optional**, be aware that some combinations might not return a payload, this does not mean that there is anything wrong with the filtering, it is just that there is no data for such combination.  

If you feel that there should be data, please contact us.


| Parameter      | Description |
| -----------    | ----------- |
| _count         |  It is used to control the number of records to return inside the bundle, by default is 50 records, we recommend using this parameter wisely to avoid timeout errors. |
| date           | When the date parameter is used, it must be use in the form of &date=OpMM/DD/YYY where OP is the Operator for that date, the following are the allow values: <ul><li>eq (==)</li><li>ne (! =)</li><li>lt (< )</li><li>gt (>)</li><li>ge (>=)</li><li>Le ( <=)</li></ul>|
| page | It is used for paging, for examples how to use this, refer to section FHIR paging |
| id | It is used to return only the record for a given subjectID |
| researchstudy | MSK IRB number used to identify ** |
| studyid | (Not yet available) SponsorID |