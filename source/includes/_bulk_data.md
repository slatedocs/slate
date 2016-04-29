# Bulk Data

ControlShift's Bulk Data Webhooks make it easy to pull your data into external services.

## Webhooks

We provides two special bulk data webhooks to help you keep an external reporting or analytics database server up to date with information from ControlShift's internal tables. The [data.full_table_exported](#data-full_table_exported) and [data.incremental_table_exported](#data-incremental_table_exported) webhooks can be consumed to keep an external database mirror containing ControlShift data up to date. This service was built in a database agnostic way, but it should be possible to build a ControlShift -> Amazon Redshift data pipeline using the [ControlShift to Redshift Pipeline](#controlshift-to-redshift-pipeline) technique outlines below.

<aside class="notice">
Bulk data webhooks are not automatically included when adding a new webhook endpoint. Please contact support to add these to your webhook feed. For testing, you can manually trigger these wehbooks by visiting <code>https://&lt;your controlshift instance&gt;/orgs/export</code> and clicking on "New Full Tables Data Export."
</aside>

## Bulk Data Data Schemas

The bulk data webhooks include exports of the following tables.  You can use the links to download CSV headers or a psql schema for each table.

* `attendees` - [csv headers](attendees_headers.csv)/[sql_schema](attendees_schema.sql)
* `comments` - [csv headers](comments_headers.csv)/[sql_schema](comments_schema.sql)
* `local_chapter_members` - [csv headers](local_chapter_members_headers.csv)/[sql_schema](local_chapter_members_schema.sql)
* `locations` - [csv headers](locations_headers.csv)/[sql_schema](locations_schema.sql)
* `petitions` - [csv headers](petitions_headers.csv)/[sql_schema](petitions_schema.sql)
* `unsubscribes` - [csv headers](unsubscribes_headers.csv)/[sql_schema](unsubscribes_schema.sql)
* `blast_emails` - [csv headers](blast_emails_headers.csv)/[sql_schema](blast_emails_schema.sql)
* `events` - [csv headers](events_headers.csv)/[sql_schema](events_schema.sql)
* `local_chapters` - [csv headers](local_chapters_headers.csv)/[sql_schema](local_chapters_schema.sql)
* `members` - [csv headers](members_headers.csv)/[sql_schema](members_schema.sql)
* `signatures` - [csv headers](signatures_headers.csv)/[sql_schema](signatures_schema.sql)
* `users` - [csv headers](users_headers.csv)/[sql_schema](users_schema.sql)

Additional files:

* combined schema - [CS_combined_schema.sql](/data/combined_schema.sql)
* zip of all schema files [CS_data_assets.zip](/data/CS_data_assets.zip)


## ControlShift to Redshift Pipeline

Setting up an Amazon Redshift integration should take one to two hours. We'll use a custom [AWS Lamda](http://docs.aws.amazon.com/lambda/latest/dg/welcome.html) to receive data from ControlShift's webhook and Amazon's [Lamda Redshift Loader](https://github.com/awslabs/aws-lambda-redshift-loader) to load our data into Redshift. For this example, we'll focus on the daily full_table dump, and truncating the previous days data for petitions only. You could also add a second pipeline to add incremental data if you need more frequent updates.

As of this writing, aws-lambda-redshift-loader v2.4.0 only supports a single configuration per Lambda.  This means you'll have a setup a separate Lambda for every table you want to capture. If you want to capture both nightly and incremental dumps, you'll also need to set up one nightly lambda and one incremental lambda per table you want to capture. It can be a little tedious, but remember, the first one is the hardest!

### Example Flow

Pending...


### Redshift Pipeline Setup

The core steps to get this up and running are:

1. Setting up S3 buckets to retain file storage
2. Setting up your Redshift database cluster and preloading a schema.
3. Setting up your custom lambda webhook receiver
4. Setting up your aws-lambda-redshift-loader.
5. Configure your bulk data webhook in the Control Shift settings console.

**Note:** All resources should be set up in the same AWS region (ex: us-east-1) so they can access each other. "US Standard" and "us-east-1" are the same thing.

**Before starting:** You'll need git, npm, and access to a PostgreSQL connection tool (Redshift is based on PostgreSQL). These instructions use `psql` on the command line.

These instructions were prepared for aws-lambda-redshift-loader v2.4.0.

---

### Setting Up S3 Buckets

1. Login to you AWS console and create two s3 buckets for future use.
  1. controlshift-receiver - will hold received csv files
  2. controlshift-manifests - will hold resulting manifest files from your aws-lambda-redshift-loader
2. That's it. You're done here.

---

### Setting Up Custom Lambda Receiver

> Lambda Receiver Code

