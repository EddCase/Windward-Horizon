FROM frolvlad/alpine-mono

ARG USER=windward
ARG GROUP=windward
ARG PUID=1000
ARG PGID=1000

ENV WINDWARD_SERVER_NAME="Windward Horizon Server" \
    WINDWARD_SERVER_WORLD="World" \
    WINDWARD_SERVER_PORT=5123 \
    WINDWARD_SERVER_PUBLIC=0

RUN apk --update --no-cache add bash curl unzip nano screen

RUN mkdir -p /windward-horizon && \
    chmod ugo=rwx /windward-horizon && \
	addgroup -g $PGID -S $GROUP && \
	adduser -u $PUID -G $GROUP -s /bin/sh -SD $USER && \
    chown -R $USER:$GROUP /windward-horizon
	
VOLUME /windward-horizon

EXPOSE $WINDWARD_SERVER_PORT

COPY ./windward-horizon.sh /windward-horizon

USER $USER

CMD ["/windward-horizon/windward-horizon.sh"]
