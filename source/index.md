---
title: Augur API

toc_footers:
  - <a href='http://www.augur.net'>Augur Project</a>
  - <a href='https://github.com/AugurProject'>Github</a>
  - <a href='https://twitter.com/AugurProject'>Twitter</a>
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

The [Augur JavaScript API](https://github.com/AugurProject/augur.js) requires an [Ethereum](https://www.ethereum.org/) client to communicate with [Augur's smart contracts](https://github.com/AugurProject/augur-core).  Our testing has been primarily carried out with the [Go](https://github.com/ethereum/go-ethereum) Ethereum implementation (geth).

Augur's public Ethereum node is located at: [http://poc9.com](http://poc9.com)

If you want to use your local Ethereum node, in order to use "send" RPC commands -- that is, RPC commands that consume ether! -- you will need to unlock your node.  The easiest way to do this is to start geth with the `--unlock` option:

```shell
geth --rpc --rpccorsdomain "http://localhost:8545" --rpcapi "shh,db,eth,net,web3" --shh --unlock 0
```

Installation
------------

The easiest way to install augur.js is using [npm](https://www.npmjs.com/package/augur.js):

```shell
npm install augur.js
```

After installing, just require augur.js to use it:

```javascript
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
