---
title: Augur JavaScript API

language_tabs:
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - numbers
  - callbacks
  - api
  - rpc
  - batch
  - tests
  - errors

search: true
---
Overview
========

To use augur.js, you must be running a local Ethereum node.  By default, it expects your Ethereum client to be listening on port 8545.  Note that we've only tested with [geth](https://github.com/ethereum/go-ethereum) so far; use with [eth](https://github.com/ethereum/cpp-ethereum) or [pyethapp](https://github.com/ethereum/pyethapp) at your own risk.

To use "send" RPC commands, you will need to unlock your client.  The easiest way to do this is to start geth with the `--unlock` option:

    $ geth --rpc --rpccorsdomain "http://localhost:8545" --rpcapi "shh,db,eth,net,web3" --shh --unlock 0

augur.js can be installed using [npm](https://www.npmjs.com/):

    $ npm install augur.js

After installing, just require augur.js to use it:

```javascript
var Augur = require('augur.js');
Augur.connect();
```

By default, augur.js will look for a localhost Ethereum node listening on port 8545.  To change this, just call pass your RPC connection info (as an object or a URL string) to the `connect` method.  For example:

```javascript
Augur.connect({ protocol: "http", host: "localhost", port: 8545 });
Augur.connect("http://poc9.com:8545");
Augur.connect("127.0.0.1");
```
