FROM julia:1.2.0-buster

ADD src /app/src
ADD Project.toml /app/

WORKDIR /app

RUN julia src/main.jl 2 99999
