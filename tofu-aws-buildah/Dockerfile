FROM ghcr.io/opentofu/opentofu:latest
RUN alias tf='tofu'
RUN alias terraform='tofu'
RUN apk add buildah curl unzip aws-cli curl fuse fuse-overlayfs --no-cache

# ## srani s upterm
# RUN mkdir -p /opt/upterm
# RUN curl -sL https://github.com/owenthereal/upterm/releases/download/v0.14.3/upterm_linux_amd64.tar.gz | tar xz -C /opt/upterm && \
#     ln -s /opt/upterm/upterm /usr/local/bin/upterm
# COPY head.ca.crt /usr/local/share/ca-certificates/head.ca.crt
# COPY id_rsa /root/.ssh/id_rsa
# COPY id_rsa.pub /root/.ssh/id_rsa.pub
# COPY known_hosts /root/.ssh/known_hosts

# RUN chmod 600 /root/.ssh/id_rsa && \
#     chmod 644 /root/.ssh/id_rsa.pub && \
#     chmod 644 /root/.ssh/known_hosts

# RUN update-ca-certificates && \
#     ssh-keyscan -t rsa upterm.develop.actis.cz >> /root/.ssh/known_hosts
# RUN echo "Host upterm.develop.actis.cz\n  IdentityFile /root/.ssh/id_rsa\n  User root" >> /root/.ssh/config
# ENTRYPOINT [ "/bin/bash" ]

#RUN upterm host --accept --server wss://upterm.develop.actis.cz -- /bin/bash