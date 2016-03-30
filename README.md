RubiconMD API Docs [powered by Slate]
========

<p align="center">
  <img src="https://raw.githubusercontent.com/lord/img/master/logo-slate.png" alt="Slate: API Documentation Generator" width="226">
  <br>
  <a href="https://travis-ci.org/tripit/slate"><img src="https://travis-ci.org/tripit/slate.svg?branch=master" alt="Build Status"></a>
</p>

<p align="center">Slate helps you create beautiful, intelligent, responsive API documentation.</p>

<p align="center"><img src="https://dl.dropboxusercontent.com/u/95847291/github%20images/slate/slate_screenshot_new.png" width=700 alt="Screenshot of Example Documentation created with Slate"></p>

<p align="center"><em>The example above was created with Slate. Check it out at <a href="https://tripit.github.io/slate">tripit.github.io/slate</a>.</em></p>


Getting Started with Slate
------------------------------

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 1.9.3 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

 1. Clone *the API docs repository* to your hard drive with `git clone git@github.com:rubiconmd/api-documentation.git`
 2. Make all the changes you want to do into the `/source` folder. Specifically, `/source/index.html.md` and `/source/includes/_errors.md`
 3. When you are done, push the changes to Github.
 4. Add "gh-pages" as a local branch pointing to the remote.
 5. Publish your work with `./deploy.sh`.

You can now see the docs at <http://rubiconmd.github.io/api-documentation/>.

### Previews

To preview your changes on a localhost prior to deployment, start the test server by `bundle exec middleman server` or `middleman server`

Don't forget to `bundle install` or `bundle` if you just merged in new code from the upstream.

You can now see the docs at http://localhost:4567. Whoa! That was fast!

Some useful links
---------------------------------

--> [Editing Slate markdown](https://github.com/tripit/slate/wiki/Markdown-Syntax)

Need Help? Found a bug?
--------------------

Just [submit a issue](https://github.com/tripit/slate/issues) to the Slate Github if you need any help. And, of course, feel free to submit pull requests with bug fixes or changes.

Read our [contribution guidelines](https://github.com/tripit/slate/blob/master/CONTRIBUTING.md), and then [submit an issue](https://github.com/tripit/slate/issues) to the Slate Github if you need any help. And, of course, feel free to submit pull requests with bug fixes or changes.
