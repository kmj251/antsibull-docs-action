# Container image that runs your code
FROM quay.io/ansible/ansible-runner

python3 -m pip install antsibull

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]