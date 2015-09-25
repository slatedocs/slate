---
title: Augur API

language_tabs:
  - javascript: JavaScript

toc_footers:
  - <a href="http://www.augur.net">Augur.net</a>
  - <a href="http://demo.augur.net">Demo</a>
  - <a href="http://augur.link/augur.pdf">Whitepaper</a>
  - <a href="https://github.com/AugurProject">Github</a>
  - <a href="https://twitter.com/AugurProject">Twitter</a>

includes:
  - architecture
  - accounts
  - callbacks
  - numbers
  - api
  - rpc
  - filters
  - batch
  - tests
  - errors

search: true
---
Overview
========

The [Augur API](https://github.com/AugurProject/augur.js) requires an [Ethereum](https://www.ethereum.org/) client to communicate with [Augur's smart contracts](https://github.com/AugurProject/augur-core).  Our testing has been primarily carried out with the [Go](https://github.com/ethereum/go-ethereum) Ethereum implementation (geth).

Getting started
---------------

```javascript
// After installing, just require augur.js to use it.
var augur = require("augur.js");

// Attempt to connect to a local Ethereum node (on http://localhost:8545)
augur.connect();

// Connect to one of Augur's public nodes (eth1.augur.net)
augur.connect("http://eth1.augur.net");
```

The easiest way to install augur.js is using [npm](https://www.npmjs.com/package/augur.js):

`$ npm install augur.js`

To use the Augur API, augur.js needs to connect to an Ethereum node.  By default, augur.js will look for a localhost Ethereum node listening on port 8545.  To change this, just call pass your RPC connection info to `Augur.connect`.
