FROM cm2network/steamcmd

WORKDIR /home/steam

ADD ./entrypoint.sh entrypoint.sh

RUN mkdir /home/steam/server && \
    /home/steam/steamcmd/steamcmd.sh +login anonymous \
	+force_install_dir /home/steam/server \
	+app_update 232330 validate \
	+quit

RUN mkdir /home/steam/.steam/sdk32 && \
	ln -s /home/steam/server/bin/steamclient.so /home/steam/.steam/sdk32/steamclient.so

EXPOSE 27015

CMD /home/steam/entrypoint.sh
