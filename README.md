# Secrets_in_env


1. Create an .env file with secrets:

```bash
sec_user:supersecret123
```


2. Enable BuildKit:

```bash
export DOCKER_BUILDKIT=1
```

2. Use the --secret argument to do a docker build:


```bash
docker build -t my-nginx --secret id=my_env,src=./env/staging.env .
```
3. 
Use the --mount argument to mount the secret for every RUN directive that needs it
```bash
RUN --mount=type=secret,id=mysecret cat /run/secrets/mysecret
RUN --mount=type=secret,id=yoursecret,target=/target/path/to/secret
```

4. 

 docker run -d -p 8080:80 --name my-nginx my-nginx



Add a syntax comment to the very top of your Docker file

```bash
# syntax = docker/dockerfile:1.0-experimental
```


Use the --mount argument to mount the secret for every RUN directive that needs it

RUN --mount=type=secret,id=mysecret cat /run/secrets/mysecret

RUN --mount=type=secret,id=my_env source /run/secrets/my_env

