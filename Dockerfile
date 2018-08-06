# Este docker é usado pelo bin/release para buildar
# a aplicação e gerar o  release e nada mais.

FROM elixir:1.6.0

# Distillery
ENV MIX_ENV prod
ENV REPLACE_OS_VARS true

RUN mix local.hex --force
RUN mix local.rebar --force

# create app folder into docker
RUN mkdir /app

# copy current folder of project into docker
COPY . /app

# set docker app folder as workdir
WORKDIR /app

RUN mix deps.get

VOLUME /app/_build/prod
