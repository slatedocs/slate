Most parameters are optional and some combinations might not return a payload. If you feel that there should be data for a particular combination of filters, please reach out to [ctdata@mskcc.org](mailto:ctdata@mskcc.org).


| Parameter      | Type    | Is Required | Description                        |
| -----------    | ------- | ----------- | ---------------------------------- |
| _count         | integer | false       | Controls the number of records returned in the bundle. The default is `50` records. Use this parameter wisely to avoid timeout errors. |
| code           | string  | false       | Returns the records for the given LOINC Code. Must follow the format `&code=http://loinc.org|777-3,http://loinc.org|751-8` |
| component-code | string  | false       | Returns the records for the given LOINC Code. Must follow the format `&component-code=http://loinc.org|777-3,http://loinc.org|751-8` |
| date           | date    | false       | Must follow the format `&date=OpMM/DD/YYYY` or date range as `&date=OpMM/DD/YYYY&date=OpMM/DD/YYYY` where OP is the Operator for that date. Acceptable values include: <ul><li>eq (==)</li><li>ne (! =)</li><li>lt (< )</li><li>gt (>)</li><li>ge (>=)</li><li>le ( <=)</li></ul>|
| id             | string  | false       | Returns the record for a given ID |
| issued         | date    | false       | Returns the records for the issued CRT Date. Must follow the format `&issued=OpMM/DD/YYYY` where OP is the Operator for that date. Acceptable values include: <ul><li>eq (==)</li><li>ne (! =)</li><li>lt (< )</li><li>gt (>)</li><li>ge (>=)</li><li>le ( <=)</li></ul>|
| page           | integer | false       | Used to retrieve data on a particular page. Refer to [pagination](pagination.md) for more details. |
| researchstudy  | string  | true*       | MSK unique study number           |
| studyid        | string  | **          | Sponsor study ID                  |

*True for all resource requests except /Patient, which require one of the following to return data: researchstudy or {id}. Patient requests submitted using {id} will return data only if that subject is part of the studies `x-partnerid` has access to.

** Not available yet