# Sportmaster Suite - Docker setup guide
## What is this?
This is a suite covering the three current sites in the sportmaster/rezet realm:

**sportmaster, rezet, sportmaster-service and sportmaster-hub**

A set of commands for development tasks are provided. The commands are taking care of building, seeting up dbs and handling docker related tasks.

Documentation of the various sites/components can be read at: [http://localhost:4567](http://localhost:4567)
## Requirements
docker and docker-compose must be install on your host machine.
## Get started
Clone repository without renaming it:
```
git clone git@github.com:adaptdk/sportmaster-suite-docker.git
```
All commands reside in the bin folder. In order to make them available in your path you can add following entry to you shells rc file. Eg. bashrc:
```
export PATH="[ABSOLUTE_PATH_TO]/sportmaster-suite-docker/bin:$PATH"
```
If you want to hi-jack drush to use sportmaster suite docker drush insert following entry:
```
alias drush="sm-drush"
```
Go into repository and fetch docker images:
```
cd sportmaster-suite-docker;
docker-compose pull
```
Now you are ready to get a site up and running.
## Build site
Build a site by running the command:
```
sm-build-[SITENAME] [BRANCH] ([DESCRIPTION])
```
Eg.:
```
sm-build-rezet RZSLA-257 last-pair-category
```
+ BRANCH: Name of branch you want to build. Will also be used as a suffix for the db name in the project.
+ DESCRIPTION (optional): A human readable string for reference. Make use of hyphens or underscore if you want to separate words.
## Download database
You can download a database by running the command:
```
sm-db-scp-[SITENAME]
```
Dump file will be downloaded to the db-dumps dir.
Eg.:
```
sm-db-scp-rezet
```
## Import database
You can create and import a database by running the command:
```
sm-db-import-[SITENAME] ([OPTIONS]) [DATABASE_DUMP_FILENAME]
```
The filename must be a dump downloaded to the db-dumps dir.
Options can be used. They are following:
```
-d VALUE    database name
              if not specified current database will be used

  -y          don't ask, just do it
```
Eg.:
```
sm-db-import-rezet mysql_backup_rezet_prod_20161115-042126.sql.bz2
```
## Devify the local site
Last step before happy development is to devify site in order to get the right settings and modules enabled. This is important to get a functional site locally!
Command:
```
sm-devify-[SITENAME]
```
Eg.:
```
sm-devify-rezet
```
## Change active site directory
A symlink is pointing at the active site for each project. That happens as a part of the build command. The active site directory can also be changed by:
```
sm-chdr-[SITENAME] [BRANCH]
```
Eg.:
```
sm-chdr-rezet RZSLA-182
```
## Other commands.
Start/stop docker setup (use --background in sm-docker-up if you couldn't be bother about the log output):
```
sm-docker-up
sm-docker-down
```
Tail drupal syslog:
```
sm-log-drupal
```
Run drush:
Three aliases can be used: @sm @rz and @ss
Eg. (if no alias has been made for drush. See **Get started** section):
```
sm-drush @sm cc all
```
With alias:
```
drush @sm cc all
```
## Links
These are different links to sites/services:
### Sportmaster
Site:
```
http://sportmaster.dev
```
Solr:
```
http://localhost:8985/solr
```
### Rezet
Site:
```
http://rezet.dev
```
Solr:
```
http://localhost:8986/solr
```

### Service layer
Site:
```
http://sportmaster_service.dev
```

### General links
+ [Elastic search](http://localhost:9200/_plugin/inquisitor/#/)
+ [Mail catcher](http://localhost:1080)
+ [phpMyAdmin](http://localhost:8081)
+ [Sportmaster docs](http://localhost:4567)

Enjoy.
