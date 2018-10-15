# Transferwise API documentation

Live version of the docs is [here](https://api-docs.transferwise.com).

All contributions are welcome and encouraged!

This project is forked from [Slate](https://github.com/lord/slate).

## How to edit the docs?

1. [Run the project locally](#run-the-project-locally)
2. Do your changes (most of the text is in `/source/includes` folder). Learn more about [editing Slate markdown](https://github.com/lord/slate/wiki/Markdown-Syntax)
3. Create pull request. Merge. Go to `master` branch and pull. **Deploy** (just run `./deploy.sh`)

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