ControlShift Labs API Documentation
------------------------------------

The ControlShift Labs API documentation uses slate - a middleman static site template of sorts for API documentation.  This repo forks middleman's existing repo - the recommended means of getting started.

A few things to note when making updates:

* This branch is based on the v1.3.2 release (tag)
* The only files you should need to edit are `index.html.md` and the `*.md` files in the includes folder.  One can safely ignore everything else.

A few notes when editing/updating code examples:

* Our audience includes very junior developers and even non-coders, attempting to pull content into their WISIWYG CRM pages.
* All examples and JS should be exceedingly basic, with generally linear control flows, and extremly easy to follow.

## Extracting Webhook Documentation

If necessary to do so again, this js creates required webhooks documentation assets from the webhooks admin page.  Some manual reformatting of the main output is required.

```js
labels = []; $('.notification-event-types tr').not('.hideable-row').find('td:nth-child(2)').each(function(index,data){ labels.push($(data).text())});
desc = []; $('.notification-event-types tr').not('.hideable-row').find('td:last-child').each(function(index,data){ desc.push($(data).text())});
payloads = [];$('.notification-event-types tr.hideable-row td:last-child div').each(function(index,data){ payloads.push( $(data).html())});
output = '';$.each(labels, function(index, data){ output += "## "+data+"\n"+"> "+payloads[index]+"\n\n"+desc[index]+"\n\n" });output;
summaryTable = '';$.each(labels, function(index, data){ summaryTable += '['+data+'](#'+data.replace(/\./g,'-')+')'+" | "+desc[index]+"\n" }); summaryTable;
```


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
