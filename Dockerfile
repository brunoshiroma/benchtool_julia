FROM julia:buster
ADD src /app/src
ADD Project.toml /app/

WORKDIR /app

ENTRYPOINT ["julia", "src/main.jl"]
