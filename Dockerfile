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

ADD krb5.conf /etc/krb5.conf
ADD ldap.conf /etc/openldap/ldap.conf
ADD profile /etc/profile

CMD ["/bin/bash","-l"]
