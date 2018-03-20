# Client API Documentation

The Client API documentation needs to be built from this repository, until the Kudos web app
is upgraded to Ruby 2.3.x (as required here). 

### Dependencies 

It is assumed you have this repository checked out adjacent to the Kudos web repo. So that `cd ../kudos` will
take you there.  If not, the synchronization step will need to be updated.

## Manual build steps

### Docker

Builds the Docker image from the `Dockerfile`, and then runs the middleman build to generate the files

```bash
docker build -t kudos-slate .
docker run --rm -v $PWD:/usr/src/app/source -w /usr/src/app/source kudos-slate bundle exec middleman build --clean
```

### Sync changes

Copies (syncs changes) the build files over to the appropriate public directory in the Kudos web app

```bash
rsync -av ./build/ ../kudos/public/api_docs/
mv ../kudos/public/api_docs/index.html ../kudos/app/views/api_docs/client_api/index.html
```

## Rake tasks

Alternatively, you can run `rake`, and it will run all those commands for you.
