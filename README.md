<p align="center">
  <img src="https://luna1.co/984202.png" alt="Asana: API Documentation" width="264">
  <br>
  <br>
  <br>
  <a href="https://travis-ci.org/lord/slate"><img src="https://travis-ci.org/lord/slate.svg?branch=master" alt="Build Status"></a>
</p>

These docs are live at: https://developers.asana.com/

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
### How it works
The public OpenAPI spec is located at /public/public_asana_oas.json

To generate markdown from the spec, we use a forked [widdershins](https://github.com/rossgrambo/widdershins)

We assume these repos are siblings in your folder
- widdershins
- developer-docs

Open a shell within developer-docs and run (we use some relative path in this command):
```shell
node ../widdershins/widdershins.js --search true --language_tabs 'shell:Shell' --omitHeader true --includes markdown/* --summary defs/asana_oas.yaml --user_templates ./source/templates -o source/includes/api-reference/_index.html.md
```

Then to generate the html from the markdown, we use [slate](https://github.com/lord/slate)
```shell
# either run this to run locally
bundle install
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
