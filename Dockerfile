FROM alpine

MAINTAINER Jaime Barrajón <jaime.barrajon@gmail.com>

ENV VERSION="1.8.15"

RUN apk --no-cache add ca-certificates curl bind-tools tar \
 && curl -L "https://dl.k8s.io/v${VERSION}/kubernetes-client-linux-amd64.tar.gz" -o /tmp/kubernetes-client.tar.gz \
 && tar -xzf /tmp/kubernetes-client.tar.gz \
 && mv kubernetes/client/bin/kube* /usr/local/bin/ \
 && chmod +x /usr/local/bin/kube* \
 && rmdir -p kubernetes/client/bin

WORKDIR /root
CMD ["/bin/sh"]
