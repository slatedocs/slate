Tether API Documentation
========

The most recent compiled version of documentation is available at http://platform.tether.to/

This repository contains source files only. Feel free to submit pull requests with additions, examples and corrections to documentation.

Please report errors in API clients to the corresponding issue tracker on Bitbucket:

- [Tether API Ruby client](https://bitbucket.org/tetherto/tether-api-client-ruby/issues)
- Tether API PHP client (planned)
- Tether API Python client (planned)

The documentation is powered by [Slate](https://github.com/tripit/slate/).

Suggesting improvements to the documentation
------------------------------

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 1.9.3 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

 1. Clone the repository to your hard drive with `git clone git@github.com:WebLogicNow/tether-api-docs.git`
 2. `cd tether-api-docs`
 3. Install all dependencies: `bundle install`
 4. Start the test server: `bundle exec middleman server`

You can now see the docs at <http://localhost:4567>. Whoa! That was fast!

Now that Slate is all set up your machine, you'll probably want to learn more about [editing Slate markdown](https://github.com/tripit/slate/wiki/Markdown-Syntax), or [how to publish your docs](https://github.com/tripit/slate/wiki/Deploying-Slate).
