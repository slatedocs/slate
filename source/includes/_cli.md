# Command Line Tools

Netlify's command line tools let you deploy sites or configure continuous deployment straight from the command line.


## Installation

You'll need `npm`, the node package manager, to install the Netlify cli:


``` shell
npm install netlify-cli -g
```


## Manual Deploy

``` shell
netlify deploy
```

The `netlify deploy` command will deploy a site, whether it's a new site or an existing site.


The first time you deploy, a new site will be created and netlify will prompt for the path to deploy. Netlify stores the site id and the folder in a local `.netlify` file. After the first deploy you can simply run `netlify deploy` to deploy again


## Environments

You can specify an environment for any command with the -e flag. Each environment can have its own settings. This makes it very easy to setup different sites for staging and production.

``` shell
netlify deploy -e production
```


## Continuous Deployment

``` shell
netlify init
```

To configure continuous deployment for a front end project or a static site generator, use `netlify init` from the root of your project. Your project must be a github repository.

Netlify init will guide you through the process of configuring continuous deployment.


## Names, Domains and Passwords

``` shell
netlify update
```

You can update attributes on your site through the cli. Currently the name of the site (<name>.netlify.com), the custom domain and the password of the site can be controlled in this way:

``` shell
netlify update -n my-test-site -d www.example.com -p my-password
```

You'll need to configure the DNS settings for your [custom domain]#custom_domains) separately from assigning the domain to your site.



## Authentication

The first time you use the cli tool, you'll be asked to authenticate through the browser. After you authenticate we'll store an access token in a global `~/.netlify/config`.

You can specify a different access token for use with any command with the `-t` flag.
