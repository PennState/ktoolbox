FROM nicolaka/netshoot:latest

RUN apk update \
 && apk upggrade \
 && apk add --no-cache \
    openssh-client \
    openldap-clients \
    krb5 \
    jq

CMD ["/bin/bash","-l"]
