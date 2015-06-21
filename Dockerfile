FROM bradrydzewski/base

WORKDIR /home/ubuntu
USER ubuntu

# we need to update nvm to install iojs
RUN cd /home/ubuntu/nvm && git pull origin master
RUN /bin/bash -c ". /home/ubuntu/nvm/nvm.sh && nvm install iojs-v2.3.0 && nvm use iojs-v2.3.0"

USER root
# Install postgresql client
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN sudo apt-get update

RUN sudo apt-get -y -q install postgresql-client-9.4
RUN sudo apt-get -y -q install perl liblocal-lib-perl libpq-dev cpanminus
RUN sudo apt-get -y clean

# Install Sqitch
RUN sudo cpanm -n App::Sqitch
RUN sudo cpanm -n DBD::Pg

USER ubuntu