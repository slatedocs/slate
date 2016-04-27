# Notification

> Notification success JSON response:

```json
{
  "remainders": [
  {
  "title" : "due reminder on 2016-04-26",
  "loan_number" : "loan-1460706142",
  "loan_id" : 1,
  "due_date" : "2016-04-26",
  "amount" : "1.00"
  },
  {
    "title" : "due reminder on 2016-04-26",
    "loan_number" : "loan-1460706142",
    "loan_id" : 2,
    "due_date" : "2016-04-26",
    "amount" : "1.00"
    }
  ]
}
```
### HTTP Request

`GET http://dev-web.ydftay8q3x.us-west-2.elasticbeanstalk.com/api/v1/upcoming-due-notification`
