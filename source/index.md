---
title: Augur documentation

language_tabs:
  - javascript: JavaScript

toc_footers:
  - <a href="http://www.augur.net">Augur.net</a>
  - <a href="http://client.augur.net">Client</a>
  - <a href="http://augur.link/augur.pdf">Whitepaper</a>
  - <a href="https://github.com/AugurProject">Github</a>
  - <a href="https://twitter.com/AugurProject">Twitter</a>

includes:
  - architecture
  - api
  - accounts
  - callbacks
  - numbers
  - rpc
  - filters
  - batch
  - geth
  - tests
  - errors
  - contributing

search: true
---
Overview
========

[Augur](http://augur.net) is a decentralized prediction market platform that runs on Ethereum.

The stable Augur client (user interface) is built and hosted at [client.augur.net](https://client.augur.net).  If you want to use or help test Augur, you do not need to download or install anything!  Just go to [client.augur.net](https://client.augur.net) and start using it.  (If you want to use our cutting-edge development client, this is maintained at [augur-dev.firebaseapp.com](https://augur-dev.firebaseapp.com) -- warning, we push changes to augur-dev pretty rapidly, so it can be a bit buggy!)

If you want to help develop Augur, you will need to build the client from source.  To do this, first install [Node.js](https://nodejs.org/), then execute the following commands to build the client:

`$ git clone https://github.com/AugurProject/augur.git`

`$ cd augur`

`$ ./nuke`

(`nuke` is a simple shell script that rebuilds the client.)  Next, start the static web server:

`$ npm start`

Finally, go to [http://localhost:8080](http://localhost:8080) in your web browser.  You should be greeted by Augur's overview interface.  Congratulations, you're ready to start hacking!

<aside class="notice"><b>If you are using or helping develop the Augur client (i.e., the front-end/user interface), it is usually not necessary for you to run a local Ethereum node on your computer.</b>  We're already running several <a href="http://docs.augur.net/#hosted-node">hosted nodes</a> that you can simply plug into!  If you are running an Ethereum node, the client will automatically detect it and begin talking to it; if you are not, the client will default to using the hosted nodes.</aside>
