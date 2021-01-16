### Mautic Developer Documentation ###

Developer documentation for Mautic.

The content is published at http://developer.mautic.org.

It is generated using [Slate](https://github.com/tripit/slate), a great API documentation generator. The content of Mautic's documentation is located in the source/includes folder.

### Updating the live documentation

In order to update the live documentation, you need to do the following:

1. SSH into the VM that hosts the developer documentation (the infrastructure team can provide you access)
2. Run `cd /var/www/developer`
3. Run `git pull` to get the latest changes from this repo
4. Run `bundle install` so that the dependencies are up-to-date
5. Run `bundle exec middleman build` to build fresh HTML files which include the latest changes
