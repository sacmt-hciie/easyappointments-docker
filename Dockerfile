############################################################
# Dockerfile to run Easy!Appointments
# Based on Alpine
############################################################

FROM jamrizzi/php-nginx-alpine:php7

MAINTAINER Jam Risser (jamrizzi)

ENV BASE_URL=http://localhost
ENV LANGUAGE=english
ENV DEBUG=false
ENV DB_HOST=db
ENV DB_NAME=easyappointments
ENV DB_USERNAME=root
ENV DB_PASSWORD=hellodocker
ENV GOOGLE_SYNC_FEATURE=false
ENV GOOGLE_PRODUCT_NAME=""
ENV GOOGLE_CLIENT_ID=""
ENV GOOGLE_CLIENT_SECRET=""
ENV GOOGLE_API_KEY=""

EXPOSE 8888

WORKDIR /app/www/

ADD https://github.com/alextselegidis/easyappointments/releases/download/1.2.0/easyappointments_1.2.0.zip /app/www/

RUN unzip -o /app/www/easyappointments_1.2.0.zip && \
    rm easyappointments_1.2.0.zip
COPY ./app/ /app/

ENTRYPOINT ["/sbin/tini", "--", "python", "/app/run.py"]
