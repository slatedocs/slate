<p align="center">
  <img src="https://raw.githubusercontent.com/lord/img/master/logo-slate.png" alt="Slate: API Documentation Generator" width="226">
  <br>
  <a href="https://travis-ci.org/lord/slate"><img src="https://travis-ci.org/lord/slate.svg?branch=master" alt="Build Status"></a>
</p>

<p align="center">Slate helps you create beautiful, intelligent, responsive API documentation.</p>

<p align="center"><img src="https://dl.dropboxusercontent.com/u/95847291/github%20images/slate/slate_screenshot_new.png" width=700 alt="Screenshot of Example Documentation created with Slate"></p>

<p align="center"><em>The example above was created with Slate. Check it out at <a href="https://lord.github.io/slate">lord.github.io/slate</a>.</em></p>


### Geezeo documentation using Slate


Getting Started with Slate - Geezeo-style
-----------------------------------------

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 2.0 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

1. Clone this repo: https://github.com/Geezeo/developers.geezeo.com.git
2. `cd .developers.geezeo.com`
3. run "bundle install".
4. in your environment variables, set: 
```shell
AWS_DEFAULT_REGION=us-east-1
AWS_SECRET_ACCESS_KEY=YOUR_SECRET_KEY
AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY
```

Running
-------

```shell
# either run this to run locally
bundle install
bundle exec middleman server

# OR run this to run with vagrant
vagrant up
```

Deploying your changes
----------------------
To post any of your changes to Geezeo's documentation (after you've written and verified it locally, of course) - Ensure your AWS Credentials were set (Setup step 4) and simply run 
```shell
./deploy.sh

Updating this forked copy of Slate if we ever want to update it:
----------------------------------------------------------------
Git requires that we have to set our remote repo to the original Slate one so that we can merge their changes into our branch. This is not so bad if you have the GUI Github client installed- you will be able to run "git mergetool" on the rebase so you can quickly merge the core Slate updates without going insane.
In a shell:
```shell
$ git checkout -b (BRANCHNAME)
$ git remote add forkedfrom https://github.com/lord/slate.git

---
If you git remote -v it should look like this:
```shell 
forkedfrom	https://github.com/lord/slate.git (fetch)
forkedfrom	https://github.com/lord/slate.git (push)
origin	https://github.com/Geezeo/developers.geezeo.com.git (fetch)
origin	https://github.com/Geezeo/developers.geezeo.com.git (push)

---

From here, you can run: 
```shell
git fetch forkedfrom/master
git rebase 
---
Either rebase manually, or use "git mergetool" after you receive a conflict error. These errors are about our local changes vs. any updates we missed from Slate core. "git mergetool" will bring up a visual diff of the changes for rebasing the update, so you can quickly preserve our documentation while updating the underpinnings. Save, quit it, and then run:
```shell 
git rebase --continue
---
After running through the changes, you should eventually finish the rebase, and be left with an updated Slate-core that runs with (hopefully) the same launch synopsis.

