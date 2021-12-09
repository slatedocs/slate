# Service Level Agreement

Quality ELEMENT contains attributes which define the desired and promised quality of the data product. 

No mandatory attributes at the moment. Optional attributes are listed in own table and an example is given in the right column. 

## Optional attributes and elements

> Example of Quality component usage:

```javascript
   "quality": {
      "updateFrequency": 
      {
         "unit": "hours",
         "value": 1
      },
      "uptime": 
      {
         "unit": "percentage",
         "value": 99
      },
      "responseTime": 
      {
         "unit": "milliseconds",
         "value": 200
      }
      "support": 
      {
         "company": 
         {
            "phoneNumber":"",
            "phoneServiceHours":""
            "chatURL":"",
            "chatServiceHours":"",
            "chatResponseTime:"",
            "email":"",
            "emailServiceHours":"",
            "emailResponseTime:"",
            "documentationURL":"",
            "guidesURL":"",
         },
         "community": 
         {
            "stackoverflowURL": "",
            "forumURL": "" 
            "facebookURL":"", 
            "slackURL":"",
            "twitterURL":""
         }
      }
      "monitoring":
      {

      }   
   }
```

| <div style="width:150px">Element name</div>   | Type  | Options  | Description  |
|---|---|---|---|
| updateFrequency | element  | options for *unit* are: milliseconds, seconds, minutes, days, weeks, months, years, never, null. *Value* attribute is Integer.  | name of the quality attribute indicating the timely interval how often data is updated. |
| uptime | element | options for *unit* are: percentage, string, null. The value attribute can be integer or string "best effort". | Uptime is the amount of time that a service is online available and operational. Guaranteed uptime is expressed as SLA level and is generally the most important metric to measure the quality of a hosting provider. An SLA level of 99.99% for example equates to 52 minutes and 36 seconds of downtime per year. in this context uptime is SLA.  |
|  responseTime| element | unit options are: milliseconds, seconds, null. Value can be integer or null | Response time is the total amount of time it takes to respond to a request for service. |
| support | element | - | Support element describes how the customer can reach for help in case of difficulties in usage, billing, or otherwise. Support can be based on company provided support and community driven support. |
| phoneNumber | string | - | The support phone number |
| phoneServiceHours | string | - | Describes the service hours company provides. Contains information often in week level eg Mon-Fri at 8am - 4pm |
| chatURL | URL | - | The URL of chat service to use. Service hours and response time defined in other attributes. |

<button data-tf-popup="Q1Zo6wE5" data-tf-iframe-props="title=Customer Feedback Survey" style="all:unset;font-family:Helvetica,Arial,sans-serif;display:inline-block;max-width:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;background-color:#FA6B05;color:#000000;font-size:17px;border-radius:3px;padding:0 28px;font-weight:bold;height:42.5px;cursor:pointer;line-height:42.5px;text-align:center;margin:0;text-decoration:none;">Raise an issue</button><script src="//embed.typeform.com/next/embed.js"></script>