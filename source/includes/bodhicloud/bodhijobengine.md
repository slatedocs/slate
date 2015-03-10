## Bodhi Job Engine

#### Introduction
Bodhi Job Engine is a job scheduler running on node.js and MongoDB. The
engine is designed to run scheduled cloud-to-cloud data transactions,
e.g. requesting data from web APIs, pushing data to the Bodhi cloud,
etc.

#### Getting started

Bodhi Job Engine is currently for internal Hot Schedules developers. Jobs
are built on Node.js and are installed as rpms from Artifactory.

Installation of Bodhi Job Engine requires access to the appropriate
Artifactory account. To install:

npm install bodhi-job-engine

In your root directory, add file index.js containing one line of code:

````
var engine = require('bodhi-job-engine');

````

Test your installation by running this command:

````
node index.js

//Expected Output:

//Bodhi Job Engine listening at http://....
//View the UI in a browser at http://....
//No jobs found

````


#### Creating a job

Jobs must be built in a specific format in order for Bodhi Job Engine to
recognize and run them properly. The job should contain an index.js file
that follows this structure:

````
var config = require('./job-config.js');

exports.config = config;

exports.run = function(job, done){
    try{
        //do stuff here
    } catch (err) {
        console.log('Error defining job: ', config.job_name, err);
        done(err);
    }
};

````

The job-config.js file should be structured like this:

````
module.exports = {
        //agent_config property required to post to the Bodhi cloud.
    agent_config: {
        target_url: 'https://api....',  //where are you posting data to the cloud
        namespace: 'walker', //your namespace
        bearerToken: ';laksjdf;lkjasdf;lkjasdlf;j' //agent bearerToken for authentication
    },
    job_name: 'job-app-your_job_name', //the name of your job, must start with 'job-app-'
    time_interval: '3 seconds' //how often do you want the job to run?
    //Understands hours, minutes, seconds, days ...
};

````
####Loading a job

Once your job is ready and available in Artifactory, load the job into
the job engine using npm install:

````
npm install job-app-your_job_name

````

After installation, edit the node_modules/bodhi-job-engine/engine-config.js to add
your job and enable it:

````
module.exports = {

    jobs: {
        'job-app-engine_tester': {
                    enabled: true
                },
                'job-app-your_app_name': {
                    enabled: true
                }
    }
};

````

That's it. Starting the job engine should now run your job on the schedule you specified.