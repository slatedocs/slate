# Java Applications

## Supported Frameworks

Scout APM has preliminary Java support for the following frameworks:

* SpringMVC
* JSF
* Grails
* Spark
* Spring Boot
* Vert.x

## Downloading the JAR

The most recent Scout Java APM release is [available for download here](https://www.dropbox.com/s/bzmvmq2ck8jtzhj/scout-apm.jar?dl=1) (direct download link, ~17MB).

  
```terminal  
wget https://www.dropbox.com/s/bzmvmq2ck8jtzhj/scout-apm.jar?dl=1 -Oscout-apm.jar
```

## Adding the JAR to your application

Installation depends on your app server:

### Tomcat
Extend `catalina.sh` startup script with the following `JAVA_OPTS`:

```terminal
export JAVA_OPTS="$JAVA_OPTS -javaagent:/full/path/to/scout-java-agent/scout-apm.jar"
```

### Embedded Containers

For environments using embedded containers (Spark, Vert.x, Spring Boot, Grails), just add the `-javaagent:` argument to your `java` invocation: 
 
```terminal
java -jar ... -javaagent:/full/path/to/scout-java-agent/scout-apm.jar 
```

## Getting Started

Java Application monitoring is in beta. [Email us](mailto:support@scoutapp.com) with any questions about your framework and environment, or for help getting started. 