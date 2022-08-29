# Secrets_in_env


1. Create an .env file with secrets to be stored in /etc/nginx/.htpasswd. Note: This .env directory wont be copied to your Github - use lastpass instead.

2. Enable BuildKit:

```bash
export DOCKER_BUILDKIT=1

```
3. Allow experimental syntax by adding a comment to the very top of your Docker file

```bash
# syntax = docker/dockerfile:1.0-experimental
```

4.  Use the --mount argument to mount the secret for every RUN directive that needs it, for example for nginx:
```bash
RUN --mount=type=secret,id=usertestsk,target=/etc/nginx/.htpasswd
```

5. Use the --secret argument to do a docker build:


```bash
docker build -t my-nginx --secret id=my_env,src=./env/staging.env .
```

6. Run nginx:
 docker run -d -p 8080:80 --name my-nginx my-nginx




