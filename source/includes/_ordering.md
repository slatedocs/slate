# Ordering Results

> Ordering Example:

```shell
curl https://app.beyonic.com/api/contacts?ordering=-created -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

contacts = Beyonic::Contact.list(
  ordering: '-created'
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$contacts = Beyonic_Contact::getAll(array(
  "ordering" => "-created"
));
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

contacts = beyonic.Contact.list(ordering='-created')


```

Most Beyonic API methods support a way to retrieve a list of records. For example, you can retrieve a list of contacts.

When retrieving a list, you can control the order that records are returned in by adding one parameters to your request:

* **_ordering_**: This orders the records by one of the visible fields on the object

Ascending or Descending order:

* To use ascending order, just use the field name E.g. ordering=created
* To use descending order, add a "-" to the field name E.g. ordering=-created