# Continuous Deployment

Continuous deployment works by connecting a Github repository to a Netlify site and keeping the two in sync.

It works for plain static sites, but it's even more powerful when you're using a [static site generator](https://www.staticgen.com) or a front end build tool like [Grunt](http://gruntjs.com/), [Gulp](http://gulpjs.com/) or [Broccoli](https://github.com/broccolijs/broccoli).

Netlify will run your build command and deploy the result whenever you push to Github.

* No deploying without committing and pushing first
* Easy collaboration through pull requests
* Fix a typo through Github's web UI from your mobile
* Let non-technical users contribute by using [prose.io](http://prose.io/)

## Dependencies

Netlify will install any dependencies from any Gemfile, package.json, bower.json or requirements.txt in the root of your repository, before running your build. Any executables from these dependencies will be made available from the PATH.

Make sure to include your build tool in these dependencies:

* If you're using Jekyll, make sure to add a Gemfile that requires the jekyll gem
* If you're using Grunt, make sure to add a package.json with grunt-cli as a dependency
* If you're using Roots, make sure to install roots in your local package.json and not just globally
* If you're using mkdocs, make sure to add a requirements.txt with mkdocs>=0.9.0

## Dependency Cache

The first build you do can take some time while we install all of your dependencies. After the initial build, we'll cache the dependencies so we don't have to start from scratch each time you push an update. This means subsequent builds will be really fast.

## Examples

Here are some examples of configuring your site for common build tools:

Build Tool | Directory | Command
-----------|-----------|--------------
Jekyll     | _site     | jekyll build
Grunt      | dist      | grunt build
Middleman  | build     | middleman build
Roots      | public    | roots compile
Hugo       | public    | hugo

For **Jekyll hosting**, make sure you have a Gemfile and a Gemfile.lock checked into your repository, specifying the Jekyll version you want to use.

For **Roots hosting**, make sure you add `roots` to your package.json.

For **Hugo hosting**, `hugo` will build and deploy with the latest version of `hugo`. You can specify a specific `hugo` release like this: `hugo_0.15`. Currently `0.13`, `0.14` and `0.15` are supported.
