Filtering parameters are **optional** and some combinations might not return a payload. If you feel that there should be data for a particular combination of filters, please reach out to [rtmcritds@mskcc.org](mailto:rtmcritds@mskcc.org).


| Parameter      | Required/Optional | Description |
| -----------    | ----------------- | ----------- |
| _count         | optional          | Controls the number of records returned in the bundle. If a value is not specified, the default is 50 records. We recommend using this parameter wisely to avoid timeout errors. |
| date           | optional          | Must follow the format `&date=OpMM/DD/YYY` where OP is the Operator for that date. Acceptable values include: <ul><li>eq (==)</li><li>ne (! =)</li><li>lt (< )</li><li>gt (>)</li><li>ge (>=)</li><li>le ( <=)</li></ul>|
| id             | optional          | Returns the record for a given subject ID |
| page           | optional          | Used to retrieve data on a particular page. Refer to [pagination](pagination.md) for more details. |
| researchstudy  | required          | MSK unique study number |
| studyid        | (Not yet available)| Sponsor study ID |