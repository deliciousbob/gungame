FROM threesquared/docker-css-server

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
    mv /home/steam/server/cstrike/addons/sourcemod/plugins/gungame.smx /home/steam/server/cstrike/addons/sourcemod/plugins/disabled/ && \
    mv /home/steam/server/cstrike/addons/sourcemod/plugins/disabled/gungame_sdkhooks.smx /home/steam/server/cstrike/addons/sourcemod/plugins/ && \
    wget -O /home/steam/quake_sounds.zip "https://forums.alliedmods.net/attachment.php?attachmentid=125461&d=1380903530" && \
    unzip -o /home/steam/quake_sounds.zip -d Quake_Sounds_v3 && cp -r Quake_Sounds_v3/GameServer/* /home/steam/server/cstrike && rm -rf Quake_Sounds_v3 && \
    rm /home/steam/quake_sounds.zip && \
    wget -O /home/steam/mapchooser_extended.zip "https://forums.alliedmods.net/attachment.php?attachmentid=130293&d=1391630113" && \
    unzip -o /home/steam/mapchooser_extended.zip -d /home/steam/server/cstrike && \
    rm /home/steam/mapchooser_extended.zip && \
    wget -O /home/steam/sm_show_damage.zip "https://forums.alliedmods.net/attachment.php?attachmentid=60615&d=1267305028" && \
    unzip -o /home/steam/sm_show_damage.zip -d /home/steam/server/cstrike/addons/sourcemod && \
    rm /home/steam/sm_show_damage.zip && \
    wget -O /home/steam/server/cstrike/addons/sourcemod/plugins/HeadShotExplode.smx "http://www.sourcemod.net/vbcompiler.php?file_id=44798"

COPY ./cfg/ /home/steam/server/cstrike/cfg
COPY ./maps/ /home/steam/server/cstrike/maps
COPY ./sound/ /home/steam/server/cstrike/sound

CMD ["+maxplayers", "16", "+map", "aim_spacewar"]
