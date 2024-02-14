FROM docker.io/library/alpine:3.18.2

# install basic tools and helm
RUN apk add --no-cache bash curl openssl git yq
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
RUN helm plugin install https://github.com/chartmuseum/helm-push

ENTRYPOINT "/bin/bash"
