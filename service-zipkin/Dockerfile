FROM openjdk:8-jdk-alpine
COPY target/service-zipkin-0.2.jar /service-zipkin-0.2.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS  -Djava.security.egd=file:/dev/./urandom -jar /service-zipkin-0.2.jar" ]