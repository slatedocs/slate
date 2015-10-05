Tests
=====

[augur.js](https://github.com/AugurProject/augur.js) includes unit tests.  Tests are run using [Mocha](http://mochajs.org/).

<code class="block">$ npm install -g mocha</code>

There are two test suites -- the first only runs tests which do not require sending transactions to the Ethereum network, and the second runs a full complement of tests, including tests that create events, markets, buy and sell shares, etc.  Generally, it is recommended to only run the full test suite on a private chain.

To run the test suite without transactional tests:

<code class="block">$ npm run testnet</code>

To set up a private chain to run the full test suite, run the included [setup.js script](https://github.com/AugurProject/augur.js/blob/master/scripts/setup.js).  This script requires a local installation of geth, and creates a fresh blockchain (with network ID 10101) in data directory `~/.augur-test`.  It does *not* create Ethereum accounts for you; you must set these up yourself prior to running setup.js.  The script assumes that your account password is in a file in the new data directory called `.password`.

The setup script also will upload the Augur contracts to the new blockchain.  You must have a local clone of the [augur-core](https://github.com/AugurProject/augur-core) repository on your machine for this to work.  The setup script can be run with npm:

<code class="block">$ npm run setup -- --augur /path/to/augur-core</code>

After the setup script finishes, you can run the full test suite using npm:

<code class="block">$ npm test -- --gospel</code>
