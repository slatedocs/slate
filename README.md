# Files

The actual documentation files live in the `/source/includes` directory.

# Deployment Process

First, run this command to build the docs:

```
docker run --rm --name slate -v $(pwd)/build:/srv/slate/build -v $(pwd)/source:/srv/slate/source slatedocs/slate
```

Then, run this command to deploy them:

```
./deploy.sh --push-only
```

Without the `--push-only` option the deploy script tries to build the site first, which would require you to install a number of dependencies, which the docker command above made unnecessary.

References:
- https://hub.docker.com/r/slatedocs/slate
- https://github.com/slatedocs/slate/wiki/Deploying-Slate
