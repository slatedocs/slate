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
  - accounts
  - callbacks
  - numbers
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

<code class="block">geth --unlock 0 --rpc --rpccorsdomain "http://localhost:8545" --rpcapi "shh,db,eth,net,web3" --shh --genesis /path/to/genesis_block.json --networkid 7</code>
where <code>/path/to/genesis_block.json</code> is the genesis block for the (temporary) Augur private chain.  <a href="http://augur.link/genesis_block.json">Download the genesis block here.</a>
</aside>

Augur maintains five public Ethereum nodes:

- [http://eth1.augur.net](http://eth1.augur.net)
- [http://eth2.augur.net](http://eth2.augur.net)
- [http://eth3.augur.net](http://eth3.augur.net)
- [http://eth4.augur.net](http://eth4.augur.net)
- [http://eth5.augur.net](http://eth5.augur.net)

Nodes [eth1](http://eth1.augur.net), [eth3](http://eth3.augur.net), [eth4](http://eth4.augur.net) and [eth5](http://eth5.augur.net) are temporarily on a private chain (networkid 7).  We plan to move to the Frontier testnet once it is set up!  [eth2.augur.net](http://eth2.augur.net) is on the Frontier network, and is being used by the [Augur Reputation sale app](https://sale.augur.net) until the end of the sale on Oct. 1 at noon EST.

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
