FROM python:3.5-alpine

WORKDIR /powerdns

COPY ./config.py /tmp/config.py

RUN apk add --no-cache -t build-deps build-base mariadb-dev libffi-dev openldap-dev git yarn libxml2-dev libxslt-dev xmlsec-dev && \
    apk add --no-cache netcat-openbsd libxslt libldap mariadb-connector-c && \
    git clone https://github.com/ngoduykhanh/PowerDNS-Admin.git /powerdns && \
    mv /tmp/config.py /powerdns/config.py && \
    pip install --no-cache-dir -r requirements.txt && \
    yarn install --prod --pure-lockfile && \
    flask assets build && \
    yarn cache clean && \
    apk del build-deps

COPY ./entrypoint.sh /entrypoint.sh

EXPOSE 9191

ENTRYPOINT ["/entrypoint.sh"]
