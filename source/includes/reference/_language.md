# Language Support
Internationalisation support for translation of strings returned by the API is supported for the following endpoints:

Endpoint                                    |
---------                                   |
`/v1/quotes`                                |
`/v1/quotes/<quoteId>/account-requirements` |
`/v1/accounts`                              |
`/v1/transfers`                             |


When calling these endpoints if you include an `Accept-Language` header with a supported language code as the value then stings will be returned in the requested language. The languages supported by TransferWise are:

Language            |   Code
---------           |---------  
American English    | en_US
British English     | en
Dutch               | nl
French              | fr
German              | de
Hungarian           | hu
Italian             | it
Japanese            | ja
Korean              | ko
Polish              | pl
Portuguese          | pt
Romanian            | ro
Russian             | ru
Spanish             | es

If you request an unsupported language then British English will be returned by default.


