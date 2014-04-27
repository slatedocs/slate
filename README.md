DevNet Slate
========

DevNet Slate helps you create beautiful single-page API documentation. Think of it as an intelligent, modern documentation template for your API. This variation is based upon the Slate work done by Tripit which in turn was inspired by the API documentation by Stripe.

![Sample Screenshot of Format](https://rawgithub.com/pnerger/DevNetSlate/DevNet-Slate/source/images/DevNetSlate.png)

[View the live, interactive document now!](http://rawgithub.com/pnerger/DevNetSlate/DevNet-Slate/build/index.html)

Features
------------

* **Clean, intuitive design** — with DevNet Slate, the description of your API is on the left side of your documentation, and all the code examples are on the right side. Inspired by [Stripe's](https://stripe.com/docs/api) API docs. In addition to the design you see on screen, DevNet Slate comes with a print stylesheet, so your API docs look great on paper.

* **Everything on a single page** — gone are the days where your users had to search through a million pages to find what they wanted. Slate puts the entire documentation on a single page. We haven't sacrificed linkability, though. As you scroll, your browser's hash will update to the nearest header, so it's insanely easy to link to a particular point in the documentation.

* **Slate is just Markdown** — when you write docs with Slate, you're just writing Markdown, which makes it simple to edit and understand. Everything is written in Markdown — even the code samples are just Markdown code blocks!

* **Write code samples in multiple languages** — if your API has bindings in multiple programming languages, you easily put in tabs to switch between them. In your document, you'll distinguish different languages by specifying the language name at the top of each code block, just like with Github Flavored Markdown!

* **Out-of-the-box syntax highlighting** for [almost 60 languages](http://rouge.jayferd.us/demo), no configuration required.

* **Automatic, smoothly scrolling table of contents** on the far left of the page. As you scroll, it displays your current position in the document. It's fast, too. We're using Slate at TripIt to build documentation for our new API, where our table of contents has over 180 entries. We've made sure that the performance remains excellent, even for larger documents.

Getting starting with Slate is super easy! Simply fork this repository, and then follow the instructions below. Or, if you'd like to check out what Slate is capable of, take a look at the [How to Document a DevNet API](http://rawgithub.com/pnerger/DevNetSlate/DevNet-Slate/build/index.html#installing-the-prerequsites)

Getting Started with Slate
------------------------------

### Prerequisites

You're going to need:

 - **Ruby, version 1.9.3 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

 1. Fork this repository on Github.
 2. Clone *your forked repository* (not our original one) to your hard drive with `git clone https://github.com/YOURUSERNAME/DevNetSlate.git`
 3. `cd DevNetSlate`
 4. Install all dependencies: `bundle install`
 5. Start the test server: `bundle exec middleman server`

You can now see the docs at <http://localhost:4567>. And as you edit `source/index.md`, your server should automatically update! Whoa! That was fast!

Learn How to Create a DevNet Slate API Document
---------------------------------

* [How to Document a DevNet API](http://rawgithub.com/pnerger/DevNetSlate/DevNet-Slate/build/index.html)

Special Thanks
--------------------
- [Tripit Slate](https://github.com/tripit/slate)
- [Middleman](https://github.com/middleman/middleman)
- [jquery.tocify.js](https://github.com/gfranko/jquery.tocify.js)
- [middleman-syntax](https://github.com/middleman/middleman-syntax)
- [middleman-gh-pages](https://github.com/neo/middleman-gh-pages)
- [Font Awesome](http://fortawesome.github.io/Font-Awesome/)
- [@chrissrogers](https://github.com/chrissrogers)
- [@bootstraponline](https://github.com/bootstraponline)

