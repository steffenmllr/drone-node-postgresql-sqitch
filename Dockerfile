FROM node:7
MAINTAINER Mllrsohn <support@mllrsohn.com>

RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main 9.6' > /etc/apt/sources.list.d/pgdg.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7FCC7D46ACCC4CF8
RUN apt-get update && apt-get install -y -q git-core perl liblocal-lib-perl libpq-dev cpanminus postgresql-client-9.6
RUN cpanm -n App::Sqitch && cpanm -n DBD::Pg
RUN npm i yarn -g
