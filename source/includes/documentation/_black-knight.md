## Deploying with Black Knight

The Black Knight application is a tool to deploy your front end code across the Quintype Client Cloud

### Overall Workflow

The deployment process has three steps

### Compilation Steps

* Changes to the app are made locally, and pushed up to [GitHub](https://github.com).
* [Docker Hub](https://hub.docker.com) picks up the changes from GitHub, and builds a docker tag.

### Deployment Steps

* Enter the docker tag that is to be deployed. And click deploy.
* Black Knight will automatically [copy in config files](#setting-up-configuration), and create an 'immutable tag'
* Black Knight will then deploy this 'immutable tag' across the Quintype network.

### Setting Up Configuration

Black Knight can be configure to copy in configuration files. These configuration files are per environment, and allow you to have different behavior across environments, and can be used for many use cases, such as

* Changing the API host on staging
* Config to disable SEO on beta / staging
* Changing secret keys
