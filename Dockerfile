FROM python:3.13-slim-bookworm

WORKDIR /app

COPY . .

RUN pip3 install --no-cache-dir .

CMD [ "miele-rest-server", "-b", "127.0.0.1", "-p", "5001" ]
