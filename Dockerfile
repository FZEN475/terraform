FROM alpine/terragrunt as terraform

RUN apk add jq
COPY / /source
WORKDIR /source

RUN chmod +x /source/entrypoint.sh
ENTRYPOINT ["/source/entrypoint.sh"]