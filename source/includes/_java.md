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

### JBoss

#### JBoss Domain mode

For JBoss EAP 6.x and 7.0.x AS and above. The JVM properties for each server group are found in `domain/configuration/domain.xml`.

The JVM properties for each server group needs to be modified to include the `-javagent` argument.

```xml
<servers>
  <server name="server_01" group="group_01" auto-start="true">
    <jvm name="default" debug-enabled="false">
      <jvm-options>
        <!-- add the following option value -->
        <option value="-javaagent:/full/path/to/scout-apm/scout-apm.jar" />
      </jvm-options>
    </jvm>
  </server>
  ...
```

#### Standalone mode

For JBoss 6.x EAP and 7.0.x AS on OSX or Unix, at the bottom of `bin/standalone.conf`, add this

```terminal
JAVA_OPTS="$JAVA_OPTS -javaagent:/full/path/to/scout-apm/scout-apm.jar"
```

For JBoss 6.x EAP and 7.0.x AS on Windows, at the bottom of `bin/standalone.bat`, add this

```terminal
set JAVA_OPTS="$JAVA_OPTS -javaagent:/full/path/to/scout-apm/scout-apm.jar"
```

For JBoss 6.x and below on OSX or Unix, at the bottom of `bin/run.conf`, add this:

```terminal
JAVA_OPTS="$JAVA_OPTS -javaagent:/full/path/to/scout-apm/scout-apm.jar"
```

For JBoss 6.x and below on Windows, at the bottom of `bin/run.bat`, add this

```terminal
set JAVA_OPTS="$JAVA_OPTS -javaagent:/full/path/to/scout-apm/scout-apm.jar"
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

## Java Agent Change Log

#### 0.2.0
* Support for JAX-RS @Suspended asynchronous tracing
* Support for the Grails framework

#### 0.1.2
* Better handling slow transactions
* Add node name

#### 0.1.1
* Better handling auxiliary threads
* Better endpoint naming in Errors

#### 0.1.0
* Add JAX-RS plugin

#### 0.0.5
* Jedis (sendCommand) support
* Jedis (sendCommand) support
* Temporary remove background jobs from aggregation (wait for endpoint feature)

## Questions / Getting Help

Java Application monitoring is in beta. [Email us](mailto:support@scoutapp.com) with any questions about your framework and environment, or for help getting started.
