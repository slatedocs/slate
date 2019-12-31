# Transferwise API documentation

Live version of the docs is [here](https://api-docs.transferwise.com).

All contributions are welcome and encouraged!

This project is forked from [Slate](https://github.com/lord/slate).

For partner-usecases (third party payments, connected apps) refer to https://transferwise.github.io/api-docs-partners/

## How to edit the docs?

1. [Run the project locally](#run-the-project-locally)
2. Do your changes (most of the text is in `/source/includes` folder). Learn more about [editing Slate markdown](https://github.com/lord/slate/wiki/Markdown-Syntax)
3. Create a pull request.

Your changes will be deployed automatically when merged to master.

For more detailed guides etc go to [Slate documentation](https://github.com/lord/slate).

## Run the project locally

### Prerequisites

You're going to need:

 - **Linux or macOS** — Windows may work, but is unsupported.
 - **Ruby, version 2.3.1 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

1. Clone the repository and switch to the folder (`cd api-docs`)
2. Initialize and start Slate:

```shell
bundle install
bundle exec middleman server
```

You can now see the docs at http://localhost:4567. Whoa! That was fast!

You can also do it with with Vagrant, read more from [Slate docs](https://github.com/lord/slate)

If you are running on Ubuntu you might need to install Ruby and build tools before running `bundle install`:

    sudo apt-get install ruby-full build-essential liblzma-dev patch ruby-dev zlib1g-dev
    
