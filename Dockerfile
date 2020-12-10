FROM nicolaka/netshoot:latest

ENV SAML2AWS_VERSION="2.26.2"
ENV GOFETCH_VERSION=0.2.1

RUN apk update \
 && apk upgrade \
 && apk add --no-cache \
    openssh-client \
    openldap-clients \
    ldapvi \
    zsh \
    krb5 \
    jq \
    postgresql-client \
    mysql-client \
    aws-cli \
    git \
    screen

RUN curl -q -LO "https://github.com/Versent/saml2aws/releases/download/v${SAML2AWS_VERSION}/saml2aws_${SAML2AWS_VERSION}_linux_amd64.tar.gz" \
 && tar zxf "saml2aws_${SAML2AWS_VERSION}_linux_amd64.tar.gz" \
 && chmod +x saml2aws \
 && mv saml2aws /usr/local/bin/ \
 && rm -f "saml2aws_${SAML2AWS_VERSION}_linux_amd64.tar.gz"

RUN curl -q -LO "https://github.com/acobaugh/gofetch/releases/download/v${GOFETCH_VERSION}/gofetch_${GOFETCH_VERSION}_linux_amd64.tar.gz" \
 && tar -xzvf "gofetch_${GOFETCH_VERSION}_linux_amd64.tar.gz" \
 && chmod +x gofetch \
 && mv gofetch  /usr/local/bin/fluxctl \
 && rm -f gofetch*.tar.gz

ADD krb5.conf /etc/krb5.conf
ADD ldap.conf /etc/openldap/ldap.conf
ADD profile /etc/profile
ADD bashrc /root/.bashrc

CMD ["/bin/bash","-l"]
