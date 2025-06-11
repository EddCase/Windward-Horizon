FROM alpine:latest

#Enviroment Values and Default Settings
ENV WINDWARD_SERVER_NAME="Windward Horizon Server" \
    WINDWARD_SERVER_WORLD="World" \
    WINDWARD_SERVER_PORT=5123 \
    WINDWARD_SERVER_PUBLIC=0

EXPOSE $WINDWARD_SERVER_PORT

#User Creation from https://stackoverflow.com/questions/49955097/how-do-i-add-a-user-when-im-using-alpine-as-a-base-image
ENV USER=windward \
	GROUPNAME=users \
	UID=99 \
	GID=100

#Check for the presence of an existing group and user. If either exists, remove them.
#RUN if getent passwd ${UID} >/dev/null; then \
#    deluser $(getent passwd ${UID} | cut -d: -f1); fi
#
#RUN if getent group ${GID} >/dev/null; then \
#    delgroup $(getent group ${GID} | cut -d: -f1); 

#RUN addgroup \
#    --gid "$GID" \
#    "$GROUPNAME"
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --ingroup "$GROUPNAME" \
    --no-create-home \
    --uid "$UID" \
    $USER

#Update the "FROM" image and add additional packages
RUN apk update
RUN apk upgrade
RUN apk --update --no-cache add mono bash curl unzip
RUN apk add --no-cache --virtual=.build-dependencies ca-certificates && cert-sync /etc/ssl/certs/ca-certificates.crt

#Create the windward-horizon directory
#COPY ./windward-horizon/. /windward-horizon
#RUN chown -R $USER:$GROUPNAME /windward-horizon
#RUN chmod +x /windward-horizon/windward-horizon.sh
COPY --chown=$USER:$GROUPNAME --chmod=777 ./windward-horizon/. /windward-horizon/
#COPY --chown=99:100 ./windward-horizon/. /windward-horizon

#Everything Below here will be run as the new user
USER $USER
CMD ["/windward-horizon/windward-horizon.sh"]
