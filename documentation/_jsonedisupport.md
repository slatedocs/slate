# JSON And EDI Support
All resource endpoints that result in the transmission of EDI transaction sets to our trading partners accept parameters 
via a JSON representation of an EDI transaction set. However, EDI files can also be sent directly to the /files/ 
endpoint. The content-type header of a POST request informs the endpoint what is being sent. Acceptable content-type 
values are "application/json" for JSON requests and "application/edi-x12", "text/plain", and "application/octet-stream" 
for EDI files.

Claim processing questions? Learn more about our [claims API workflow](https://platform.pokitdok.com/claim-processing).