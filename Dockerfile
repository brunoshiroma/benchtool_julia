FROM julia:latest
ADD src /app/src
ADD Project.toml /app/

WORKDIR /app

ENTRYPOINT ["julia", "src/main.jl"]
