FROM alpine:latest

#Enviroment Values and Default Settings
ENV WINDWARD_SERVER_NAME="Windward Horizon Server" \
    WINDWARD_SERVER_WORLD="World" \
    WINDWARD_SERVER_PORT=5123 \
    WINDWARD_SERVER_PUBLIC=0

#Commands to run on the initial image
RUN /bin/sh -c apk update && apk upgrade
RUN /bin/sh -c RUN apk --update --no-cache add mono bash curl unzip nano screen
RUN /bin/sh -c apk add --no-cache --virtual=.build-dependencies ca-certificates && cert-sync /etc/ssl/certs/ca-certificates.crt # buildkit

#Create the windward-horizon directory
RUN mkdir /windward-horizon

VOLUME /windward-horizon

EXPOSE $WINDWARD_SERVER_PORT

COPY ./windward-horizon.sh /windward-horizon

CMD ["/windward-horizon/windward-horizon.sh"]
