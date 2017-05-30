# Appendix

## Constructing Google+ URLs

```php
<?php
$url = 'https://www.google.com/search?' . http_build_query([
    'q'    => sprintf('"%s" "%s" %s', 'Hub Plumbing & Mechanical Inc', 'New York', '212-482-8500'),
]);
```

```php
<?php
$url = 'https://www.google.com/search?' . http_build_query([
    'q'   => sprintf('"%s" "%s"', 'Pizza Hut', '67337'),
]);    
```

Google recently simplified their Google+ profile pages and removed much of the useful profile information that we normally gather through APIs documented here, such as NAP and reviews. Consequently we have stopped using Google+ Local listings and have instead started tracking business profile information via Google SERP pages. This means that when requesting Google profile data or reviews via our API you need to supply us with a pre-formatted search URL rather than the plus URL that corresponds to that business. Your search URL should be constructed with one of the following formats:

### Business names (in quotes) + zip code (in quotes) and phone number (without quotes)

`https://www.google.com/search?q="Hub+Plumbing+%26+Mechanical+Inc"+"New+York"+212-482-8500`

### Business name (in quotes) + zipcode (in quotes)

`https://www.google.com/search?q="Pizza+Hut"+"67337"`

One format may work better than another for a specific business so we recommend testing both approaches to find the optimal profile URL. The code snippets on the right give examples of how to generate each type of URL.

## Supported Local Directories

We no longer list the supported local directories here. We now have an [endpoint](#local-directories) which enables you to retrieve a list of directories (either all or for an individual country).

## Business Category IDs

We no longer list the supported business categories here. We now have an [endpoint](#business-categories) which enables you to retrieve a list of categories by country.

## Supported Countries

The following countries and codes are supported by our system:

Country|Code
---|---
Australia|AUS
Canada|CAN
Germany|DEU
Hong Kong|HKG
Ireland|IRL
Macau|MAC
Netherlands|NLD
New Zealand|NZL
Philippines|PHL
Taiwan|TWN
United Kingdom|GBR
United States|USA
Singapore|SGP
South Africa|ZAF
