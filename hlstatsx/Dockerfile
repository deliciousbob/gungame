FROM startersclan/docker-hlstatsxce-daemon:latest

RUN apt-get update \
  && apt-get install -y \
  build-essential \
  cpanminus \
  && cpanm \
  Syntax::Keyword::Try \
  && apt-get purge --auto-remove -y \
  build-essential  \
  && rm -rf /var/lib/apt/lists/* /root/.cpan/ /root/.cpanm/

RUN apt-get update && apt-get install git -y \
  && git clone https://github.com/NomisCZ/hlstatsx-community-edition.git /hlstatsx-community-edition \
  && cd /hlstatsx-community-edition \
  && cp -rf /hlstatsx-community-edition/scripts/* /app \
  && find /app -type d -exec chmod 750 {} \; \
  && find /app -type f -exec chmod 640 {} \; \
  && find /app -type f -name '*.sh' -exec chmod 750 {} \; \
  && find /app -type f -name '*.pl' -exec chmod 750 {} \; \
  && find /app -type f -name 'run_*' -exec chmod 750 {} \; \
  && rm -rf /hlstatsx-community-edition \
  && apt-get purge --auto-remove -y git \
  && rm -rf /var/lib/apt/lists/*
