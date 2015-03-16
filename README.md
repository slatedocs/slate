RubiconMD API Docs [powered by Slate]
========

[![Build Status](https://travis-ci.org/tripit/slate.svg?branch=master)](https://travis-ci.org/tripit/slate) [![Dependency Status](https://gemnasium.com/tripit/slate.png)](https://gemnasium.com/tripit/slate)

Slate helps you create beautiful API documentation. Think of it as an intelligent, responsive documentation template for your API.

<img src="https://dl.dropboxusercontent.com/u/95847291/github%20images/slate/slate_screenshot_new.png" width=700 alt="Screenshot of Example Documentation created with Slate">

*The example above was created with Slate. Check it out at [tripit.github.io/slate](http://tripit.github.io/slate).*


Getting Started with Slate
------------------------------

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 1.9.3 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

 1. Clone *the API docs repository* to your hard drive with `git clone git@github.com:rubiconmd/api-documentation.git`
 2. Make all the changes you want to do into the `/source` folder.
 3. When you are done, push the changes to Github.
 4. Add "gh-pages" as a local branch pointing to the remote.
 5. Publish your work with `rake publish`.

You can now see the docs at <http://rubiconmd.github.io/api-documentation/>.

### Previews

To preview your changes on a localhost prior to deployment, start the test server by `bundle exec middleman server` or `middleman server`

Then pull up `http://localhost:4567` on your browser. Boom!

Some useful links
---------------------------------

* [Editing Slate markdown](https://github.com/tripit/slate/wiki/Markdown-Syntax)


Need Help? Found a bug?
--------------------

Just [submit a issue](https://github.com/tripit/slate/issues) to the Slate Github if you need any help. And, of course, feel free to submit pull requests with bug fixes or changes.
