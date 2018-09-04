# Terms and Conditions
## Get Terms and Conditions

> Example Request:

```shell
curl -X GET "https://api.sandbox.transferwise.tech/v1/terms/default"
```

> Example Response:

```html
<h2><strong>1. How to read this Agreement</strong></h2>
<p>This Agreement contains 30 sections. You may go directly to any section by selecting the appropriate link provided. The headings are for reference only. Some capitalised terms have specific definitions in section [3]. Underlined words in this Agreement contain hyperlinks to further information.</p>
<h2><strong>2. Why you should read this Agreement</strong></h2>
<p>2.1 What this Agreement cover. These are the term and conditions on which we provide our Services to you.</p>
<p>2.2 Why you should read them. Please read this Agreement carefully before you start to use our Services. This Agreement (always together with the documents referred to in it) tell you who we are, how we will provide the Services to you, how this Agreement may be changed or ended, what to do if there is a problem and other important information. If you think that there is a mistake in this Agreement or require any changes, please <u>contact us</u> to discuss.</p>
<p>2.3 Other additional documents which applies to you. This Agreement refers to the following additional documents, which also apply to your use of our Services:</p>
<ul><li>(a) <u>Our Privacy Policy</u>, which sets out the terms on which we process any personal data we collect about you, or that you provide to us. By using our Services, you consent to such processing and you promise that all data provided by you is accurate.</li>
<li>(b) <u>Our Cookie Policy</u>, which sets out information about the “cookies” on our Website.</li>
...
```

Get TransferWise terms and conditions in HTML format to show to your customers who are signing up for their TransferWise account.
This endpoint is applicable for bank integrations and third party application integrators only. 


### Request
**`GET https://api.sandbox.transferwise.tech/v1/terms/{clientId}`**

Use "default" as clientId to fetch Transferwise general terms and conditions.

No authentication is required for this endpoint.


### Response
Terms and conditions in HTML format.


