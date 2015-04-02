Chartboost API Documentation
========
Welcome to the Chartboost Public API source code repository!

This repo was forked from Slate. Check it out at [tripit.github.io/slate](http://tripit.github.io/slate).

Getting Started with this repo
------------------------------

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 1.9.3 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

 1. Clone this repository.
 2. `cd api-docs`
 3. Install all dependencies: `bundle install`
 4. Start the test server: `bundle exec middleman server`

Or use the included Dockerfile! (must install Docker first)

```shell
docker build -t chartboost/apidocs .
docker run -d -p 4567:4567 apidocs
```

You can now see the docs at <http://localhost:4567>. Whoa! That was fast!

*Note: if you're using the Docker setup on OS X, the docs will be
availalable at the output of `boot2docker ip` or `docker-machine ip [VM name]` instead of `localhost:4567`.*

Now that the initial setup, you'll probably want to learn more about [editing Slate markdown](https://github.com/tripit/slate/wiki/Markdown-Syntax), or [how to publish your docs](https://github.com/tripit/slate/wiki/Deploying-Slate).


Need Help? Found a bug?
--------------------

Just [submit an issue](https://github.com/Chartboost/api-docs/issues) to this repo if you need any help. And, of course, feel free to submit pull requests with bug fixes or changes.ages)
- [Font Awesome](http://fortawesome.github.io/Font-Awesome/)
