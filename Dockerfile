FROM node:7
MAINTAINER Mllrsohn <support@mllrsohn.com>

RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main 9.6' > /etc/apt/sources.list.d/pgdg.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7FCC7D46ACCC4CF8
RUN curl -sS http://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y -q git-core perl liblocal-lib-perl libpq-dev cpanminus postgresql-client-9.6 yarn
RUN cpanm -n App::Sqitch && cpanm -n DBD::Pg
