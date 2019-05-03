# [Waste] Counter-Strike: Source GunGame Turbo Server

![Docker Build Status](https://img.shields.io/docker/cloud/build/threesquared/docker-css-server-gungame-turbo.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/threesquared/docker-css-server-gungame-turbo.svg)
[![](https://images.microbadger.com/badges/image/threesquared/docker-css-server-gungame-turbo.svg)](https://microbadger.com/images/threesquared/docker-css-server-gungame-turbo)

[![GameTracker](https://cache.gametracker.com/server_info/5.135.164.88:27015/b_350_20_692108_381007_ffffff_000000.png)](https://www.gametracker.com/server_info/5.135.164.88:27015/)

Dockerfile and configs to run a [Waste] CS:S server with GunGame and various other mods.

## Usage

```bash
$ docker run -d --name my-server \
             -p 27005:27005/udp -p 27015:27015 -p 27015:27015/udp \
             -e RCON_PASSWORD=mypass \
             threesquared/docker-css-server-gungame-turbo
```

## Included Mods

* [Metamod:Source v1.10.7](http://www.metamodsource.net/downloads.php/?branch=stable)
* [SourceMod v1.9.0](https://www.sourcemod.net/downloads.php?branch=stable)
* [NoBlock v1.4.2](https://forums.alliedmods.net/showthread.php?t=91617)
* [DeathMatch:SM v1.8.0](https://forums.alliedmods.net/showthread.php?p=929190)
* [GunGame v1.2.16.0](https://forums.alliedmods.net/showthread.php?t=93977)
* [Quake Sounds v3.5.0](https://forums.alliedmods.net/showthread.php?t=224316)
* [MapChooser Extended v1.10.2](https://forums.alliedmods.net/showthread.php?t=156974)
* [Show Damage v1.0.7](https://forums.alliedmods.net/showthread.php?p=763425)
* [HeadShot Explode v1.0](https://forums.alliedmods.net/showthread.php?p=862489)

## TODO

* Pick some better maps
* Speed boost on multiple kills
* Get rid of rounds?
* More hype sound effects
* Set up FastDL
* HLstatsX?
* Anti camp?
