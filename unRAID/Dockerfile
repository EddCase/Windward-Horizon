FROM alpine:latest

#Enviroment Values and Default Settings
ENV WINDWARD_SERVER_NAME="Windward Horizon Server" \
    WINDWARD_SERVER_WORLD="World" \
    WINDWARD_SERVER_PORT=5123 \
    WINDWARD_SERVER_PUBLIC=0

#Commands to run on the initial image

RUN apk update
RUN apk upgrade
RUN apk --update --no-cache add mono bash curl unzip nano screen
RUN apk add --no-cache --virtual=.build-dependencies ca-certificates && cert-sync /etc/ssl/certs/ca-certificates.crt # buildkit

#Create the windward-horizon directory
COPY ./windward-horizon/. /windward-horizon

VOLUME /windward-horizon

EXPOSE $WINDWARD_SERVER_PORT
CMD ["/windward-horizon/windward-horizon.sh"]
