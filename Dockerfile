FROM jwaldrip/rbenv
MAINTAINER Jason Waldrip <jason@waldrip.net>

# Set up the base image
ADD .ruby-version /.ruby-version
WORKDIR /
RUN rbenv setup

# Update Ruby Build
ONBUILD RUN cd $HOME/.rbenv/plugins/ruby-build && git pull origin master

# App Build Scripts
ONBUILD ADD . /app
ONBUILD WORKDIR /app
ONBUILD RUN if [ ! -e .ruby-version ] ; then ln -s /.ruby-version .ruby-version ; fi
ONBUILD RUN rbenv setup
