The FHIR Payload is returned as a [FHIR Bundle](https://www.hl7.org/fhir/bundle.html){:target="blank"}, and is a collection of resources that match the query parameters. By default MSK returns 50 resources per page; however, this number is configurable via the `_count` parameter. We advise keeping this default value to prevent timeouts.

[Paging](https://www.hl7.org/fhir/http.html#paging){:target="blank"} is presented via the link [Bundle attribute](https://www.hl7.org/fhir/bundle-definitions.html#Bundle.link){:target="blank"}. The link attribute returns all links related to this Bundle.

```
"total": 105,
    "link": [
        {
            "relation": "self",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/observation?category=laboratory&researchstudy={MSK_UNIQUE_STUDY_NUMBER}&x-partnerid={x-partnerid}&page=1"
        },
        {
            "relation": "first",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/observation?category=laboratory&researchstudy={MSK_UNIQUE_STUDY_NUMBER}&x-partnerid={x-partnerid}&page=1"
        },
        {
            "relation": "last",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/observation?category=laboratory&researchstudy={MSK_UNIQUE_STUDY_NUMBER}&x-partnerid={x-partnerid}&page=3"
        },
        {
            "relation": "previous",
            "url": null
        },
        {
            "relation": "next",
            "url": "https://apigateway.apps.stageapi.mskcc.org/msk-apim/external/v2/crit/blaze/api/observation?category=laboratory&researchstudy={MSK_UNIQUE_STUDY_NUMBER}&x-partnerid={x-partnerid}&page=2"
        }
    ],
```

There are `total` of 105 resources returned in the payload above but only 50 resources are actually available in the first page. In order to obtain the remaining 55 resources, iterate through the next pages using the `"relation" : "next"` computed URL values.

You can use the “self”, “first”, “last” and “previous” to navigate back and forth to obtain previous resources.  
