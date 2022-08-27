# Secrets_in_env


1. Create an .env file with secrets:

```bash
sec_url=secret.com/mr.secret
sec_user=mr.secret
sec_passw=supersecret123
```


2. Enable BuildKit:

```bash
export DOCKER_BUILDKIT=1
```

2. Use the --secret argument to docker build command

docker build -t my-nginx --secret id=my_env,src=.env .



Add a syntax comment to the very top of your Docker file

# syntax = docker/dockerfile:1.0-experimental

Use the --mount argument to mount the secret for every RUN directive that needs it

RUN --mount=type=secret,id=mysecret cat /run/secrets/mysecret

RUN --mount=type=secret,id=my_env source /run/secrets/my_env

