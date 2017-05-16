# Scout APM Help Docs

This is the helpsite for Scout APM. It's built using Slate and hosted on Github pages. It's accessible via a CNAME @ http://help.apm.scoutapp.com.

## Requirements

Ruby 2.2.2 or greater.

## Installation

Just run `bundle`.

## Making changes
=======
<p align="center">
  <img src="https://raw.githubusercontent.com/lord/img/master/logo-slate.png" alt="Slate: API Documentation Generator" width="226">
  <br>
  <a href="https://travis-ci.org/lord/slate"><img src="https://travis-ci.org/lord/slate.svg?branch=master" alt="Build Status"></a>
</p>

<p align="center">Slate helps you create beautiful, intelligent, responsive API documentation.</p>

<p align="center"><img src="https://raw.githubusercontent.com/lord/img/master/screenshot-slate.png" width=700 alt="Screenshot of Example Documentation created with Slate"></p>

<p align="center"><em>The example above was created with Slate. Check it out at <a href="https://lord.github.io/slate">lord.github.io/slate</a>.</em></p>
>>>>>>> upstream/master

Start the server: `bundle exec middleman server`

## Gotchas

### Duplicate header names

The toc generation and anchorjs dont' handle duplicate header names well. If you create a duplicate header, specify a unique element id:

```
<h3 id="elixir-testing-instrumentation">Testing instrumentation</h3>
```

### Upgrading

Note that Slate is not a Ruby gem: it's a GitHub repo that we fork that includes gems and assets.