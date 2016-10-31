# Rankings

## Search

<span class="label label-info">Batch Method</span>

> Fetch rankings

```php
<?php
use BrightLocal\Api;
use BrightLocal\Batches\V4 as BatchApi;

$searches = array(
    array(
        'search-engine'   => 'google',
        'country'         => 'USA',
        'google-location' => 'New York, NY',
        'search-term'     => 'restaurant new york',
        'urls'            => json_encode(array('le-bernardin.com')),
        'business-names'  => json_encode(array('Le Bernardin'))
    ),
    array(
        'search-engine'   => 'google',
        'country'         => 'USA',
        'google-location' => 'New York, NY',
        'search-term'     => 'restaurant manhattan',
        'urls'            => json_encode(array('le-bernardin.com')),
        'business-names'  => json_encode(array('Le Bernardin'))
    ),
    array(
        'search-engine'   => 'google',
        'country'         => 'USA',
        'google-location' => 'New York, NY',
        'search-term'     => 'restaurant 10019',
        'urls'            => json_encode(array('le-bernardin.com')),
        'business-names'  => json_encode(array('Le Bernardin'))
    )
);
$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$batchApi = new BatchApi($api);
$batchId = $batchApi->create();
if ($batchId) {
    printf('Created batch ID %d%s', $batchId, PHP_EOL);
    foreach ($searches as $search) {
        $result = $api->call(
            '/v4/rankings/search',
            array_merge(
                $search, array('batch-id' => $batchId)
            )
        );
        if ($result['success']) {
            printf('Added job with ID %d%s', $result['job-id'], PHP_EOL);
        }
    }
    if ($batchApi->commit($batchId)) {
        echo 'Committed batch successfully.'.PHP_EOL;
        // poll for results, in a real world example you might
        // want to do this in a separate process (such as via an
        // AJAX poll)
        do {
            $results = $batchApi->get_results($batchId);
            sleep(10); // limit how often you poll
        } while (!in_array($results['status'], array('Stopped', 'Finished')));
        print_r($results);
    }
}
```

```shell
curl -X POST \
    -d 'api-key=<INSERT_API_KEY>' \
    -d 'batch-id=<INSERT_BATCH_ID>' \
    -d 'search-engine=google' \
    -d 'country=USA' \
    -d 'google-location=new+york,ny' \
    -d 'search-term=restaurant' \
    -d 'urls=["jean-georgesrestaurant.com"]' \
    -d 'business-names=["Jean-Georges Restaurant"]' \
    https://tools.brightlocal.com/seo-tools/api/v4/rankings/search
```

> Success (201 Created)

```json
{
    "success": true,
    "job-id": "1"
}
```
 
> Failure (405 Method Not Allowed)

```json
{
  "success": false,
  "errors": {
    "INVALID_METHOD": "Invalid method specified. Only POST method is available"
  }
}
```

> Failure (500 Internal Server Error)

 ```json
{
    "success": false,
    "reason": "Unable to add job"
}
```

