# Bulk Data

ControlShift's Bulk Data Webhooks make it easy to pull your data into external services. \

## Webhooks

We've included two special sorts of bulk data webhooks that are designed to help you keep an external reporting or analytics database server up to date with information from ControlShift's internal tables. The [data.full_table_exported](#data-full_table_exported) and [data.incremental_table_exported](#data-incremental_table_exported) webhooks can be consumed to keep an external database mirror containing ControlShift data up to date. This service was built in a database agnostic way, but it should be possible to build a ControlShift -> Amazon Redshift data pipeline using a technique.

## Redshift Pipeline Setup

Setting up an Amazon Redshit integration should take a little less than two hours. We'll use a custom [AWS Lamda](http://docs.aws.amazon.com/lambda/latest/dg/welcome.html) to receive data from ControlShift's webhook and Amazon's [Lamda Redshift Loader](https://github.com/awslabs/aws-lambda-redshift-loader) to load our data into Redshift. The general setup will look like this.

1. Receive a webrook to a custom .


The core steps to get this up and running are:

1. Setting up s3 buckets to retain file storage
2. Setting up your redshift database and preloading a schema.
3. Setting up your custom lambda webhook receiver
4. Setting up your aws-lambda-redshift-loader.
5. Configure your bulk data webhook in the Control Shift settings console.

**Note:** All resources should be set up in the same AWS region (ex: us-east-1) so they can access each other.

**Before starting:** You'll need git, npm, and access to a PostgreSQL connection tool(Redshift is based on PostgreSQL). These instructions use `psql` on the command line.

### Setting Up S3 Buckets

1. Login to you AWS console and create two s3 buckets for future use.
  1. controlshift-data - will hold received csv files
  2. controlshift-manifests = will hold resulting manifest files from your aws-lambda-redshift-loader
2. That's it. You're done here.



### Setting Up Custom Lambda Receiver

From the Lambda management console, you'll need to do the following.

#### Create the Lambda

1. Click to create a new Lambda function.
2. Skip the existing blueprints (button towards  the bottom of page)
3. Name your function something like "controlShiftReciever" and leave the runtime to node default.
4. Copy and paste the lambda function from this gist into the inline code editor.
5. Leave the handler as the default.
6. For role, select "s3 Execution role" under "create a new role". This will open a new window.
7. In this new window "IAM Management Console", you just need to name your role something relevant, like "controlShiftReceriver_s3." Then click "Allow" in the far bottom left corner.
8. Next is setting the memory size. You should be fine with 128MB, but you can always update the memory size later.
9. Set the Timeout a little higher - 60 seconds should be fine.
10. Use "No VPC".

#### Setup the API Endpoint

Now that we have our Lambda basically setup, we need to be able to POST to it from your Control Shift instance.

1. Click on the "API Endpoints" tab and click to add a new endpoint.
2. Select an API Gateway.
3. Set the Method to POST and Security to Open.
4. Click create. Done! (TODO: double check we don't need cors here. I cannot imagine how)

### Setting Up RedShift Database

Click on over to the Redshift service in the AWS console.

#### Launch Your Cluster

1. Click to create your cluster
2. Setup a dbnames name, username and password. Click next.
3. Use the defaults on the next screen, then the next screen.  Then Launch!
4. Once the launch process finishes, you'll be provided with an endpoint address. Save that address somewhere.  Example: `clustername.xXxXxX00Xx.us-east-1.redshift.amazonaws.com`

#### Prepare your Redshift Database

We need to prep our tables data schema to receive our ConrtolShift Data.  We'll use `psql` for this.

1. Install `psql` you don't have it already.
2. Download the current schema for our petitions table as petitions.sql.
3. Finally, you'll need to load that schema into your table with the following command.

```psql -h <endpoint> -U <database_user> -d <database_name> -p <cluster_port>
```

### Setting up aws-lambda-redshift-loader

Our team went through the documentation for the aws-lambda-redshift-loader, and the current instructions should be pretty good.  A few gotchas to watch out for:

* Click to create a new Lambda function.






