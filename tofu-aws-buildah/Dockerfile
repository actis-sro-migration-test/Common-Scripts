FROM ghcr.io/opentofu/opentofu:latest
RUN alias tf='tofu'
RUN alias terraform='tofu'
RUN apk add buildah curl unzip aws-cli --no-cache
ENTRYPOINT [ "/bin/bash" ]