```js
var https = require('https');
var url = require('url');
var AWS = require('aws-sdk');

var s3 = new AWS.S3();
var targetBucket = 'controlshift-receiver'; // receiver bucket name

exports.handler = function(event, context) {
  var receivedJSON = JSON.stringify(event, null, 2);
  console.log('Received event:', receivedJSON);
  if(event.type == 'data.full_table_exported'){
    var downloadUrl = event.data.url;
    var fileName = url.parse(downloadUrl).pathname.replace('/','')
    https.get(downloadUrl, function(httpResponse) {
      var upload_details = {Bucket: targetBucket, Key: fileName, Body: httpResponse};
      s3.upload(upload_details, function(err, data) {
        if (err){
          // an error occurred
          console.log(err, err.stack);
          context.fail(err);
        }else{
          // successful response
          console.log(httpResponse);
          context.succeed({"status": "success", "payload": receivedJSON});
        }
      });
    });
  }else{
    context.succeed({"status": "skipped", "payload": receivedJSON});
  }
};
```

From the Lambda management console, you'll need to do the following.

#### Create the Receiver Lambda

1. Click to create a new Lambda function.
2. Skip the existing blueprints (button towards  the bottom of page)
3. Name your function something like "controlShiftWebhookReciever" and leave the runtime to node default.
4. Copy and paste the "Lambda Receiver" function from the right into the inline lambda code editor.
5. Leave the handler as the default.
6. For role, select "S3 Execution role". This will open a new window.
7. In this new window, called "IAM Management Console", name your role something relevant, like "controlShiftReceriver_s3." Then click "Allow" in the far bottom left corner.
8. Next is setting the memory size. You should be fine with 128MB, but if you have a large petitions DB, you will likely need more. You can always update the memory size later. Later, you can check the log stream in Cloudwatch monitoring to see how much memory was used.
9. Set the Timeout a little higher - 30 seconds should be fine.
10. Use "No VPC".

#### Setup the API Endpoint

Now that we have our Lambda setup, we need to be able to POST to it from your Control Shift instance.

1. If not already there, go back to the Receiver Lambda we just created.
2. Click on the "API Endpoints" tab and click to add a new endpoint.
3. Select an API Gateway.
4. Set the Method to POST and Security to Open.
5. Click create. Done!

---

### Setting Up RedShift Database

Click on over to the Redshift service in the AWS console.

#### Launch Your Cluster

1. Click to create your cluster.
2. Setup a identifier, database name, master user name and password as you desire and click next. Let's use these values for this example:
  * Cluster: control-shift-cluster
  * Database name: controlshiftdb
  * Port: Leave the default
  * Master Username: masteruser
3. Use the defaults on the next two screens, "Node Configuration" and "Additional Configuration, just click next.
4. Then Launch!
5. Once the creation and launch process finishes, you can click to view your new cluster's properties, which will include an  endpoint address. Save that address somewhere. Example: `control-shift-cluster.xXxXxX00Xx.us-east-1.redshift.amazonaws.com`

#### Prepare Redshift Connection Security

We need to whitelist our IP address for our default security group in order to connect to our Redshift DB. While we're managing our security through a VPC (Virtual Private Cloud), The best UI for our purposes is actually in the EC2 configuration console.

