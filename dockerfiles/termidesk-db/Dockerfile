FROM postgres:16.2
ENV TZ="Europe/Moscow"
RUN localedef -i ru_RU -c -f UTF-8 -A /usr/share/locale/locale.alias ru_RU.UTF-8
ENV LANG ru_RU.utf8
COPY init.sql /docker-entrypoint-initdb.d/