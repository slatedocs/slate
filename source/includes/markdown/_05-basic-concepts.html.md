<span></span>
<section class="full-section beta">
<section>

# Overview

> Helpful code snippets will show up in this column.

```shell
curl https://app.asana.com/api/1.0/users/me \
  -H "Authorization: Bearer 0/a7f89e98g007e0s07da763a"
```

```javascript--nodejs
const asana = require('asana');
```

```php
<?php
require 'php-asana/vendor/autoload.php';
```

```python
import asana
```

```java
import com.asana.*;
```

```ruby
require 'asana'
```

<span class="description">
The Asana API is a <a href="http://en.wikipedia.org/wiki/Representational_State_Transfer" target="_blank" rel="noopener noreferrer">REST</a>ful
interface, providing programmatic access to much of the data in the system. It provides predictable URLs for accessing
resources, and uses built-in HTTP features to receive commands and return responses. This makes it easy to communicate
from a wide variety of environments: command-line utilities, gadgets, and even the browser URL bar itself.
</span>

The API accepts <a href="http://json.org/" target="_blank" rel="noopener noreferrer">JSON</a> or form-encoded content in requests and returns
JSON content in all of its responses, including errors. Only the UTF-8 character encoding is supported for both
requests and responses.

**Notes on Pagination**

<a href="/docs/pagination">Pagination</a> is an important concept when working
with queries for multiple objects. Requests with large result sets may timeout or be truncated; therefore,
pagination is strongly encouraged to ensure both you and your users have the best experience when using the Asana API.

Happy coding!

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>


</section>