2. Go to the AWS Console > EC2
3. Click to "Security Groups" in the left hand menu.
4. Click on the default Security Group (it should say default in the "Group Name" column,
5. Click on the "Inbound Rules" tab at the bottom and click edit.
5. Click "Add Rule."
7. Select "All Traffic" for "type" and for "source" select "My IP." This should prefill your CIDR.  Save the new rule.
8. Click "Add Rule" again.
9. Select "Redshift" for "Type." Enter your cluster's port (typically 5439). Type "sg-" into the source field, and it should pull up your default security group.

**Note:** If you're having trouble getting your own IP/CIDR setup, try either looking up your subnet mask and using [this table](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#IPv4_CIDR_blocks).  Your CIDR will almost always be your id address followed by `/32` or `/64` for ipv6.  Example: `123.123.123.123/32`. If all else fails, use the global 0.0.0.0/0 - opening your cluster to the public Internet. The latter isn't recommended. If you do have to do this, make sure you remove the rule when you're done.
 -->
#### Prepare Redshift Schema

We need to prep our tables data schema to receive our ConrtolShift Data.  We'll use `psql` for this.

1. Install `psql` you don't have it already.
2. Download the current schema for our petitions table as <a href="/data/petitions_schema.sql" target="_blank">petitions_schema.sql</a>.
3. Finally, you'll need to load that schema into your table with the following command.

```psql -h <cluster_endpoint> -U <database_user> -d <database_name> -p <cluster_port> -f petitions_schema.sql```

**Note:** When connecting, you should almost immediately get a request for your password. If you're connection is timing out *before* you enter your password, there is a authorization issue.  If you are timing out *after* connecting, you can extend your keep alive timeout with the following shell command.

```sudo /sbin/sysctl -w net.ipv4.tcp_keepalive_time=200 net.ipv4.tcp_keepalive_intvl=200 net.ipv4.tcp_keepalive_probes=5```

#### Creating a Database User & Granting Privileges

> Creating a user and granting INSERT Privileges

```sql
CREATE USER redshift_user PASSWORD PlainTextPassword123;
ALTER TABLE petitions OWNER TO redshift_user;
GRANT INSERT ON petitions TO redshift_user;
```

We need to allow our user to access our aws-lambda-redshift-loader to access our Redshift database. Connect via psql and create your user and grant permissions. See code example.

```psql -h <cluster_endpoint> -U <database_user> -d <database_name> -p <cluster_port>```

**Security Notes:**

* Typically, we'd like to limit the privileges we're granting our redshift_user to just INSERT and TRUNCATE. Unfortunately, Redshift doesn't allow us to specifically grant TRUNCATE permissions. Thus, our redshift_user must own the table.
* In PostgreSQL, we wouldn't need to grant INSERT privileges to the owner, but Redshift seems to need this.
* For Redshift cluster versions > 1.0.1046, you can store your password as a MD5 hash instead of cleartext. At the time of this writing, most clusters are on version 1.0.1044. See the md5 section of the [create user documentation](http://docs.aws.amazon.com/redshift/latest/dg/r_CREATE_USER.html).

---

### Setting up aws-lambda-redshift-loader

#### Deploying the aws-lambda-redshift-loader Function

> AWS Lambda Execution Role

```json
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"Stmt1424787824000",
      "Effect":"Allow",
      "Action":[
        "dynamodb:DeleteItem",
        "dynamodb:DescribeTable",
        "dynamodb:GetItem",
        "dynamodb:ListTables",
        "dynamodb:PutItem",
        "dynamodb:Query",
        "dynamodb:Scan",
        "dynamodb:UpdateItem",
        "sns:GetEndpointAttributes",
        "sns:GetSubscriptionAttributes",
        "sns:GetTopicAttributes",
        "sns:ListTopics",
        "sns:Publish",
        "sns:Subscribe",
        "sns:Unsubscribe",
        "s3:Get*",
        "s3:Put*",
        "s3:List*",
        "kms:Decrypt",
        "kms:DescribeKey",
        "kms:GetKeyPolicy"
      ],
      "Resource":[
        "*"
      ]
    },
    {
      "Effect":"Allow",
      "Action":[
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource":"arn:aws:logs:*:*:*"
    },
    {
      "Effect":"Allow",
      "Action":[
        "ec2:CreateNetworkInterface",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DetachNetworkInterface",
        "ec2:DeleteNetworkInterface"
      ],
      "Resource":"*"
    }
  ]
}
```

1. Go to the AWS Lambda Console in the same region as your S3 bucket and Amazon Redshift cluster.
2. Select Create a Lambda function and enter the name controlShiftRedshiftLoader (for example).
3. Under Code entry type select 'Upload a zip file' and upload the [AWSLambdaRedshiftLoader-2.4.0.zip](https://github.com/awslabs/aws-lambda-redshift-loader/blob/master/dist/AWSLambdaRedshiftLoader-2.4.0.zip) from your local ```dist``` folder or [download it](https://github.com/awslabs/aws-lambda-redshift-loader/tree/master/dist).
4. Use the default values for the handler, and in the Role drop-down, select "* Basic Execution Role." A IAM creation wizard will open in a new window.
5. Follow the wizard, selecting to "Create a new IAM Role" and name it as you like.  Click to "View the Policy" and then click edit.
6. Copy and paste the the AWS Lambda Execution Role permissions from the example "AWS Lambda Execution Role" or from the official [readme](https://github.com/awslabs/aws-lambda-redshift-loader#getting-started---lambda-execution-role).
7. Then click "Add Policy." Select the `AmazonRedshiftFullAccess` role and add it, then add another role - `AmazonDMSRedshiftS3Role`.
8. Navigate back to your Lambda setup tab and set the max timeout (5 minutes) to accommodate potentially long COPY times.
9. From the VPC dropdown, select your default VPC.
10. Leave the rest of the settings alone.
11. Click next and then click to create your Lambda.

#### Establishing an Event Source

Once deployed, you need to add an event source:

1. Select "Event Source" tab and click to "Add event source."
2. The event source type should be set to S3.
3. Select the S3 bucket you want to use for input data - controlshift-receiver.
4. Select the 'Object Created (All)' notification type.

#### Configuration Prep

1. If you have already installed npm's `aws-sdk` with your credentials, great, but if not, you can always export your credentials as environment variables before running `setup node.js`.
```export AWS_ACCESS_KEY_ID=XXXXXXXXX AWS_SECRET_ACCESS_KEY=XXXXXXXXXXX```
2. You'll need to export your region as well `export AWS_REGION=us-east-1`.

#### Running setup.js

1. After setting up your environment, head to your local copy of aws-lambda-redshift-loader.
2. run `node setup.js`
3. The script will request various configuration options.  Some sensible responses for our use case are below. Empty responses were just skipped.

|          |
|----------|
| Enter the Region for the Configuration > us-east-1 |
| Enter the S3 Bucket & Prefix to watch for files > controlshift-receiver |
| Enter a Filename Filter Regex > |
| Enter the Cluster Endpoint > control-shift-cluster.xXxXxX00Xx.us-east-1.redshift.amazonaws.com |
| Enter the Cluster Port > 5439 |
| Does your cluster use SSL (Y/N)  > Y |
| Enter the Database Name > controlshiftdb |
| Enter the Table to be Loaded > petitions |
| Enter the comma-delimited column list (optional) > (Copy and paste from our [petitions_headers.csv](/data/petitions_headers.csv)) |
| Should the Table be Truncated before Load? (Y/N) > Y # Don't truncate if this lambda will handle incremental builds. |
| Enter the Database Username > masteruser # Or any user you created in psql |
| Enter the Database Password > SuPeRs8CuR1tY # your password |
| Enter the Data Format (CSV, JSON or AVRO) > CSV |
| Enter the CSV Delimiter > , |
| Enter the S3 Bucket for Redshift COPY Manifests > controlshift-manifests |
| Enter the Prefix for Redshift COPY Manifests > manifests |
| Enter the Prefix to use for Failed Load Manifest Storage > failed |
| Enter the Access Key used by Redshift to get data from S3. If NULL then Lambda execution role credentials will be used > <aws key> |
| Enter the Secret Key used by Redshift to get data from S3. If NULL then Lambda execution role credentials will be used > <aws key> |
| Enter the SNS Topic ARN for Successful Loads > |
| Enter the SNS Topic ARN for Failed Loads > |
| How many files should be buffered before loading? > 1 |
| How old should we allow a Batch to be before loading (seconds)? > 120 |
| Additional Copy Options to be added > |
| If Encrypted Files are used, Enter the Symmetric Master Key Value > |

---

### Configure ControlShift's webhook

Finally, you'll need to log into your admin panel.  Settings > CRM Integrations & Webhooks > Configure Webhook Endpoints.  Then add a bulk data webhook pointing at your Lambda endpoint.

### Troubleshooting Errors

> Example LambdaRedshiftBatches error

```json
{
  "control-shift-cluster.ckcgajpfnj82.us-east-1.redshift.amazonaws.com":{
    "status":-1,
    "error":{
      "name":"error",
      "length":143,
      "severity":"FATAL",
      "code":"28000",
      "file":"/home/awsrsqa/padb/src/pg/src/backend/libpq/auth.c",
      "line":"402",
      "routine":"auth_failed"
    }
  }
}
```

A few tips if things aren't working:

* Most errors will probably occur when attempting to load data from Lambda into Redshift. The DynamoDB batch history captures errorMessages in the the `LambdaRedshiftBatches` table. Click on the `entries` field. You can also check AWS Cloudwatch > Logs and then click on the appropriate cloud stream.
* Since Redshift is based on PostgreSQL 8.0.2, there is a healthy amount of overlapping error codes. You can [lookup errors codes here](http://www.postgresql.org/docs/8.0/static/errcodes-appendix.html). Example errors:
  * `28000` - Unable to connect to the database. Is the username/password/database name entered correctly when running setup.js? Is the user granted proper privileges on your database?
  * `42P01` - Redshift doesn't have the table you're trying to import data into. Did you import the schema as described above?
  * `XX000` - This is an internal error. In our case, the most likely causes are either an invalid schema usually caused by an [unsupported data type](http://docs.aws.amazon.com/redshift/latest/dg/c_unsupported-postgresql-datatypes.html). Double check that your imported schema is correct. If you aren't using the provided schema, double check that you're using the supported types and that your imported data matches those types.
  * `42601` - Syntax error - This is most likely a typo when running setup.js. If you're entering your CSV columns during setup, be sure they match the schema you've loaded into the database. Make sure your CSV Delimiter is set correctly and your CSV is properly formated.
  * `42501` - Insufficient privileges errors.  Did you GRANT your user all the privileges required?
* Be sure to check the logging messages you see in your Lambda log streams under CloudWatch > logs.
* Try manually uploading a petitions export to your `controlshift-receiver` S3 bucket, and check DynamoDB batch history for errors. You can fetch these exports from your ControlShift Labs instance, in Settings > Exports.