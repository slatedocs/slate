# Service Level Agreement

Quality ELEMENT contains attributes which define the desired and promised quality of the data product. 

No mandatory attributes at the moment. Optional attributes are listed in own table and an example is given in the right column. 

## Optional attributes and elements

> Example of Quality component usage:

```javascript
   "SLA": {
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
            "chatResponseTime":"",
            "email":"",
            "emailServiceHours":"",
            "emailResponseTime":"",
            "documentationURL":"",
            "guidesURL":"",
         },
         "community": 
         {
            "stackoverflowURL": "",
            "forumURL": "" 
            "slackURL":"",
            "twitterURL":""
         }
      }
      "observability":
      {
         "logsURL":"https://logs.com"
         "dashboardURL":"https://dashboard.com",
         "uptimeURL":"https://uptime.com"
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
| chatURL | URL | Valid URL | The URL of chat service to use. Service hours and response time defined in other attributes. |
| chatServiceHours | string | - | Describes the chat service hours company provides. Contains information often in week level eg Mon-Fri at 8am - 4pm |
| chatResponseTime | string | - | Describes aimed maximum delay in responding to chat support requests. This doesn't normally guarantee a resolution to the problem.  |
| email | string | - | Email information for support requests |
| emailServiceHours | string | - | Describes the email service hours company provides. Contains information often in week level eg Mon-Fri at 8am - 4pm |
| emailResponseTime | string | - | Describes aimed maximum delay in responding to email support requests. This doesn't normally guarantee a resolution to the problem.  |
| documentationURL | URL | - | URL to the documentation of the product. |
| guidesURL | URL | Valid URL | URL to the guides offering more information and examples about how to use the data product. Guides might be platform specific. |
| community | Element | - | Element that contains community based support function information |  
| stackoverflowURL | URL | Valid URL | URL to the Stack Overflow. Could be for example list of resolved issues related to the product |  
| forumURL | URL | Valid URL | URL to the community forum in which product related support requests can be raised |  
| slackURL | URL | Valid URL | URL to the Slack workspace in which product related support requests can be raised |  
| twitterURL | URL | Valid URL | URL to the Twitter account for which product related support requests can be raised |  
| observability | element | - | Observability is a superset of monitoring. It provides not only high-level overviews of the system’s health but also highly granular insights into the implicit failure modes of the system. In addition, an observable system furnishes ample context about its inner workings, unlocking the ability to uncover deeper, systemic issues. | 
| logsURL | URL | Valid URL | URL to service which offers access to event logs including errors, response times, call information. | 
| dashboardURL | URL | Valid URL | URL to dashboard application which visualizes product behaviour. This service should support at least part of the given product quality indicators | 
| uptimeURL | URL | Valid URL | URL to service which shows uptime statistics as well as other statistical information. This service should support at least part of the given product quality indicators | 

<button data-tf-popup="Q1Zo6wE5" data-tf-iframe-props="title=Customer Feedback Survey" style="all:unset;font-family:Helvetica,Arial,sans-serif;display:inline-block;max-width:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;background-color:#FA6B05;color:#000000;font-size:17px;border-radius:3px;padding:0 28px;font-weight:bold;height:42.5px;cursor:pointer;line-height:42.5px;text-align:center;margin:0;text-decoration:none;">Raise an issue</button><script src="//embed.typeform.com/next/embed.js"></script>