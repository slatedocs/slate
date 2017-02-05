# Sportmaster Suite - Docker setup guide

## Getting ready
Optionally you can make an alias for drush so its getting executed in the php container.

Also you need to pull the docker images defined in docker-compose.yml.

> If you want to hi-jack drush to use sportmaster suite docker drush insert following entry in bashrc or similar:

```shell
alias drush="sm-drush"
```

> Fetch docker images. Go into repository checkout and pull docker images:

```shell
cd sportmaster-suite-docker;
docker-compose pull
```

## Build site
Now you are ready to get a site up and running. There is a separate build command for every site.

Build a site by running the command:
`sm-build-[SITENAME] [BRANCH] ([DESCRIPTION])`

> Example. Building rezet:

```shell
sm-build-rezet RZSLA-257 last-pair-category
```

+ BRANCH: Name of branch you want to build. Will also be used as a suffix for the db name in the project.
+ DESCRIPTION (optional): A human readable string for reference. Make use of hyphens or underscore if you want to separate words.

## Download database
You can download a database by running the command:

`sm-db-scp-[SITENAME]`

Dump file will be downloaded to the db-dumps dir.

> Example. Download rezet database:

```shell
sm-db-scp-rezet
```

## Import database
You can create and import a database by running the command:
```
sm-db-import-[SITENAME] ([OPTIONS]) [DATABASE_DUMP_FILENAME]
```

The filename must be a dump downloaded to the db-dumps dir.

```
# Options can be used. They are following:
-d VALUE    database name
              if not specified current database will be used

  -y          don't ask, just do it
```

> Example. Import rezet database:

```shell
sm-db-import-rezet mysql_backup_rezet_prod_20161115-042126.sql.bz2
```
## Devify the local site
Last step before happy development is to devify site in order to get the right settings and modules enabled. This is important to get a functional site locally!

Command:
`sm-devify-[SITENAME]`

> Example. Devifying rezet site:

```shell
sm-devify-rezet
```

## Change active site directory
A symlink is pointing at the active site for each project. That happens as a part of the build command.

The active site directory can also be changed by:
`sm-chdr-[SITENAME] [BRANCH]`


> Example. Changing active rezet site:

```shell
sm-chdr-rezet RZSLA-182
```

## Other commands.
Other commands available in the docker suite is listed here.

> Start/stop docker setup (use --background in sm-docker-up if you couldn't be bother about the log output):

```shell
sm-docker-up
sm-docker-down
```

> Tail drupal syslog:

```shell
sm-log-drupal
```

### Run drush

Drush aliases that can be used are: @sm @rz @ss @sh

if no alias has been made for drush. See the <a href="/#getting-ready">Getting ready</a> section.

> Example. Clearing cache at the sportmaster 1.0 site:

```shell
sm-drush @sm cc all
```

> With drush command alias:

```shell
drush @sm cc all
```

## Links
These are different links to sites/services:

Site | Drush alias | Vhost | Solr
---------- | ------- | ------- | -------
Sportmaster 1.0 | @sm | [http://sportmaster.dev](http://sportmaster.dev) | [http://localhost:8985/solr](http://localhost:8985/solr)
Rezet Store | @rz | [http://rezet.dev](http://rezet.dev) | [http://localhost:8986/solr](http://localhost:8986/solr)
Service layer | @ss | [http://sportmaster_service.dev](http://sportmaster_service.dev)
Sportmaster Hub | @sh | [http://sportmaster_hub.dev](http://sportmaster_hub.dev)

### General links
+ [Elastic search](http://localhost:9200/_plugin/inquisitor/#/)
+ [Mail catcher](http://localhost:1080)
+ [phpMyAdmin](http://localhost:8081)
