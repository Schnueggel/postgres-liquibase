#@IgnoreInspection BashAddShebang
# For oracle jdk see here https://github.com/gratiartis/dockerfiles/blob/master/oraclejdk8/Dockerfile
FROM java:7

MAINTAINER Golio

# download liquibase
# ADD http://sourceforge.net/projects/liquibase/files/Liquibase%20Core/liquibase-3.4.0-bin.tar.gz/download /tmp/liquibase-3.4.0-bin.tar.gz
COPY lib/liquibase-3.4.0-bin.tar.gz /tmp/liquibase-3.4.0-bin.tar.gz

# Create a directory for liquibase
RUN mkdir /changelogs && \
	mkdir /opt/liquibase && \
    tar -xzf /tmp/liquibase-3.4.0-bin.tar.gz -C /opt/liquibase && \
	chmod +x /opt/liquibase/liquibase && \
	ln -s /opt/liquibase/liquibase /usr/local/bin/

# Get the postgres JDBC driver from http://jdbc.postgresql.org/download.html
# ADD http://jdbc.postgresql.org/download/postgresql-9.4-1201.jdbc41.jar /opt/jdbc_drivers/
COPY lib/postgresql-9.4-1201.jdbc41.jar /opt/jdbc_drivers/

ENV POSTGRES_JDBC=/usr/local/bin/postgresql-9.4-1201.jdbc41.jar

RUN ln -s /opt/jdbc_drivers/postgresql-9.4-1201.jdbc41.jar /usr/local/bin/

# Add command scripts
ADD scripts /scripts
RUN chmod -R +x /scripts

WORKDIR /

ENTRYPOINT ["/bin/bash"]
