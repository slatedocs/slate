<!-- ---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true

multiple_pages: true

resources:
  - <a href='kittens/index.html' class='toc-h1 toc-link' data-title='kittens'>kittens</a>

kittens:
  - <a href='kittens/index.html#get-all-kittens' class='toc-h2 toc-link' data-title='get-all-kittens'>Get All Kittens</a>
  - <a href='kittens/index.html#get-a-specific-kitten' class='toc-h2 toc-link' data-title='get-a-specific-kitten'>Get a specific kitten</a>
  - <a href='kittens/index.html#delete-a-specific-kitten' class='toc-h2 toc-link' data-title='delete-a-specific-kitten'>Delete a specific kitten</a>
---

# Kittens

## Delete a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete -->
