---
title: Augur documentation

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
  - contributing

search: true
---
Overview
========

[Augur](http://augur.net) is a decentralized prediction market platform that runs on Ethereum.

Getting started
---------------

The Augur client (user interface) is built and hosted at [client.augur.net](http://client.augur.net).  If you want to use or help test Augur, you do not need to download or install anything!  Just go to [client.augur.net](http://client.augur.net) and start using it.  The latest bleeding-edge development build is at [development.augur.divshot.io](http://development.augur.divshot.io).

If you want to help develop Augur, you will need to build the client from source.  To do this, first install [Node.js](https://nodejs.org/), then execute the following commands to build the client:

`$ git clone https://github.com/AugurProject/augur.git`

`$ cd augur`

`$ ./nuke`

(`nuke` is a simple shell script that rebuilds the client.)  Next, start the static web server:

`$ npm start`

Finally, go to [http://localhost:8080](http://localhost:8080) in your web browser.  You should be greeted by Augur's overview interface.  Congratulations, you're ready to start hacking!

<aside class="notice">If you are using or helping develop the Augur client (i.e., the front-end/user interface), it is usually not necessary for you to run a local Ethereum node on your computer.  We're already running several [hosted nodes](http://docs.augur.net/#hosted-node) that you can simply plug into!  Presently, the hosted nodes provide a snappier/more pleasant user (and developer) experience, due to a [caching process](https://github.com/AugurProject/marketeer) attached to each hosted node.  If you are running an Ethereum node, the client will automatically detect it and begin talking to it; if you are not, the client will default to using the hosted nodes.</aside>
