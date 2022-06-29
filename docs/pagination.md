The FHIR Payload is returned as a [FHIR Bundle](https://www.hl7.org/fhir/bundle.html){:target="blank"}, and is a collection of resources that can contain from zero resources to the actual count of the available resources based your query search. It is good practice not to return all data, by default we are capping the number of resources to fifty; however, this number is configurable via a parameter _count. We advise keeping this default value to prevent database timeouts.

[Paging](https://www.hl7.org/fhir/http.html#paging){:target="blank"} is presented via the link [Bundle attribute](https://www.hl7.org/fhir/bundle-definitions.html#Bundle.link){:target="blank"}. The link attribute identifies the Links related to this Bundle.

```
"total": 105,
    "link": [
        {
            "relation": "self",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/observations?category=laboratory&researchstudy={MSK_UNIQUE_STUDY_NUMBER}&x-partnerid={x-partnerid}&page=1"
        },
        {
            "relation": "first",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/observations?category=laboratory&researchstudy={MSK_UNIQUE_STUDY_NUMBER}&x-partnerid={x-partnerid}&page=1"
        },
        {
            "relation": "last",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/observations?category=laboratory&researchstudy={MSK_UNIQUE_STUDY_NUMBER}&x-partnerid={x-partnerid}&page=3"
        },
        {
            "relation": "previous",
            "url": null
        },
        {
            "relation": "next",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v1/crit/blaze/api/observations?category=laboratory&researchstudy={MSK_UNIQUE_STUDY_NUMBER}&x-partnerid={x-partnerid}&page=2"
        }
    ],
```

In the payload above there are total of 105 resources, and it set to only return 50 resources. In order to obtain the remaining 55 records, the `"relation" : "next"` json object must be used to read the value of the computed URL value.   

Note: The parameter `page` is used, and in this case it is stated as 2.  

You can use the “self”, “first”, “last” and “previous” to navigate back and forth to obtain previous resources.  
