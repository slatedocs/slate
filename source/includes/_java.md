# Java Applications

## Supported Frameworks

Scout APM has preliminary Java support for the following frameworks:

* Spring MVC
* Struts
* Hibernate
* JSF
* JSP
* Servlet API
* _HTTP Clients:_ Apache HTTP Client, OkHttp, Ning
* _Logging:_ Log4J, Commons Logging, Logback



## Downloading the JAR

The most recent Scout Java APM release is [available for download here](https://www.dropbox.com/s/bzmvmq2ck8jtzhj/scout-apm.jar?dl=1) (direct download link, ~10MB).


```terminal  
wget https://www.dropbox.com/s/bzmvmq2ck8jtzhj/scout-apm.jar?dl=1 -Oscout-apm.jar
```

## Adding the JAR to your Application

Installation depends on your app server:

### Tomcat

Add the following to your `setenv.sh` file (and ensure `setenv.sh` is included from `catalina.sh`):

```terminal
export JAVA_OPTS="$JAVA_OPTS -javaagent:/full/path/to/scout-apm/scout-apm.jar"
```

* Of course, you can include the `export JAVA_OPTS` directly in your `catalina.sh`, but it's recommended to keep your additions in a separate file.  
* If you're using Windows, edit the settings in the Service Helper instead.

### Karaf

Karaf also has a `setenv.[sh|bat]` file -- see Tomcat instructions above.

If you run Karaf as a service, youll need to alter `karaf-wrapper.conf` and add lines like:

```terminal   
# Scout app monitoring
wrapper.java.additional.16=-DAPP_ENV=staging
wrapper.java.additional.17=-javaagent:d:/path/to/scout-apm.jar
# (16 and 17 are "the next free" numbers in the config file)
```

### Embedded Containers

For environments using embedded containers, just add the following `-javaagent:` argument to your `java` invocation:

```terminal
java -javaagent:/full/path/to/scout-apm/scout-apm.jar ... -jar <app-name>.jar
```

### Configuration

The Scout Java agent looks for a `scout_apm.yml` configuration file in the same directory as `scout-apm.jar`.

```terminal
/path/to/scout/scout-apm.jar
/path/to/scout/scout_apm.yml
```

Download the `scout_apm.yml` configuration file from within your account at https://apm.scoutapp.com. It includes your unique account key.

### Environments

The configuration file supports multiple environments. By default, the agent reads the `production` environment configuration.

**You can usually just leave the configuration file as-is until you need some environment-specific setting.**

If you're deploying Scout APM for the first time, we recommend starting on a staging environment. To instruct the agent to use the `staging` configuration, either:

* (A) Set an environment variable on your server: `export APP_ENV=staging`
* (B) OR use a system property (`-DAPP_ENV=staging`) when executing the Java call or JAVA_OPTS: `java -jar -DAPP_ENV=staging -javaagent:/full/path/to/scout-apm/scout-apm.jar`  

## Questions / Getting Help

Java Application monitoring is in beta. [Email us](mailto:support@scoutapp.com) with any questions about your framework and environment, or for help getting started.
