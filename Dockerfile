FROM nicolaka/netshoot:latest

RUN apk update \
 && apk upgrade \
 && apk add --no-cache \
    openssh-client \
    openldap-clients \
    krb5 \
    jq \
    postgresql-client \
    mysql-client

CMD ["/bin/bash","-l"]
