FROM alpine:latest

COPY ./content /workdir/

RUN apk add --no-cache curl runit caddy jq tor wget \
    && chmod +x /workdir/service/*/run /workdir/*.sh \
    && /workdir/install.sh \
    && ln -s /workdir/service/* /etc/service/

ENV PORT=3000
ENV VmessUUID=ad9670be-beff-44fe-b6bb-b2739b062394
ENV SecretPATH=/ad9670be-beff-44fe-b6bb-b2739b062394-vm
ENV PASSWORD=ad9670be-beff-44fe-b6bb-b2739b062394-tr

EXPOSE 3000

ENTRYPOINT ["runsvdir", "-P", "/etc/service"]
