FROM camflan/envtpl:latest AS envtpl

FROM alpine:3

COPY --from=envtpl /bin/envtpl /bin/envtpl
ADD ./config.yml.tpl ./docker-entrypoint.sh /opt

ENTRYPOINT ["envtpl", "/opt/config.yml.tpl"]
