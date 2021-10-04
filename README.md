# CloudMC API documentation

This repository contains the CloudMC API documentation

## Writing new documentation

### Prerequisites

You're going to need one of the following:

- Local install
  - **Ruby, version 2.2.5 or newer**
  - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.
- Docker (preferred)
- Vagrant

### Getting Set Up

Clone this repository

Option 1: use docker

```shell
cd /path/to/repo/cloudmc-api-docs/
docker compose up -d
```

Option 2: local or vagrant

```shell
cd /path/to/repo/cloudmc-api-docs/slate

# either run locally
bundle install
bundle exec middleman server

# OR use vagrant
vagrant up
```

You can now see the docs at [http://localhost:4567](http://localhost:4567). Whoa! That was fast!

Now that Slate is all set up on your machine, you'll probably want to learn more about [editing Slate markdown](https://github.com/lord/slate/wiki/Markdown-Syntax)

If you'd prefer to use Docker, instructions are available [in the wiki](https://github.com/lord/slate/wiki/Docker).

### Deploying

TODO: update with instructions on deploying the docs with jenkins

1. Make sure your changes have been merged into `cmc-dev`
2. `git checkout cmc-dev`
3. `./deploy.sh`

The docs should go live once GitHub processes the new `gh-pages` branch contents.
