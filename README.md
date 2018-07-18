Built using slate ([github link](https://github.com/lord/slate)).

## Development

Initialize and start Slate. You can either do this locally, or with Vagrant:

```shell
# either run this to run locally
bundle install
bundle exec middleman server

# OR run this to run with vagrant
vagrant up
```

You can now see the docs at http://localhost:4567. Whoa! That was fast!

Now that Slate is all set up on your machine, you'll probably want to learn more about [editing Slate markdown](https://github.com/lord/slate/wiki/Markdown-Syntax), or [how to publish your docs](https://github.com/lord/slate/wiki/Deploying-Slate).

If you'd prefer to use Docker, instructions are available [in the wiki](https://github.com/lord/slate/wiki/Docker).

To deploy
--------------------
1. Make sure to fetch the AWS credentials using MFA and copy them to `~/.aws/credentials` as described in the last bullet point of this section: https://github.com/affinity-team/infrastructure-secrets#accessing-aws-from-the-command-line.

1. To build: `bundle exec middleman build --clean`

1. To upload to aws: `aws s3 sync build s3://api-docs.affinity.co --delete --acl public-read --profile mfa`

1. Invalidate cache on cloudfront by following the instructions at this URL: https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html#Invalidation_Requests. Type `/*` to invalidate all paths.

