FROM julia:1.4.0-buster

ADD src /app/src
ADD Project.toml /app/

WORKDIR /app

ENTRYPOINT ["julia", "src/main.jl"]
