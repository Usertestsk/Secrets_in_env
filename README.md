# Secrets_in_env


Set environment variable DOCKER_BUILDKIT=1



Use the --secret argument to docker build command

DOCKER_BUILDKIT=1 docker build --secret id=mysecret,src=mysecret.txt...

Add a syntax comment to the very top of your Docker file

# syntax = docker/dockerfile:1.0-experimental

Use the --mount argument to mount the secret for every RUN directive that needs it

RUN --mount=type=secret,id=mysecret cat /run/secrets/mysecret

RUN --mount=type=secret,id=my_env source /run/secrets/my_env
