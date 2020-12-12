FROM python:3.8-alpine
ENV PYTHONUNBUFFERED 1

RUN apk --update --upgrade --no-cache add \
    cairo-dev pango-dev gdk-pixbuf-dev mariadb-connector-c-dev

# Weasyprint requires fonts to work properly. You have to copy fonts to this directory.
RUN mkdir /root/.fonts

# Copy Django projec to this directory
RUN mkdir /app

WORKDIR /app

RUN set -ex \
    && apk add --no-cache --virtual .build-deps \
        make mariadb-dev musl-dev gcc jpeg-dev zlib-dev libffi-dev \
    && pip install --no-cache-dir Django mysqlclient WeasyPrint \
    && apk del .build-deps

# In your Dockerfile use something like this:
# COPY ./app /app
# Where ./app is the location of Django App which include other requirements.txt

# COPY ./fonts /root/.fonts
# Where ./fonts is the location of fonts which will be used by Weasyprint, at least one font is required

# EXPOSE 80
