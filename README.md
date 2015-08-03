SafetyCulture API Documentation
========

This repository contains the SafetyCulture API documentation.

> Copyright 2015, SafetyCulture Pty Ltd.
> All rights reserved.

*This documentation was created with Slate. Check it out at [tripit.github.io/slate](http://tripit.github.io/slate).*

## Building, running

To build and run it locally see the [slate documentation](https://github.com/tripit/slate#getting-started-with-slate).

Basically you need ruby installed and then:
```sh
$ gem install bundler
$ bundle install
$ rake build
$ bundle exec middleman server
$ open http://localhost:4567/
```

Sometimes `bundle exec middleman server` might not work or work fine but pages can never be opened.
As a workaround do the following:
```sh
$ npm i -g node-static
$ static -p 4567 build
```
