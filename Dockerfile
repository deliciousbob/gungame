FROM cm2network/steamcmd

WORKDIR /home/steam

USER root

RUN apt-get update -y && \
	apt-get install -y unzip

USER steam

RUN mkdir /home/steam/server && \
    /home/steam/steamcmd/steamcmd.sh +login anonymous \
	+force_install_dir /home/steam/server \
	+app_update 232330 validate \
	+quit

RUN mkdir /home/steam/.steam/sdk32 && \
	ln -s /home/steam/server/bin/steamclient.so /home/steam/.steam/sdk32/steamclient.so

RUN wget -q https://mms.alliedmods.net/mmsdrop/1.10/mmsource-1.10.7-git968-linux.tar.gz && \
	tar -xzvf ./mmsource-1.10.7-git968-linux.tar.gz -C /home/steam/server/cstrike && \
	rm ./mmsource-1.10.7-git968-linux.tar.gz && \
	wget -q https://sm.alliedmods.net/smdrop/1.9/sourcemod-1.9.0-git6269-linux.tar.gz && \
	tar -xzvf ./sourcemod-1.9.0-git6269-linux.tar.gz -C /home/steam/server/cstrike && \
	rm ./sourcemod-1.9.0-git6269-linux.tar.gz && \
	wget -O /home/steam/sm_noblock.zip "https://forums.alliedmods.net/attachment.php?attachmentid=74064&d=1285431495" && \
	unzip -o /home/steam/sm_noblock.zip -d /home/steam/server/cstrike && \
	rm /home/steam/sm_noblock.zip && \
	wget -O /home/steam/sm_ggdm.zip "https://forums.alliedmods.net/attachment.php?attachmentid=108943&d=1346584450" && \
	unzip -o /home/steam/sm_ggdm.zip -d /home/steam/server/cstrike && \
	rm /home/steam/sm_ggdm.zip && \
	wget -O /home/steam/sm_gungame.zip "https://forums.alliedmods.net/attachment.php?s=716ef65609b491b4a34670e767887027&attachmentid=133712&d=1400696532" && \
	unzip -o /home/steam/sm_gungame.zip -d /home/steam/server/cstrike && \
	rm /home/steam/sm_gungame.zip && \
	wget -O /home/steam/quake_sounds.zip "https://forums.alliedmods.net/attachment.php?attachmentid=125461&d=1380903530" && \
	unzip -o /home/steam/quake_sounds.zip -d /home/steam/server/cstrike && \
	rm /home/steam/quake_sounds.zip && \
	wget -O /home/steam/mapchooser_extended.zip "https://forums.alliedmods.net/attachment.php?attachmentid=130293&d=1391630113" && \
	unzip -o /home/steam/mapchooser_extended.zip -d /home/steam/server/cstrike && \
	rm /home/steam/mapchooser_extended.zip && \
	mv /home/steam/server/cstrike/addons/sourcemod/plugins/gungame.smx /home/steam/server/cstrike/addons/sourcemod/plugins/disabled/ && \
	mv /home/steam/server/cstrike/addons/sourcemod/plugins/disabled/gungame_sdkhooks.smx /home/steam/server/cstrike/addons/sourcemod/plugins/

ADD ./cfg/ /home/steam/server/cstrike/cfg
ADD ./maps/ /home/steam/server/cstrike/maps
ADD ./entrypoint.sh entrypoint.sh

EXPOSE 27015
EXPOSE 27015/udp

CMD /home/steam/entrypoint.sh
