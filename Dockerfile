# syntax=docker/dockerfile:1.2
FROM nginx:latest
RUN apt-get update && apt-get install -y procps
RUN apt-get install --no-install-recommends -y apache2-utils
# shows secret from default secret location:
RUN --mount=type=secret,id=usertestsk,target=/etc/nginx/.htpasswd
COPY ./index.html /usr/share/nginx/html/index.html
WORKDIR /usr/share/nginx/html
RUN date +%x_%H:%M:%S:%N >> ./index.html