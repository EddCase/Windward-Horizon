FROM alpine:latest

# Enviroment Values and Default Settings
ENV WINDWARD_SERVER_NAME="Windward Horizon Server" \
    WINDWARD_SERVER_WORLD="World" \
    WINDWARD_SERVER_PORT=5123 \
    WINDWARD_SERVER_PUBLIC=0 \
	USER=windward \
	GROUPNAME=users \
	UID=99 \
	GID=100 \
	
EXPOSE $WINDWARD_SERVER_PORT

# Update
RUN apk update \
	apk upgrade \
	apk --update --no-cache add mono bash curl unzip \
	apk add --no-cache --virtual=.build-dependencies ca-certificates && cert-sync /etc/ssl/certs/ca-certificates.crt \
	
# Windward Horizon Server Setup and Install
RUN mkdir /windward-horizon \
	chown -R $USER:$GROUPNAME /windward-horizon
	
ADD http://www.tasharen.com/wh/WHServer.zip /windward-horizon/
	