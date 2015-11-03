# How Scout Works

## Overview

Scout is engineered to monitor the performance of your mission-critical production applications by providing a low-overhead monitoring agent and service that values your security.

## Performance Overhead

Our agent is designed to run in production environments. We've benchmarked the response time overhead at roughly 3%. Generally, overhead increases as the number of methods are instrumented.

## Security

We take the security of your code metrics extremely seriously. Keeping your data secure is fundamental to our business. Scout is nearing a decade storing critical metrics with our server monitoring product and those same fundamentals are applied here:

* All data transmitted by our agent to our servers is sent via SSL.
* Our UI is only served under SSL.
* When additional data is collected for slow calls (ex: SQL queries), query parameters are sanitized before sending these to our servers.

### Git Integration

Scout only needs read-only access to your repository, but unfortunately, Github doesn't currently allow this - they only offer read-write permissions through their OAuth API.

We have asked Github to offer read-only permissions, and they've said that the feature coming soon. In the mean time, we're limited to the permissions structure Github offers. Our current Git security practices:

* we don't clone your repository's code; we only pull the commit history
* the commit history is secured on our servers according to industry best practices
* authentication subsystems within our application ensure your commit history is never exposed to anyone outside your account.

All that said, we suggest the following:

* [Contact Github](https://github.com/contact) about allowing read-only access. This will ensure it stays top-of-mind.
* This is optional and you are able to view backtrace information w/o the integration. It's likely possible to even write a UserScript to open the code locally in your editor or on Github.
