ControlShift Labs API Documentation
------------------------------------

The ControlShift Labs API documentation uses Slate - a middleman static site template of sorts for API documentation.

### Updating Content

* This branch is based on the v1.3.2 release (tag)
* The only files you should need to edit:
  * `/build/index.html.md`
  * `/build/includes/*.md`
* Webhooks documentation is auto-updated from https://demo.controlshiftlabs.com/api/webhooks.json at build. Just redeploy to update.

### Content Considerations:

* Our audience includes very junior developers and even non-coders, attempting to pull content into their WISIWYG CRM pages.
* All examples and JS should be exceedingly basic, with generally linear control flows, and extremly easy to follow.

### Editing "External" Codepen.io Examples

Our codepen.io code examples are actually **generated/spawned on the fly** using codepen.io's [prefill API](https://blog.codepen.io/documentation/api/prefill/). Our "Launch Example" button links are actually form submit buttons sending post requests to the prefill endpoint.

* All the JS and HTML is handled at the bottom of the json_*.md files. The most complete example of the options were utilizing is in the `_json_effort_petitions_near.md` file.
* There is JS and some default options at the bottom of `layout.erb`.  This JS transforms the inline HTML content into the proper format for the API endpoint.

This approach has two key benefits. First, there are no external dependencies/assets we need to maintain. It also puts in a position where we could let clients set their own domains or arrive at the documents with their domain in the URL, have our examples use this domain, and potential populate examples JSON payloads with the client's actual content.

### Deploying to github pages

You just need to run `./deploy.sh`, and that script will deploy to whatever git's origin is set-up as. If you're not deploying master, you will need to specify the branch name. Example:

    GIT_DEPLOY_BRANCH=mf-cs-documentation ./deploy.sh


-----


Getting Started with Slate
------------------------------

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 1.9.3 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

1. Fork this repository on Github.
2. Clone *your forked repository* (not our original one) to your hard drive with `git clone https://github.com/YOURUSERNAME/slate.git`
3. `cd slate`
4. Initialize and start Slate. You can either do this locally, or with Vagrant:

```shell
# either run this to run locally
bundle install
bundle exec middleman server

# OR run this to run with vagrant
vagrant up
```

You can now see the docs at http://localhost:4567. Whoa! That was fast!

Now that Slate is all set up your machine, you'll probably want to learn more about [editing Slate markdown](https://github.com/tripit/slate/wiki/Markdown-Syntax), or [how to publish your docs](https://github.com/tripit/slate/wiki/Deploying-Slate).

Companies Using Slate
---------------------------------

* [NASA](https://api.nasa.gov)
* [IBM Cloudant](https://docs.cloudant.com/api.html)
* [Travis-CI](https://docs.travis-ci.com/api/)
* [Mozilla](http://mozilla.github.io/localForage/)
* [Appium](http://appium.io/slate/en/master)
* [Dwolla](https://docs.dwolla.com/)
* [Clearbit](https://clearbit.com/docs)
* [Coinbase](https://developers.coinbase.com/api)
* [Parrot Drones](http://developer.parrot.com/docs/bebop/)
* [Fidor Bank](http://docs.fidor.de/)

You can view more in [the list on the wiki](https://github.com/tripit/slate/wiki/Slate-in-the-Wild).

Need Help? Found a bug?
--------------------

Read our [contribution guidelines](https://github.com/tripit/slate/blob/master/CONTRIBUTING.md), and then [submit a issue](https://github.com/tripit/slate/issues) to the Slate Github if you need any help. And, of course, feel free to submit pull requests with bug fixes or changes.

Contributors
--------------------

Slate was built by [Robert Lord](https://lord.io) while at [TripIt](https://www.tripit.com/).

Thanks to the following people who have submitted major pull requests:

- [@chrissrogers](https://github.com/chrissrogers)
- [@bootstraponline](https://github.com/bootstraponline)
- [@realityking](https://github.com/realityking)

Also, thanks to [Sauce Labs](http://saucelabs.com) for helping sponsor the project.

Special Thanks
--------------------
- [Middleman](https://github.com/middleman/middleman)
- [jquery.tocify.js](https://github.com/gfranko/jquery.tocify.js)
- [middleman-syntax](https://github.com/middleman/middleman-syntax)
- [middleman-gh-pages](https://github.com/edgecase/middleman-gh-pages)
- [Font Awesome](http://fortawesome.github.io/Font-Awesome/)
