<p align="center">
  <img src="https://raw.githubusercontent.com/lord/img/master/logo-slate.png" alt="Slate: API Documentation Generator" width="226">
  <br>
  <a href="https://travis-ci.org/tripit/slate"><img src="https://travis-ci.org/tripit/slate.svg?branch=master" alt="Build Status"></a>
</p>

<p align="center">Slate helps you create beautiful, intelligent, responsive API documentation.</p>

BBOXX SLATE INSTRUCTIONS
------------------------
**Install Instructions**
 ```
 sudo apt-add-repository ppa:brightbox/ruby-ng
 sudo apt-get update
 sudo apt-get install ruby2.5 ruby2.5-dev
 sudo apt-get install ruby-bundler
```

**Autogenerate docs**
 - clone the slate repository
 - run the SMART Solar Backend locally
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
 - Now that Slate is all set up your machine, you'll probably want to learn more about SlateMarkDown (https://github.com/tripit/slate/wiki/Markdown-Syntax)

 **Publish Docs**
 - push changes to slate MASTER branch
 - they will build automatically on the old CI machine - https://ci.bboxx.co.uk/job/SMART-Solar-Documentation/
 - they will fail to be published on docs.smart.bboxx.co.uk as the CI machine no longer has access to it. DevOps need to fix this
 - when publication has been fixed, view newly published docs at http://docs.smart.bboxx.co.uk
