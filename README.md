# Deployment Process

First, run this command to build the docs:

```
docker run --rm --name slate -v $(pwd)/build:/srv/slate/build -v $(pwd)/source:/srv/slate/source slatedocs/slate
```

Then, run the `deploy.sh` script to deploy them.

References:
- https://hub.docker.com/r/slatedocs/slate
- https://github.com/slatedocs/slate/wiki/Deploying-Slate