> Get Batch Rankings Result,  Sucess(200 Ok)

 ```json
{
  "success": true,
  "results": {
    "SearchRankV2Api": [
      {
        "results": [
          {
            "identifier": "google",
            "site": "Google Search",
            "site-url": "http://www.google.com",
            "search-url": "https://www.google.com/search?q=Back+Pain+midtown+manhattan&gl=us&gws_rd=cr&pws=0",
            "search-term": "Back Pain midtown manhattan",
            "results": [
              {
                "url": "http://thecenternyc.com/tag/back-pain/",
                "orig_url": "http://www.thecenternyc.com/tag/back-pain/",
                "title": "Back Pain Archives >> New York, NY 10001",
                "rank": 13,
                "sub_rank": null,
                "page": 2,
                "type": "Organic",
                "match": [
                  "website address"
                ],
                "matched_url": "www.thecenternyc.com",
                "serp-screenshot-url": "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/6daa949323ef54687f41d95500751fd08256bc17.png"
              },
              {
                "url": "http://thecenternyc.com/back-pain-nyc/",
                "orig_url": "http://www.thecenternyc.com/back-pain-nyc/",
                "title": "Back Pain NYC Archives >> The Center Chiropractic &amp; PT NYC",
                "rank": 14,
                "sub_rank": null,
                "page": 2,
                "type": "Organic",
                "match": [
                  "website address"
                ],
                "matched_url": "www.thecenternyc.com",
                "serp-screenshot-url": "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/6daa949323ef54687f41d95500751fd08256bc17.png"
              }
            ],
            "result-types": [
              "Organic",
              "Places",
              "Carousel",
              "Directory",
              "Secondary"
            ],
            "http-error": false,
            "error-type": "None",
            "serp-screenshots": [
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/6b3c2ea8060ad5d564bbbfb84e1dc877e401d7ab.png",
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/6daa949323ef54687f41d95500751fd08256bc17.png",
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/7e4fe6933ceff9303c541c3a4ff078d762aefff9.png",
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/fec74577c27321aa403da6733b82f3e3daa06407.png",
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/ceac0abca0233cb404f7859e8942ee1ed6851564.png"
            ]
          }
        ],
        "payload": {
          "queue-attempts": 1,
          "http-codes": [
            0
          ],
          "source": 3,
          "api-key": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "search-engine": "google",
          "options": {
            "urls": [
              "www.thecenternyc.com"
            ],
            "business-names": [
              "The center for chiropractic & pt",
              "the center for chiropractic decomperssion"
            ],
            "search-term": "Back Pain midtown manhattan",
            "postcode": "10001",
            "telephone": "646-606-2580",
            "country": "USA",
            "google-location": "",
            "bing-location": "",
            "include-name-only-matches": true,
            "num-search-pages": 5,
            "debug": false,
            "listings": false,
            "screenshots-enabled": true,
            "include-intermediate-html": false,
            "append-location": false
          },
          "position": 0
        },
        "status": "Completed",
        "job-id": 564270998
      },
      {
        "results": [
          {
            "identifier": "google",
            "site": "Google Search",
            "site-url": "http://www.google.com",
            "search-url": "https://www.google.com/search?q=apos+therapy+new+york&gl=us&gws_rd=cr&pws=0",
            "search-term": "apos therapy new york",
            "results": [
              {
                "url": "http://thecenternyc.com/apostherapy/",
                "orig_url": "http://www.thecenternyc.com/apostherapy/",
                "title": "Apostherapy NYC - Chiropractor NYC",
                "rank": 18,
                "sub_rank": null,
                "page": 2,
                "type": "Organic",
                "match": [
                  "website address"
                ],
                "matched_url": "www.thecenternyc.com",
                "serp-screenshot-url": "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/9fce8698cbbfb59eeb4237dbb337c35e73fca0fa.png"
              }
            ],
            "result-types": [
              "Organic",
              "Places",
              "Carousel",
              "Directory",
              "Secondary"
            ],
            "http-error": false,
            "error-type": "None",
            "serp-screenshots": [
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/98aa8a19a602cefdb4d1ee0c2d220bf651b8d5cc.png",
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/9fce8698cbbfb59eeb4237dbb337c35e73fca0fa.png",
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/7346a7078076feaf155456e4437429bfc7e7bf94.png",
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/95b95e6189dc6a4cae2ec8247b53f507a6cf4925.png",
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/e6b467b76c9e2ea66c1ebfbdcd316ee95f97af6e.png"
            ]
          }
        ],
        "payload": {
          "queue-attempts": 1,
          "http-codes": [
            0
          ],
          "source": 3,
          "api-key": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "search-engine": "google",
          "options": {
            "urls": [
              "www.thecenternyc.com"
            ],
            "business-names": [
              "The center for chiropractic & pt",
              "the center for chiropractic decomperssion"
            ],
            "search-term": "apos therapy new york",
            "postcode": "10001",
            "telephone": "646-606-2580",
            "country": "USA",
            "google-location": "",
            "bing-location": "",
            "include-name-only-matches": true,
            "num-search-pages": 5,
            "debug": false,
            "listings": false,
            "screenshots-enabled": true,
            "include-intermediate-html": false,
            "append-location": false
          },
          "position": 0
        },
        "status": "Completed",
        "job-id": 564270999
      },
      {
        "results": [
          {
            "identifier": "yahoo",
            "site": "Yahoo! Search",
            "site-url": "http://www.yahoo.com",
            "search-url": "http://search.yahoo.com/search?p=apos+therapy+new+york",
            "search-term": "apos therapy new york",
            "results": [],
            "result-types": [
              "Organic",
              "Local",
              "Directory"
            ],
            "http-error": false,
            "error-type": "None",
            "serp-screenshots": [
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/60f6391ac2751102165e4f6b7b360c97e8a63bc1.png",
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/712b2c7d35f59309e36f8bdc79dab76b04695388.png",
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/dace1c14755c4b1467e36cfce7a96af86604a785.png",
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/2c381e008d53e0d02ec4d11cc03e29e5b618a236.png",
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/f754b72bd373673cd6e4010519413d28ec22a1ab.png"
            ]
          }
        ],
        "payload": {
          "queue-attempts": 1,
          "http-codes": [
            0
          ],
          "source": 3,
          "api-key": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "search-engine": "yahoo",
          "options": {
            "urls": [
              "www.thecenternyc.com"
            ],
            "business-names": [
              "The center for chiropractic & pt",
              "the center for chiropractic decomperssion"
            ],
            "search-term": "apos therapy new york",
            "postcode": "10001",
            "telephone": "646-606-2580",
            "country": "USA",
            "google-location": "",
            "bing-location": "",
            "include-name-only-matches": true,
            "num-search-pages": 5,
            "debug": false,
            "listings": false,
            "screenshots-enabled": true,
            "include-intermediate-html": false,
            "append-location": false
          },
          "position": 0
        },
        "status": "Completed",
        "job-id": 564271014
      },
      {
        "results": [
          {
            "identifier": "yahoo",
            "site": "Yahoo! Search",
            "site-url": "http://www.yahoo.com",
            "search-url": "http://search.yahoo.com/search?p=redcord+therapy+manhattan",
            "search-term": "redcord therapy manhattan",
            "results": [
              {
                "url": "http://thecenternyc.com/redcord-physical-therapy-manhattan/",
                "orig_url": "http://www.thecenternyc.com/redcord-physical-therapy-manhattan/",
                "title": "Redcord Physical Therapy Manhattan | Chiropractor...",
                "rank": 3,
                "sub_rank": null,
                "page": 1,
                "type": "Organic",
                "match": [
                  "website address"
                ],
                "matched_url": "www.thecenternyc.com",
                "serp-screenshot-url": "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/7609663e9087a81b92015e1c9af025257ae4be62.png"
              },
              {
                "url": "http://thecenternyc.com/redcord-manhattan/",
                "orig_url": "http://www.thecenternyc.com/redcord-manhattan/",
                "title": "Redcord Manhattan Archives >> The Center...",
                "rank": 5,
                "sub_rank": null,
                "page": 1,
                "type": "Organic",
                "match": [
                  "website address"
                ],
                "matched_url": "www.thecenternyc.com",
                "serp-screenshot-url": "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/7609663e9087a81b92015e1c9af025257ae4be62.png"
              }
            ],
            "result-types": [
              "Organic",
              "Local",
              "Directory"
            ],
            "http-error": false,
            "error-type": "None",
            "serp-screenshots": [
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/7609663e9087a81b92015e1c9af025257ae4be62.png",
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/09424d6d44a145c86aa72c2948414d6bc220969b.png",
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/54938f2561fea42cb97af038e85d3b8ec41d8a4c.png",
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/2256d2c5362c6a7745f82f76bd28801322f902fa.png",
              "https://seo-serp-screenshots.s3.amazonaws.com/2016/10/14/14/11ae9ee7f549d89e2248d97bf6cf3764d997e047.png"
            ]
          }
        ],
        "payload": {
          "queue-attempts": 1,
          "http-codes": [
            0
          ],
          "source": 3,
          "api-key": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "search-engine": "yahoo",
          "options": {
            "urls": [
              "www.thecenternyc.com"
            ],
            "business-names": [
              "The center for chiropractic & pt",
              "the center for chiropractic decomperssion"
            ],
            "search-term": "redcord therapy manhattan",
            "postcode": "10001",
            "telephone": "646-606-2580",
            "country": "USA",
            "google-location": "",
            "bing-location": "",
            "include-name-only-matches": true,
            "num-search-pages": 5,
            "debug": false,
            "listings": false,
            "screenshots-enabled": true,
            "include-intermediate-html": false,
            "append-location": false
          },
          "position": 0
        },
        "status": "Completed",
        "job-id": 564271015
      }
     
   
    ]
  },
  "statuses": {
    "Completed": 4
  },
  "status": "Finished"
}
```

