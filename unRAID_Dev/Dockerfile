FROM alpine:latest

# Enviroment Values and Default Settings
ENV	WINDWARD_SERVER_NAME="Windward Horizon Server" \
	WINDWARD_SERVER_WORLD="World" \
	WINDWARD_SERVER_PORT=5123 \
	WINDWARD_SERVER_PUBLIC=0 \
	USER=windward \
	GROUPNAME=users \
	UID=99 \
	GID=100
	
EXPOSE $WINDWARD_SERVER_PORT

# Update
RUN	apk update && apk upgrade
RUN	apk --update --no-cache add mono bash curl unzip
RUN	apk add --no-cache --virtual=.build-dependencies ca-certificates && cert-sync /etc/ssl/certs/ca-certificates.crt
	
# Windward Horizon Server Setup and Install
RUN adduser -H -D -u $UID -G $GROUPNAME $USER
RUN	mkdir /windward-horizon
	
ADD http://www.tasharen.com/wh/WHServer.zip /windward-horizon/
ADD	https://raw.githubusercontent.com/EddCase/Windward-Horizon/refs/heads/master/Scripts/windward-horizon.sh /windward-horizon/

RUN	unzip /windward-horizon/WHServer.zip -d /windward-horizon/
RUN	chown -R $USER:$GROUPNAME /windward-horizon
RUN	chmod +x /windward-horizon/windward-horizon.sh
	
USER $USER
CMD	["/windward-horizon/windward-horizon.sh"]