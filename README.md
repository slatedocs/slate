<p align="center">
  <img src="https://raw.githubusercontent.com/lord/img/master/logo-slate.png" alt="Slate: API Documentation Generator" width="226">
  <br>
  <a href="https://travis-ci.org/lord/slate"><img src="https://travis-ci.org/lord/slate.svg?branch=master" alt="Build Status"></a>
</p>

<p align="center">Slate helps you create beautiful, intelligent, responsive API documentation.</p>

<p align="center"><img src="https://raw.githubusercontent.com/lord/img/master/screenshot-slate.png" width=700 alt="Screenshot of Example Documentation created with Slate"></p>

<p align="center"><em>The example above was created with Slate. Check it out at <a href="https://lord.github.io/slate">lord.github.io/slate</a>.</em></p>

Getting Started with Slate
------------------------------

### Prerequisites

You're going to need:

 - **Linux or macOS** — Windows may work, but is unsupported.
 - **Ruby, version 2.3.1 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Run the docs locally

This is a Forked repository from Slate's GitHub repo.
1. Clone *this repository* to your hard drive
2. `cd /path/to/rest-service-docs/`
3. Checkout the master branch (important!)
4. Initialize and start Slate. You can either do this locally, or with Vagrant:

```shell
# either run this to run locally
bundle install
bundle exec middleman server

# OR run this to run with vagrant
vagrant up
```

You can now see the docs at http://localhost:4567.

If you'd prefer to use Docker, instructions are available [in the wiki](https://github.com/lord/slate/wiki/Docker).

### Document the APIs

1. Make sure  you're running the docs locally (see previous section) and it is available at http://localhost:4567/ .
2. Make a GET request to `rest-service/api/docs`.
3. Edit /source/index.html.md with the output returned by that endpoint.
4. Commit the changes above.
5. Run 
```
cd /path/to/rest-service-docs/
bundle exec middleman build --clean
```

The command above generates the static docs in the `dist` folder, in case you want to manually upload it somewhere.

6. Run the script `deploy.sh` to build the static docs and push them to the `gh-pages` branch. That branch may be used to publish a Gihub Page with the docs. That branch may also be included as a submodule inside `rest-service`, in a subfolder named `docs` (for instance):
```
cd /path/to/rest-service
git submodule add -b gh-pages git@github.com:lumahealthhq/rest-service-docs.git
git push
```

The `dist` folder should not be committed to the repository.

Troubleshooting
--------------------

### `gem install` not responding

This may be because wget prioritizes ipv6, but repo requires IPv4.
Solution: edit /etc/gai.conf and add:
```
precedence 2a04:4e42::0/32 5
```

### Fix "can't find header files for ruby"

* Linux: sudo apt-get install ruby2.5-dev

### Fix "can't find gem bundler (>= 0.a)"

Open Gemfile.lock, check which version it was BUNDLED WITH (ex.: 1.15.4) and run:
* gem install bundler -v 1.15.4

