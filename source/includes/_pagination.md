# Pagination

> Pagination Example Request:

```shell
curl https://app.beyonic.com/api/v2/contacts?limit=10&offset=5 -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_vesion = 'v2'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

contacts = Beyonic::Contact.list(
  limit: 10,
  offset: 5
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiVersion("v2");
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$contacts = Beyonic_Contact::getAll(array(
  "limit" => "10",
  "offset" => "5"
));
?>
```

```python
import beyonic
beyonic.api_version = 'v2'
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

contacts = beyonic.Contact.list(limit='10',
                                  offset='5')


```

Most Beyonic API methods support a way to retrieve a list of records. For example, you can retrieve a list of contacts.

When retrieving a list, you can control the number of records returned by adding two parameters to your request:

* **_limit_**: This limits the number of records returned per page. If omitted, only 10 records are returned per page
* **_offset_**: This tells the Beyonic API where to start getting 

The API response body shall include the following parameters:

* **_count_**: The total number of records available (not just on the returned page)
* **_next_**: A link to the next page of records. If there is no next page, this shall be equal to _null_
* **_previous_**: A link to the previous page of records. If there is no previous page, this shall be equal to _null_
* **_results_**: This will contain the list of records for the current page