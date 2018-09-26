# Graasp Developers

[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg)](https://conventionalcommits.org)
[![Codeship](https://app.codeship.com/projects/79b5f0e0-a311-0136-90c3-428c20f0c044/status?branch=master)](https://app.codeship.com/projects/307247)

# Development #

## Environment ##

To setup your development environment you will need [`yarn`](https://yarnpkg.com). Once you have `yarn`, run `yarn install`.

## Docker ##

The easiest way to view the application is using [Docker](https://www.docker.com/).

1. Run `docker-compose up`
2. Visit `localhost:4567`
3. Make your changes.
4. Refresh the page and the changes should be visible.
5. If you make any structural changes you might have to rebuild. Stop the process with `Ctrl-C` and
run `docker-compose up --build`. 

# Contributing #

We welcome contributions!

## Committing ##

We follow the standards put forth by [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0-beta.2/).

```
<type>[optional scope]: <description>

[optional body]

[optional footer]
```

Example:

```
fix: minor typos in code

see the issue for details on the typos fixed

fixes #12
```

## Internal Contributors ##

1. Clone this repository.
2. Open an issue explaining what you want to contribute.
3. Create a branch off `master` with format `<issue number>/<small-description>` e.g. `1/change-logo`.
4. Make your changes.
5. Commit following the standards put forth by [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0-beta.2/).
6. Send a pull request to `master`.

## External Contributors ##

1. Fork this repository.
2. Open an issue in our repository explaining what you want to contribute.
3. Make your changes on your fork.
4. Commit following the standards put forth by [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0-beta.2/).
5. Send a pull request to our `master` branch.

# Publishing #

Once merged to `master` we can publish a new release by running `release`. Releases can only be approved by repository owners.
