FROM fluent/fluentd:v1.16-1

# Use root account to use apk
USER root

# below RUN includes plugin as examples elasticsearch is not required
# you may customize including plugins as you wish
RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev libxml2-dev \
#  && sudo gem install fluent-plugin-elasticsearch \
 && sudo gem sources --clear-all \
#  && sudo /usr/sbin/td-agent-ui start \
 && apk del .build-deps \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

# RUN sudo gem install -V fluentd-ui \
#   && sudo fluentd-ui setup \
#   && sudo fluentd-ui start --daemonize

COPY /conf/fluent.conf /fluentd/etc/
# COPY entrypoint.sh /bin/

USER fluent