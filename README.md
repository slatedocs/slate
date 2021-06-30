<p align="center">
  <img src="https://assets.asana.biz/m/33a0924d61aabd7b/original/Asana-developers-lockup-horizontal.svg" alt="Asana: API Documentation" width="264">
  <br>
  <br>
  <br>
  <a href="https://github.com/slatedocs/slate/actions?query=workflow%3ABuild+branch%3Amain"><img src="https://github.com/slatedocs/slate/workflows/Build/badge.svg?branch=main" alt="Build Status"></a>
  <a href="https://hub.docker.com/r/slatedocs/slate"><img src="https://img.shields.io/docker/v/slatedocs/slate?sort=semver" alt="Docker Version" /></a>
</p>

These docs are live at: https://developers.asana.com/docs

Middleman requires ruby
Swagger requires mvn (brew install maven)

OpenAPI Spec
------------
### What is it
The Asana OpenAPI spec is currently used to generate our documentation. You can also use it to generate mock servers, client code, and many other things. You can read more about OpenAPI specs [here](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md).

### Where is it
The up-to-date Asana OpenAPI spec is in this repo. Here's a [link](https://github.com/Asana/developer-docs/blob/master/defs/asana_oas.yaml).

### Contribute/Raise issues
If you find any issues or have any suggestions for our OpenAPI spec. Please create an issue in this repo or create a PR with the changes!

Getting Started with Asana Docs
------------------------------
### Prerequisites
The easiest way to work with the tooling is to install some version managers for some languages used in our toolchain.

For node, we'll use nvm...

```shell
brew install nvm
```

... and for Ruby we'll use rbenv

```shell
brew install rbenv # This is a ruby version manager, which could prove useful in the future. For now we use system.
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile # Init rbenv on every shell
echo 'export GEM_HOME=$HOME/.gem' >> ~/.bash_profile # Set the ruby gem install to a non-system directory so we don't need sudo
echo 'export PATH="$GEM_HOME/bin:$PATH"' >> ~/.bash_profile # Needed if any gems have executables associated
source ~/.bash_profile # Let's pick up those changes.
gem install bundler # If we don't have bundler, it's basically the de facto standard for dependency management. Install it system-wide
```

In addition to this repository we're going to clone a sibling repository for a tool called Widdershins that manages the first half of our toolchain. We'll assume it and this repository live in the same directory. We'll clone it and install its prerequisites:

```shell
pushd .. # To get to parent dir
git clone git@github.com:rossgrambo/widdershins.git # Clone the repo
cd widdershins # To get to where the node requirements are
nvm use system # If it ain't broke - we might pin this in the future
npm install # Install requirements
popd # Done with installation
```

And then lets get our local version of Ruby up to snuff:

```shell
rbenv shell system # We'll use system ruby as well, but just like node we might pin it in the future
bundle install # Install requirements
```

For the rest of this README assume any commands that we list will be run from the root of this repository.

### How it works
The public OpenAPI spec is located at /public/public_asana_oas.json

To generate markdown from the spec, we use a forked [widdershins](https://github.com/rossgrambo/widdershins)

We assume these repos are siblings in your folder
- widdershins
- developer-docs

Open a shell within developer-docs and run (we use some relative path in this command):
```shell
node ../widdershins/widdershins.js --search true --language_tabs 'shell: curl' --omitHeader true --includes markdown/* --summary defs/asana_oas.yaml --user_templates ./source/templates -o source/includes/api-reference/_index.html.md
```

Then to generate the html from the markdown, we use [slate](https://github.com/lord/slate)
```shell
# either run this to run locally
bundle exec middleman server

# OR run this to run with vagrant
vagrant up
```

*Why did we fork widdershins?* For our use case, we needed things like denormalizing and dereferencing. We tried doing this to the spec & using an unforked widdershins, but as we progressed with client library generation, it made more sense to keep a clean spec and do this doc-specific editing in the tooling. A potential future is pulling out this logic to a "openapi spec transformer" to prep the spec for widdershins, but there will be a trade-offs to consider.

### Making content changes
If the content you're changing is static (not generated from the OpenAPI spec), you'll edit the md in source/includes/markdown.

If the content you're changing is in the OpenAPI spec, you should make the changes within codez. However, if you want to quickly test something, you can make the changes in def/asana_oas.yaml. Just remember to put the changes in codez if you want them to not be overridden.
Then, you should run the `widdershins` command above.
I prefer to run `git diff` after doing so to see the generated changes.
Run `bundle exec middleman server` if it's not already running, and go to the url it provides to check out the changes you made.

Merging these changes into master causes them to be deployed.

### Editing styles
Make changes in source/stylesheets/**\_variables.scss** because the changes here will be valid with future versions of Slate.

If you need to make more complex css changes, edit **screen.css.scss** or **print.css.scss** but keep in mind that these will need to be merged for new versions of Slate.

### Deploying to github pages
This should happen automatically when changes are merged into this repo.

If you need to do this manually, then run the `deploy.sh` script. This will use your local git credentials and local /build folder to push a build to a branch named gh-pages (Where the docs are hosted).
