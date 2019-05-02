#!/bin/bash
set -e
trap '' TERM INT HUP

if [ "$1" == "update" ]; then
    /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/server +app_update 232330 +quit;
fi

/home/steam/server/srcds_run -game cstrike +maxplayers 16 +map gg_simpsons_h1 +hostname "$SERVER_HOSTNAME" +rcon_password "$RCON_PASSWORD";
