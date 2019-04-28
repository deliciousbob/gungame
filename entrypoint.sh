#!/bin/bash

/home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/server +app_update 232330 +quit;

/home/steam/server/srcds_run -game cstrike +maxplayers 10 +map gg_simpsons_h1;
