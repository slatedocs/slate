<p align="center">
  <img src="https://raw.githubusercontent.com/lord/img/master/logo-slate.png" alt="Slate: API Documentation Generator" width="226">
  <br>
  <a href="https://travis-ci.org/tripit/slate"><img src="https://travis-ci.org/tripit/slate.svg?branch=master" alt="Build Status"></a>
</p>

<p align="center">Slate helps you create beautiful, intelligent, responsive API documentation.</p>

<p align="center"><img src="https://dl.dropboxusercontent.com/u/95847291/github%20images/slate/slate_screenshot_new.png" width=700 alt="Screenshot of Example Documentation created with Slate"></p>

<p align="center"><em>The example above was created with Slate. Check it out at <a href="https://tripit.github.io/slate">tripit.github.io/slate</a>.</em></p>

Getting started with Slate is super easy! Simply fork this repository and follow the instructions below. Or, if you'd like to check out what Slate is capable of, take a look at the [sample docs](http://tripit.github.io/slate).

<!--As an example, you can check out the [TripIt API docs](http://tripit.github.io/api), which we create with Slate. You can also view the source of the [markdown file used to generate it](http://github.com/tripit/api/blob/master/source/index.md).-->

BBOXX SLATE INSTRUCTIONS
------------------------
**Install Instructions**
 ```
 sudo apt-add-repository ppa:brightbox/ruby-ng
 sudo apt-get update
 sudo apt-get install ruby2.2 ruby2.2-dev
 sudo apt-get install ruby-bundler
```
 
**Autogenerate docs**
 - clone the slate repository
 - run the backend locally
 - ensure that a folder called "docs" is present in the /app directory
 - navigate to: http://localhost/v1/generate_slate_docs to fill the /docs folder with auto-gen documentation
 - copy the \_\<doc-name\>.md files over to the `includes` folder in the slate repo. 
 - add the file paths (minus the preceeding _ and the trailing .md to the \_includes.md file
 
 **Host docs locally**
 ```
 bundle install
 bundle exec middleman server
 ```
 - view newly created docs at http://localhost:4567
 - Now that Slate is all set up your machine, you'll probably want to learn more about [editing Slate markdown (https://github.com/tripit/slate/wiki/Markdown-Syntax), or [how to publish your docs](https://github.com/tripit/slate/wiki/Deploying-Slate).

 **Publish Docs**
 - push changes to MASTER branch
 - view newly published docs at http://docs.smart.bboxx.co.uk
 
 
Features
------------

* **Clean, intuitive design** — With Slate, the description of your API is on the left side of your documentation, and all the code examples are on the right side. Inspired by [Stripe's](https://stripe.com/docs/api) and [Paypal's](https://developer.paypal.com/webapps/developer/docs/api/) API docs. Slate is responsive, so it looks great on tablets, phones, and even in print.

* **Everything on a single page** — Gone are the days when your users had to search through a million pages to find what they wanted. Slate puts the entire documentation on a single page. We haven't sacrificed linkability, though. As you scroll, your browser's hash will update to the nearest header, so linking to a particular point in the documentation is still natural and easy.

* **Slate is just Markdown** — When you write docs with Slate, you're just writing Markdown, which makes it simple to edit and understand. Everything is written in Markdown — even the code samples are just Markdown code blocks.

* **Write code samples in multiple languages** — If your API has bindings in multiple programming languages, you can easily put in tabs to switch between them. In your document, you'll distinguish different languages by specifying the language name at the top of each code block, just like with Github Flavored Markdown.

* **Out-of-the-box syntax highlighting** for [almost 60 languages](http://rouge.jayferd.us/demo), no configuration required.

* **Automatic, smoothly scrolling table of contents** on the far left of the page. As you scroll, it displays your current position in the document. It's fast, too. We're using Slate at TripIt to build documentation for our new API, where our table of contents has over 180 entries. We've made sure that the performance remains excellent, even for larger documents.

* **Let your users update your documentation for you** — By default, your Slate-generated documentation is hosted in a public Github repository. Not only does this mean you get free hosting for your docs with Github Pages, but it also makes it simple for other developers to make pull requests to your docs if they find typos or other problems. Of course, if you don't want to use GitHub, you're also welcome to host your docs elsewhere.

