# DirtyLemon API documentation

This is the documentation for DirtyLemon's API.

## Getting started

Clone this repository, then:

```shell
bundle install
bundle exec middleman server
```

Check out http://localhost:4567


## Publish

This will compile and push the website to `gh_pages`

```shell
./deploy.sh
```

[Details](https://github.com/lord/slate/wiki/Deploying-Slate)


## Update

```shell
git remote add upstream git@github.com:tripit/slate.git
git fetch upstream
git checkout master
git merge upstream/master
```

[Details](https://github.com/lord/slate/wiki/Updating-Slate)
