# Container image that runs your code
FROM centos:7

RUN echo "sslverify=false" >> /etc/yum.conf
RUN yum -y install python3
RUN python3 -m pip install ansible \
    && python3 -m pip install antsibull

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]