---
title: Augur API

language_tabs:
  - javascript: JavaScript

toc_footers:
  - <a href="http://www.augur.net">Augur.net</a>
  - <a href="http://demo.augur.net">Demo</a>
  - <a href="https://github.com/AugurProject">Github</a>
  - <a href="https://twitter.com/AugurProject">Twitter</a>

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

The [Augur JavaScript API](https://github.com/AugurProject/augur.js) requires an [Ethereum](https://www.ethereum.org/) client to communicate with [Augur's smart contracts](https://github.com/AugurProject/augur-core).  Our testing has been primarily carried out with the [Go](https://github.com/ethereum/go-ethereum) Ethereum implementation (geth).

If you are running a [local Ethereum node](https://github.com/ethereum/go-ethereum/wiki/Building-Ethereum), sending RPC requests to your local node is the preferred (and by far the fastest) way to use the Augur API.

<aside class="notice">To use "sendTransaction" RPC commands (i.e., anything that requires Ether / is actually sent to the network) you will need to unlock your Ethereum node.  If you are running geth, the easiest way to do this is to start it with the <code>--unlock</code> option:

<code class="block">geth --unlock 0 --rpc --rpccorsdomain "http://localhost:8545" --rpcapi "shh,db,eth,net,web3" --shh</code>
</aside>

If maintaining a local Ethereum node isn't practical for you, Augur has a public Ethereum node at [http://geth.augur.net](http://geth.augur.net).

Installation
------------

The easiest way to install augur.js is using [npm](https://www.npmjs.com/package/augur.js):

`npm install augur.js`

```javascript
// After installing, just require augur.js to use it.

var Augur = require('augur.js');
```

Getting started
---------------

To use the Augur API, augur.js needs to connect to an Ethereum node:

```javascript
Augur.connect();
```

By default, augur.js will look for a localhost Ethereum node listening on port 8545.  To change this, just call pass your RPC connection info to `Augur.connect`.  For example, to connect to Augur's public node:

```javascript
var ethereumNode = "geth.augur.net"; // default: "localhost:8545"

Augur.connect(ethereumNode);
```
