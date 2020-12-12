# Usage

In your Dockerfile use something like this:
`COPY ./app /app`
`RUN install --no-cache-dir -r requirements.txt`

Where `./app` is the location of Django App which include requirements.txt


`COPY ./fonts /root/.fonts`

Where `./fonts` is the location of fonts which will be used by Weasyprint, at least one font is required

'EXPOSE 8000`

Where `8000` is the port you want your docker to expose