FROM docker.io/library/alpine:3.19
RUN apk add --no-cache bash curl openssl git kubectl ncurses
RUN curl -v https://raw.githubusercontent.com/helm/helm/v3.14.4/scripts/get-helm-3 | bash
RUN git clone --depth 1 --branch v0.9.5 https://github.com/ahmetb/kubectx /opt/kubectx && \
    ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx && \
    ln -s /opt/kubectx/kubens /usr/local/bin/kubens
ENTRYPOINT ["/bin/bash"]