#The Bonsai Platform Documentation

This project is the public home for the source code for the Bonsai Platform documentation. You can find our documentation at http://docs.bons.ai/.

Our hope is that open-sourcing our documentation on GitHub helps our docs stay a living, breathing, constantly evolving project that users feel empowered to contribute to. If any documentation is unclear/missing we invite you to submit an issue or a pull request. But if you’d just rather give us feedback directly, [send us an email](mailto:support@bons.ai).

## Frequently Asked Questions
--------------------------

**What is this source code stufff? Where can I see the actual documentation?**

You'll want to go to http://docs.bons.ai/ for the compiled version. This project shows the source code we used to generate it so that you can submit issues or pull requests to it.

**How do I get my API documentation to look snazzy like yours?**

Check out [Slate](lord.github.io/slate).

**Where do I go to get into the Bonsai private beta?**

[Apply here](http://pages.bons.ai/apply.html) for access to our private beta.

## If You Want to Contribute
------------------------------

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 2.2.5 or newer**
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

Now that Slate is all set up on your machine, you'll probably want to learn more about [editing Slate markdown](https://github.com/lord/slate/wiki/Markdown-Syntax), or [how to publish your docs](https://github.com/lord/slate/wiki/Deploying-Slate).

If you'd prefer to use Docker, instructions are available [in the wiki](https://github.com/lord/slate/wiki/Docker).

## Need Help? Found a bug?
-----------------------

[Submit an issue](https://github.com/issues) to the Bonsai documentation repo if you need any help. And, of course, feel free to submit pull requests with bug fixes or changes if that's more your style.

