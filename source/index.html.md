---
title: Chestnut API Docs

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>

includes:
  - estimates/shipping
  - estimates/carbon
  - errors

search: true
---

# Introduction

Welcome to chestnut. As you know, this is where the magic happens.

# Authentication

> To authorize, use this code:

```ruby
require 'chestnut'

api = Chestnut::APIClient.authorize!('your_secret_chestnut_key')
```

```python
import chestnut

api = chestnut.authorize('your_secret_chestnut_key')
```

```shell
# With shell, you can just pass the correct header with each request
curl "https://api.getchesnut.co.uk/"
  -H "Authorization: your_secret_chestnut_key"
```

```javascript
const chestnut = require('chestnut');

let api = chestnut.authorize('your_secret_chestnut_key');
```

> Make sure to replace `your_secret_chestnut_key` with your API key.

Chestnut uses API keys to allow access to the API. You can register a new Chestnut API key at our [developer portal](http://example.com/developers).

Chestnut expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: your_secret_chestnut_key`

<aside class="notice">
You must replace <code>your_secret_chestnut_key</code> with your personal API key.
</aside>

# Estimate
