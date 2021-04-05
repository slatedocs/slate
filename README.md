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

References:
- https://hub.docker.com/r/slatedocs/slate
- https://github.com/slatedocs/slate/wiki/Deploying-Slate
