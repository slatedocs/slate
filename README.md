<p align="center">
  <img src="https://assets.asana.biz/m/33a0924d61aabd7b/original/Asana-developers-lockup-horizontal.svg" alt="Asana: API Documentation" width="264">
  <br>
  <br>
  <br>
  <a href="https://github.com/slatedocs/slate/actions?query=workflow%3ABuild+branch%3Amain"><img src="https://github.com/slatedocs/slate/workflows/Build/badge.svg?branch=main" alt="Build Status"></a>
  <a href="https://hub.docker.com/r/slatedocs/slate"><img src="https://img.shields.io/docker/v/slatedocs/slate?sort=semver" alt="Docker Version" /></a>
</p>

This documentation is live at: https://developers.asana.com/docs

# OpenAPI Spec

## What is it?
The Asana OpenAPI spec is currently used to generate our documentation. You can also use it to generate mock servers, client code, and many other things. You can read more about OpenAPI specs [here](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md).

## Where is it?
The up-to-date Asana OpenAPI spec is in this repository. Here's a [link](https://github.com/Asana/developer-docs/blob/master/defs/asana_oas.yaml).

## Contribute/Raise issues
If you find any issues or have any suggestions for our OpenAPI spec. Please create an issue in this repo or create a PR with the changes!

# Getting Started with Asana Docs

## Prerequisites

Swagger is used to implement our OpenAPI specification and requires `mvn`, so be sure to first install Maven (`brew install maven`). 

Beyond that, Node and Ruby are required to get started with documentation. The easiest way to work with the tooling is to install some version managers for some languages used in our toolchain.

For this guide, we'll assume you're using `zsh`, if not you can replace the `~/.zshrc` with `~/.bash_profile`.

For Node, we'll use [nvm](https://github.com/nvm-sh/nvm):

```shell
brew install nvm
# Brew doesn't set this up anymore, so we need to do this manually. See https://formulae.brew.sh/formula/nvm for up to date instructions if these fail
mkdir -p ~/.nvm # You should create NVM's working directory if it doesn't exist:
# Add the following to /Users/runner/.bash_profile or your desired shell configuration file:
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"; >> ~/.zshrc # This loads nvm
echo '[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"' >> ~/.zshrc # This loads nvm bash_completion
```

For Ruby, we'll use [rbenv](https://github.com/rbenv/rbenv):

```shell
brew install rbenv # This is a ruby version manager, which could prove useful in the future. For now we use system.
echo 'eval "$(rbenv init -)"' >> ~/.zshrc # Init rbenv on every shell.
echo 'export GEM_HOME=$HOME/.gem' >> ~/.zshrc # Set the Ruby gem install to a non-system directory so we don't need sudo.
echo 'export PATH="$GEM_HOME/bin:$PATH"' >> ~/.zshrc # Needed if any gems have executables associated.
source ~/.zshrc # Let's pick up those changes.
gem install bundler # Bundler is the standard for dependency management. Install it system-wide.
```

Afterwards, clone this repository and install dependencies:

```shell
nvm use system # If it ain't broke - we might pin this in the future.
npm install

rbenv shell system # We'll use system Ruby as well, but just like Node, we might pin it in the future.
bundle install
```

You also might need some python dependencies:
```shell
pip install ruamel.yaml
```

For the rest of this README, assume any commands that we list will be run from the root of this repository.

## How to build and run documentation locally

To generate and view documentation on your local machine, follow the steps below:

1. Navigate to the root directory of this project. Then, run the "first time setup" command (see other commands in the [Makefile](https://github.com/Asana/developer-docs/blob/master/Makefile)):

```
make first_time_setup
```

2. Update build tools and client libraries:

```
make update
```

3. Generate documentation (internal Asanas: see [this task](https://app.asana.com/0/0/1200652548580470/f) before running):

```
make docs_gen
```

4. Serve documentation locally:

```
make serve
```

5. View documentation in your browser by visiting **http://localhost:4567/docs** (or **http://127.0.0.1:4567/docs**).

## Reference (how it works)
The public OpenAPI spec is located at **/defs/asana_oas.yaml**

To generate markdown from the spec, we use a forked [widdershins](https://github.com/rossgrambo/widdershins).

We assume these repos are siblings in your folder
- widdershins
- developer-docs

Open a shell within developer-docs and run:
```shell
make
```

To see what this command does, read the Makefile in this repo.

Then to generate the html from the markdown, we use [slate](https://github.com/lord/slate). This happens automatically when the middleman starts the server.
```shell
# either run this to run locally
bundle exec middleman server

# OR run this to run with vagrant
vagrant up
```

*Why did we fork widdershins?* For our use case, we needed things like denormalizing and dereferencing. We tried doing this to the spec & using an unforked widdershins, but as we progressed with client library generation, it made more sense to keep a clean spec and do this doc-specific editing in the tooling. A potential future is pulling out this logic to a "openapi spec transformer" to prep the spec for widdershins, but there will be a trade-offs to consider.

## Making content changes
_Internal Asanas: See https://app.asana.com/0/77076599077/1122503737028047/f and https://app.asana.com/0/0/1200652548580470/f before making any updates._

If the content you're changing is static (not generated from the OpenAPI spec), you'll edit the `.md` files in source/includes/markdown.

If the content you're changing is in the OpenAPI spec, you should make the changes within codez. However, if you want to quickly test something, you can make the changes in def/asana_oas.yaml. Just remember to put the changes in codez if you want them to not be overridden.
Then, you should run the `make` command above.
I prefer to run `git diff` after doing so to see the generated changes.
Run `bundle exec middleman server` if it's not already running, and go to the url it provides to check out the changes you made.

Merging these changes into master causes them to be deployed.

## Editing styles
Make changes in source/stylesheets/**\_variables.scss** because the changes here will be valid with future versions of Slate.

If you need to make more complex css changes, edit **screen.css.scss** or **print.css.scss** but keep in mind that these will need to be merged for new versions of Slate.

## Deploying to GitHub Pages
This should happen automatically when changes are merged into this repo.

If you need to do this manually, then run the `deploy.sh` script. This will use your local git credentials and local /build folder to push a build to a branch named gh-pages (Where the docs are hosted).
