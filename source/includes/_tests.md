Tests
=====

[augur.js](https://github.com/AugurProject/augur.js) includes unit tests.  Tests are run using [Mocha](http://mochajs.org/).

<code class="block">$ npm install -g mocha</code>

There are two test suites -- unit tests and integration tests.  Generally, it is recommended to only run the integration tests on a private chain.

To run the unit tests:

<code class="block">$ npm test</code>

To run the integration tests:

<code class="block">$ npm run integration-test</code>
