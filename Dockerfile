
ARG FLINK_VERSION=1.12.3-scala_2.11
FROM flink:${FLINK_VERSION}

# FROM flink:1.11.3-scala_2.12-java11
## cf. https://github.com/RMLio/RMLStreamer/blob/development/docker/docker-compose.yml

LABEL org.opencontainers.image.source="https://github.com/vemonet/flink-on-openshift"

# Download latest release of the RMLStreamer jar file
RUN curl -s https://api.github.com/repos/RMLio/RMLStreamer/releases/latest \
        | grep browser_download_url | grep .jar | cut -d '\"' -f 4 \
        | wget -O /opt/RMLStreamer.jar -qi -


## cf. https://ci.apache.org/projects/flink/flink-docs-release-1.13/docs/deployment/resource-providers/native_kubernetes/#application-mode
# RUN mkdir -p $FLINK_HOME/usrlib
# COPY /path/of/my-flink-job.jar $FLINK_HOME/usrlib/my-flink-job.jar

# ADD ./flink-conf.yaml /opt/flink/conf/flink-conf.yaml
# ADD ./log4j.properties /opt/flink/conf/log4j.properties