This API method allows you to retrieve search ranking (and listing data) from the major search engines and their local variants, namely Google, Google Maps, Yahoo!, Yahoo! Local, Bing and Bing Maps. It works for the USA, United Kingdom, Canada and Australia. The only exception is in Australia where Yahoo! Local is not supported.

This method needs to be used in conjunction with the [batch methods](#batches) described above.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/rankings/search`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
batch-id | <span class="label label-required">Required</span>
search-engine | <span class="label label-required">Required</span> One of google, google-mobile, google-local, yahoo, yahoo-local, bing, bing-local.
country | <span class="label label-required">Required</span> Determines whether or not to search against .com, .ca, co.uk, .com.au search engines. One of USA, CAN:EN, CAN:FR, GBR, AUS, IRL or NZL.
google-location | Allows you to optionally localize results by specifying your physical location. Specify a ZIP, city name or region. Only applicable to US searches. Also see [Check Location](#check-location) method.
bing-location | Allows you to optionally localize results by specifying your physical location. See [Check Location](#check-location) method.
search-term | <span class="label label-required">Required</span> The search term to get ranking information for.
urls | The URLs to get ranking information for. Encode as a JSON string, e.g. \["www.bluehillfarm.com", "www.candle79.com", "shabutatsu.com", "marea-nyc.com", "www.taorestaurant.com"\] (max 10).
business-names | A list of possible business names to search for. Encode as a JSON string, e.g. ["The Rose Pub","Rose Pub","The Rose"]. For backwards compatibility this also supports a newline (\n) separated list.
postcode | A valid ZIP or country postal code.
telephone | A valid telephone number.
include-secondary-matches | Determines whether or not to include results matched by name, telephone and/or ZIP/postal code. One of yes or no. This should be used in conjunction with the postal and telephone parameters.
listings | Include details of all SERPs returned, not just the matches. Defaults to "no". Accepts "yes" or "no". The default is "no".
screenshots | Determines whether or not to generate SERP screenshots and include the links to those screenshots in the response. Accepts "yes" or "no". The default is "no".

<aside class="notice">
    By default we return 5 pages or 50 results (whichever is lower). If you need more than this please contact us. We can increase to a maximum of 10 pages or 100 results on a case by case basis.
</aside>

## Bulk Search

<span class="label label-info">Batch Method</span>

> Fetch rankings

```php
<?php
use BrightLocal\Api;
use BrightLocal\Batches\V4 as BatchApi;

$searches = array(
    'restaurant new york',
    'restaurant manhattan',
    'restaurant 10019'
);
$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$batchApi = new BatchApi($api);
$batchId = $batchApi->create();
if ($batchId) {
    printf('Created batch ID %d%s', $batchId, PHP_EOL);
    $result = $api->call(
        '/v4/rankings/bulk-search',
        array(
            'batch-id' => $batchId,
            'search-engine'   => 'google',
            'country'         => 'USA',
            'google-location' => 'New York, NY',
            'search-terms'    => json_encode($searches),
            'urls'            => json_encode(array('le-bernardin.com')),
            'business-names'  => json_encode(array('Le Bernardin'))
        )
    );
    if ($result['success']) {
        printf('Added job with ID %d%s', $result['job-id'], PHP_EOL);
    }
    if ($batchApi->commit($batchId)) {
        echo 'Committed batch successfully.'.PHP_EOL;
        // poll for results, in a real world example you might
        // want to do this in a separate process (such as via an
        // AJAX poll)
        do {
            $results = $batchApi->get_results($batchId);
            sleep(10); // limit how often you poll
        } while (!in_array($results['status'], array('Stopped', 'Finished')));
        print_r($results);
    }
}
```

```shell
curl -X POST \
    -F 'api-key=<INSERT_API_KEY>' \
    -F 'batch-id=<INSERT_BATCH_ID>' \
    -F 'search-engine=google' \
    -F 'country=USA' \
    -F 'google-location=new+york,ny' \
    -F 'search-terms=["restaurant","restaurant+new+york","restaurant+manhattan"]' \
    -F 'urls=["jean-georgesrestaurant.com"]' \
    -F 'business-names=["Jean-Georges Restaurant"]' \
    https://tools.brightlocal.com/seo-tools/api/v4/rankings/bulk-search
```

> Success (201 Created)

```json
{
    "success": true,
    "job-ids": ["1", "2","3"]    
}
```
 
> Failure (405 Method Not Allowed)

```json
{
  "success": false,
  "errors": {
    "INVALID_METHOD": "Invalid method specified. Only POST method is available"
  }
}
```

> Failure (500 Internal Server Error)

 ```json
{
    "success": false,
    "reason": "Unable to add job(s)"
}
```

This method works the same as the [search](#search) method above except it allows you to submit up to 100 search terms in one request. Use this when you want to look up rankings for many hundreds or thousands of search terms.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/rankings/bulk-search`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
batch-id | <span class="label label-required">Required</span>
search-engine | <span class="label label-required">Required</span> One of google, google-mobile, google-local, yahoo, yahoo-local, bing, bing-local.
country | <span class="label label-required">Required</span> Determines whether or not to search against .com, .ca, co.uk, .com.au search engines. One of USA, CAN:EN, CAN:FR, GBR, AUS, IRL or NZL.
google-location | Allows you to optionally localize results by specifying your physical location. Specify a ZIP, city name or region. Only applicable to US searches. Also see [Check Location](#check-location) method.
bing-location | Allows you to optionally localize results by specifying your physical location. See [Check Location](#check-location) method.
search-terms | <span class="label label-required">Required</span> Encode as a JSON string, e.g. \["restaurant new york", "restaurant", "cafe"\] (max 100).
urls | The URLs to get ranking information for. Encode as a JSON string, e.g. \["www.bluehillfarm.com", "www.candle79.com", "shabutatsu.com", "marea-nyc.com", "www.taorestaurant.com"\] (max 10).
business-names | A list of possible business names to search for. Encode as a JSON string, e.g. ["The Rose Pub","Rose Pub","The Rose"]. For backwards compatibility this also supports a newline (\n) separated list.
postcode | A valid ZIP or country postal code.
telephone | A valid telephone number.
include-secondary-matches | Determines whether or not to include results matched by name, telephone and/or ZIP/postal code. One of yes or no. This should be used in conjunction with the postal and telephone parameters.
listings | Include details of all SERPs returned, not just the matches. Defaults to "no". Accepts "yes" or "no". The default is "no".
screenshots | Determines whether or not to generate SERP screenshots and include the links to those screenshots in the response. Accepts "yes" or "no". The default is "no".

<aside class="notice">
    By default we return 5 pages or 50 results (whichever is lower). If you need more than this please contact us. We can increase to a maximum of 10 pages or 100 results on a case by case basis.
</aside>

## Check Location

> Location Found (200 OK)

```json
{
    "success": true,
    "response": true
}
```
 
> Location Not Found (200 OK)

```json
{
    "success": true,
    "response": false
}
```
 
> Suggestions (Bing only) (200 OK)

```json
{
    "success": true,
    "response": [
        "lat:40.7145500183105|long:-74.0071182250977|New York, NY",
        "lat:39.6849212646484|long:-93.9093475341797|New York, MO",
        "lat:32.1684989929199|long:-95.669189453125|New York, TX"
    ]
}
```

Look up a location that's suitable for use when setting Google or Bing location whilst performing a search using the method above. This method is deprecated for use with Google as there's no longer any need to check if the location you want to set is valid.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/rankings/check-location`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
search-engine | <span class="label label-required">Required</span> One of google or bing.
country| One of USA, CAN, GBR, AUS, IRL or NZL.
location | e.g. postcode/ZIP, city and state code
