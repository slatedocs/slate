<p align="center">
  <img src="https://luna1.co/984202.png" alt="Asana: API Documentation" width="264">
  <br>
  <br>
  <br>
  <a href="https://travis-ci.org/lord/slate"><img src="https://travis-ci.org/lord/slate.svg?branch=master" alt="Build Status"></a>
</p>

Getting Started with Asana Docs
------------------------------

### Getting Set Up
The OpenAPI spec is located at /defs/asana_oas.json

To generate the markdown from the spec use [widdershins](https://github.com/mermade/widdershins)
```shell
widdershins --search true --language_tabs 'shell: curl' 'javascript--nodejs:Node.JS' 'php:PHP' 'python:Python' 'java: Java' 'ruby:Ruby' 'csharp:C#' --omitHeader true --includes markdown/* --summary defs/asana_oas.json -o source/includes/api-reference/_index.html.md
```

Then to generate the html from the markdown, use [slate](https://github.com/lord/slate)
```shell
# either run this to run locally
bundle install
bundle exec middleman server

# OR run this to run with vagrant
vagrant up
```

### Editing styles
Make changes in source/stylesheets/**\_variables.scss** because the changes here will be valid with future versions of Slate.

If you need to make more complex css changes, edit **screen.css.scss** or **print.css.scss** but keep in mind that these will need to be merged for new versions of Slate.

### Deploying to github pages
Run the deploy.sh script. This will use your local git credentials and local /build folder to push a build to a branch named gh-pages (Where the docs are hosted)

Planning to move this to an automated system when things are pushed to master.
