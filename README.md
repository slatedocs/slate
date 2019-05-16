# Scout APM Help Docs

This is the helpsite for Scout APM. It's built using Slate and hosted on Github pages. It's accessible via a CNAME @ https://docs.scoutapm.com.

## Requirements

Ruby 2.2.2 or greater.

## Installation

Just run `bundle`.

## Making changes

* Start the server: `bundle exec middleman server`
* Commit, Push
* Deploy: `bundle exec rake publish` => updates the `gh-pages` branch with the build.

## Gotchas

### Duplicate header names

The toc generation and anchorjs dont' handle duplicate header names well. If you create a duplicate header, specify a unique element id:

```
<h3 id="elixir-testing-instrumentation">Testing instrumentation</h3>
```

### Upgrading

Note that Slate is not a Ruby gem: it's a GitHub repo that we fork that includes gems and assets.