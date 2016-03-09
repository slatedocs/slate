# GitHub Permissions

Netlify never stores GitHub Access Tokens.

Once you authorize netlify, we fetch an Access Token from GitHub. But we **never store this token**. Netlify simply passes the token to our Javascript Single Page App, and from then on all communication with the GitHub API happens straight from the browser. After configuring continuous deployment, the token is **permanently discarded**.

The only access netlify will have is through a deploy key installed in a specific repository.

We would love to ask for fewer permissions than we do when starting a new project. However [GitHub only provides very coarse-grained permissions](http://developer.github.com/v3/oauth/#scopes) for their API.

When you start a new project with continuous deployment, we need to be able to browse your GitHub repositories, add a deploy key to the repository you pick and install a webhook to the repo.

## Restrict Access for Organizations

If you're still worried about granting access to sensitive repositories, GitHub lets you restrict application access for organizations.

[![settings-third-party-restrict-confirm.png](/img/docs/settings-third-party-restrict-confirm.png)
](https://help.github.com/articles/about-third-party-application-restrictions/)

Once these restrictions are in place, netlify will no longer have any kind of access to the repositories from this organization unless you explicitly whitelist our API application.

We recommend keeping all your most sensitive projects in an organization and enabling third party restrictions. This will make taking advantage of any of the countless applications that can enhance your GitHub experience easier and more secure.

Read more about restricting third party access in [GitHub's documentation](https://help.github.com/articles/about-third-party-application-restrictions/)
