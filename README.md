<p align="center">
  <img
  src="https://raw.githubusercontent.com/rubberstamp/slate/master/source/images/logo.png"
  alt="Rubberstamp API Documentation" width="226">
</p>

<p align="center"><em>Rubberstamp is a simple Purchase Order Solution.</em></p>

If you are here to view Rubberstamp API documentation then this is not the proper place to view them,
Please visit [rubberstamp.github.io/slate](https://rubberstamp.github.io/slate) for documentation


This project is maintained using [slate](https://github.com/lord/slate).

Features
------------

* **Clean, intuitive design** — With Slate, the description of your API is on the left side of your documentation, and all the code examples are on the right side. Inspired by [Stripe's](https://stripe.com/docs/api) and [Paypal's](https://developer.paypal.com/webapps/developer/docs/api/) API docs. Slate is responsive, so it looks great on tablets, phones, and even in print.

* **Everything on a single page** — Gone are the days when your users had to search through a million pages to find what they wanted. Slate puts the entire documentation on a single page. We haven't sacrificed linkability, though. As you scroll, your browser's hash will update to the nearest header, so linking to a particular point in the documentation is still natural and easy.

* **Slate is just Markdown** — When you write docs with Slate, you're just writing Markdown, which makes it simple to edit and understand. Everything is written in Markdown — even the code samples are just Markdown code blocks.

* **Write code samples in multiple languages** — If your API has bindings in multiple programming languages, you can easily put in tabs to switch between them. In your document, you'll distinguish different languages by specifying the language name at the top of each code block, just like with Github Flavored Markdown.

* **Out-of-the-box syntax highlighting** for [over 100 languages](https://github.com/jneen/rouge/wiki/List-of-supported-languages-and-lexers), no configuration required.

* **Automatic, smoothly scrolling table of contents** on the far left of the page. As you scroll, it displays your current position in the document. It's fast, too. We're using Slate at TripIt to build documentation for our new API, where our table of contents has over 180 entries. We've made sure that the performance remains excellent, even for larger documents.

* **Let your users update your documentation for you** — By default, your Slate-generated documentation is hosted in a public Github repository. Not only does this mean you get free hosting for your docs with Github Pages, but it also makes it simple for other developers to make pull requests to your docs if they find typos or other problems. Of course, if you don't want to use GitHub, you're also welcome to host your docs elsewhere.

Getting started with Slate is super easy! Simply fork this repository and follow the instructions below. Or, if you'd like to check out what Slate is capable of, take a look at the [sample docs](http://lord.github.io/slate).

Getting Started
---------------

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 2.3.1 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

1. Clone this repository
2. `cd` into it
3. Initialize and start Slate. You can either do this locally, or with Vagrant:

```shell
# either run this to run locally
bundle install
bundle exec middleman server

# OR run this to run with vagrant
vagrant up
```

You can now see the docs at http://localhost:4567. Whoa! That was fast!

Now that Slate is all set up on your machine, you'll probably want to learn more about [editing Slate markdown](https://github.com/lord/slate/wiki/Markdown-Syntax), or [how to publish your docs](https://github.com/lord/slate/wiki/Deploying-Slate).

If you'd prefer to use Docker, instructions are available [in the wiki](https://github.com/lord/slate/wiki/Docker).

Need Help? Found a bug?
--------------------

[Submit an issue](https://github.com/rubberstamp/slate/issues) to the docs Github if you need any help.
And, of course, feel free to submit pull requests with bug fixes or changes.
