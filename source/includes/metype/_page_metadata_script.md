# Page Metadata Script

Metype provides a script to add metadata to a page. A Page is a resource created when any of the Metype widgets are used. By setting the desired value of Metadata, you can later query using [Metype APIs](#api-documentation) for detailed metrics.

### Page Metadata Javascript
Use this script when you want to save some details of a page that you might want to use for querying using APIs.

```javascript
<script type="text/javascript">
          talktype(function() {
            var pageUrl = <url_here>; <!-- Add url of the page here here -->
            var pageMetadata = <metadata_object_here>; <!-- Add pageMetdata object here -->
            var accountId = 'XXXXX'; <!-- Add your account ID here -->
            talktype.pageMetadataSetter(accountId, pageUrl, pageMetadata);
          });
```

`pageMetadata` must be a single level javascript object. The values can be of type String, Number, Array. It can not be a nested object.

Some examples of valid metadata objects are:

* { section: ["science", "tech"], author_id: 123 }

* { section: "cooking", top: "true" }


