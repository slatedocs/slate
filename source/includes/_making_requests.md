# Making requests

> `Request to JSON API should be done using following signature.`

```js
// Example using axios lib
import axios from 'axios';

// ....
const options = {
  id: null,
  jsonrpc: '2.0',
  method: 'call',
  params: {
    // method arguments
  }
}

axios.post('http://domain.com/signin/1.0/json', options)
// ...
```

```js
// React Native Fetch API example
const params = {
  id: null,
  jsonrpc: '2.0',
  method: 'call',
  params: {
    // method arguments
  }
};

const options = {
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
  method: 'POST',
  body: JSON.stringify(params),
}

fetch('http://domain.com/signin/1.0/json', options)
  .then(data => {
    // ...
  }, err => {
    // ...
  })
```
