FROM nicolaka/netshoot:latest

ENV SAML2AWS_VERSION="2.26.2"

RUN apk update \
 && apk upgrade \
 && apk add --no-cache \
    openssh-client \
    openldap-clients \
    krb5 \
    jq \
    postgresql-client \
    mysql-client \
    aws-cli \
    git

RUN curl -LO "https://github.com/Versent/saml2aws/releases/download/v${SAML2AWS_VERSION}/saml2aws_${SAML2AWS_VERSION}_linux_amd64.tar.gz" \
 && tar zxf "saml2aws_${SAML2AWS_VERSION}_linux_amd64.tar.gz" \
 && chmod +x saml2aws \
 && mv saml2aws /usr/local/bin/ \
 && rm -f "saml2aws_${SAML2AWS_VERSION}_linux_amd64.tar.gz"

ADD krb5.conf /etc/krb5.conf
ADD ldap.conf /etc/openldap/ldap.conf
ADD profile /etc/profile
ADD bashrc /root/.bashrc

CMD ["/bin/bash","-l"]
